<#
    sync.ps1 — مزامنة المحتوى المنشور من فولت أوبسيديان إلى موقع Quartz

    الاستعمال:
      .\sync.ps1                     نسخ المحتوى فقط
      .\sync.ps1 -Serve              نسخ ثم معاينة محلية على http://localhost:8080
      .\sync.ps1 -Push               نسخ ثم بناء ثم دفع — إلى المستودعين معًا
      .\sync.ps1 -Push -SiteOnly     الموقع وحده، للإصلاحات الخاصّة بالنشر

    و-Push يشغّل check-custom.ps1 قبل الدفع، فلا يُنشر ما سقط منه تخصيص.

    المستودعان منفصلان عمدًا:
      D:\Obsidian_Vault  →  obsidian-vault              (خاص · الفولت كاملًا)
      D:\quartz-site     →  Project_Management_Notes    (عام  · مجلد واحد)

    والدفع إلى الاثنين هو الأصل لأن كل تعديل على محتوى "Project Management"
    مصدره الفولت، فبقاؤه فيه غير مدفوع يجعل النسخة العامة أحدث من الخاصة.
    ويُستثنى ما لا يخصّ الفولت أصلًا — كإعداد Quartz والثيم — فـ SiteOnly له.
    (القاعدة 15 في CLAUDE.md)

    ما يُنشر: مجلد "Project Management" وحده. وما عداه يبقى خاصًّا.
#>
param(
    [switch]$Serve,
    [switch]$Push,
    [switch]$SiteOnly,
    [string]$Message = "sync: تحديث المحتوى من الفولت"
)

$ErrorActionPreference = "Stop"

$Vault   = "D:\Obsidian_Vault"
$Source  = Join-Path $Vault "Project Management"
$Site    = "D:\quartz-site"
$Content = Join-Path $Site "content"
$Extra   = Join-Path $Site "site-files"

if (-not (Test-Path -LiteralPath $Source)) { throw "مجلد المصدر غير موجود: $Source" }

# ── 1. مطابقة content/ بمجلد المصدر ───────────────────────────────
# /MIR يحذف من الوجهة ما حُذف من المصدر، فتبقى النسخة مطابقة لا متراكمة.
Write-Host "→ نسخ المحتوى من الفولت..." -ForegroundColor Cyan
robocopy $Source $Content /MIR /NFL /NDL /NJH /NJS /NP | Out-Null
# robocopy يرجع 0-7 عند النجاح (1 = نُسخت ملفات)، و8 فما فوق عند الفشل
if ($LASTEXITCODE -ge 8) { throw "فشل robocopy برمز $LASTEXITCODE" }
$global:LASTEXITCODE = 0   # حتى لا يورّث السكربت رمز نجاح robocopy كأنه فشل

# ── 2. لوحة التقدّم: لا تُنشر ─────────────────────────────────────
# «لوحة التقدّم.base» في جذر الفولت أداة تتبّع شخصية تعرض حالة إنجازك في كل
# ملاحظة، فلا تُنسخ. وأثر ذلك أن تسعة ملفات تشير إليها بـ [[لوحة التقدّم.base]]
# تحمل روابط بلا وجهة. ولنشرها: أعِد سطر النسخ التالي.
#   Copy-Item -LiteralPath (Join-Path $Vault "لوحة التقدّم.base") -Destination $Content -Force

# ── 3. ملفات تخصّ الموقع لا الفولت ────────────────────────────────
# تُنسخ بعد المطابقة لأن /MIR كان سيحذفها.
if (Test-Path -LiteralPath $Extra) {
    Copy-Item -Path (Join-Path $Extra '*') -Destination $Content -Recurse -Force
}

$Count = (Get-ChildItem -LiteralPath $Content -Recurse -Filter *.md -File | Measure-Object).Count
Write-Host "✓ $Count ملاحظة في content/" -ForegroundColor Green

# ── 4. المعاينة أو النشر ──────────────────────────────────────────

function Publish-Repo {
    <#
        يثبّت ما لم يُثبَّت، ثم يدفع إن كان المستودع متقدّمًا على البعيد.

        والشرطان منفصلان عمدًا: قياس الحاجة إلى الدفع بوجود تغييرات غير
        مثبَّتة يترك التثبيتات القديمة غير مدفوعة إلى الأبد — وهو ما وقع
        فعلًا أول مرة. فالحكم لـ rev-list لا لـ status.
    #>
    param([string]$Name, [switch]$Fatal)

    git add -A
    if (git status --porcelain) { git commit -m $Message | Out-Null }

    # الفرع بلا مرجع بعيد متتبَّع يجعل @{u} تفشل، فيقرأ السكربت الفشل صفرًا
    # ويعلن «لا شيء يُدفع» وهو متقدّم بتثبيتات. وهذا وقع فعلًا: بقي المستودع
    # العام متأخّرًا بثلاثة تثبيتات والتقرير يقول إن كل شيء تمّ. فيُفحص أوّلًا،
    # ويُوقَف كل شيء إن غاب — فخطأ إعداد صريح خيرٌ من نجاح كاذب.
    $tracked = (git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>$null)
    if ($LASTEXITCODE -ne 0 -or -not $tracked) {
        throw "${Name}: الفرع بلا مرجع بعيد متتبَّع، فلا يُعرف كم تقدّم. أصلحه بـ: git branch --set-upstream-to=origin/main main"
    }

    $ahead = [int](git rev-list --count "$tracked..HEAD")

    if ($ahead -eq 0) {
        Write-Host "${Name}: لا شيء يُدفع" -ForegroundColor Yellow
        return
    }

    git push
    if ($LASTEXITCODE -ne 0) {
        if ($Fatal) { throw "فشل دفع $Name — أُوقف كل شيء قبل أن يتقدّم مستودع على الآخر" }
        Write-Host "✗ فشل دفع $Name" -ForegroundColor Red
        return
    }
    Write-Host "✓ دُفع $Name ($ahead تثبيتًا)" -ForegroundColor Green
}

Set-Location $Site

# من هنا فصاعدًا تُستدعى أوامر خارجية (npx و git)، وكلاهما يكتب إشعاراته
# الاعتيادية إلى stderr. ومع ErrorActionPreference = Stop تعامل PowerShell
# ذلك فشلًا فتُجهض السكربت قبل الدفع. فيُرخى الضبط هنا، ويُعتمد على فحص
# $LASTEXITCODE صراحةً — وهو الحكم الصحيح على نجاح أمر خارجي.
$ErrorActionPreference = "Continue"

if ($Serve) {
    Write-Host "→ معاينة على http://localhost:8080 (Ctrl+C للإيقاف)" -ForegroundColor Cyan
    npx quartz build --serve
    return
}

if ($Push) {
    # ── بوّابة الخصوصية ───────────────────────────────────────────
    # ما يُنشر لا يُسترجَع: مسار جهاز أو اسم عميل يبقى في تاريخ المستودع العام
    # ولو حُذف بعد دقيقة. فيُفحص المحتوى المُطابَق قبل البناء لا بعده، لأن
    # الوقوف هنا مجّاني والوقوف بعد النشر مستحيل. (CLAUDE.md 15/د و16)
    Write-Host "→ فحص الخصوصية (مسارات بيئة التطوير)..." -ForegroundColor Cyan
    python (Join-Path $Vault ".claude\skills\vault-audit\scripts\audit.py") `
        --root $Content --only paths
    if ($LASTEXITCODE -ne 0) {
        throw "مسار بيئة تطوير في المحتوى — أُوقف النشر قبل أن يصير في تاريخ المستودع العام"
    }

    # ── بوّابة الترتيب ────────────────────────────────────────────
    # الترتيب لا يُكسر بضجيج بل بصمت: ملفّان يدّعيان الموضع نفسه، أو عنوان
    # يقول «الفصل 06» في ملفٍ موضعه الخامس. ولا يظهر ذلك في بناء ولا في
    # رابط، بل في عين قارئ يقرأ السابع قبل السادس. (CLAUDE.md 15/و)
    Write-Host "→ فحص ترتيب الملفات..." -ForegroundColor Cyan
    # الوسيط الفارغ يُكتب `--glossary=` رمزًا واحدًا لا رمزين: فـ PowerShell 5.1
    # يُسقط `""` قبل أن يصل إلى العملية، فيقرأ argparse خيارًا بلا قيمة ويخرج
    # بخطأ استعمال — فتقرؤه هذه البوّابة «ترتيبًا مكسورًا» وتوقف نشرًا سليمًا.
    python (Join-Path $Vault ".claude\skills\vault-audit\scripts\audit.py") `
        --root $Content --only ordering --glossary=
    if ($LASTEXITCODE -ne 0) {
        throw "ترتيب مكسور في المحتوى — أُوقف النشر قبل أن يُقرأ الجزء السابع قبل السادس"
    }

    # يُبنى قبل الدفع عمدًا: فشل البناء محليًّا أرخص من نشرة مكسورة
    Write-Host "→ بناء الموقع..." -ForegroundColor Cyan
    npx quartz build
    if ($LASTEXITCODE -ne 0) { throw "فشل البناء — لم يُدفع شيء" }

    # هذا المستودع فرعٌ من Quartz، وأخطر ما يصيبه سحبٌ من upstream يعيد ملفًّا
    # إلى أصله فيُلغي تخصيصًا بلا ضجيج — فيبني بنجاح ويخرج مكسورًا. ويُفحص
    # بعد البناء لا قبله لأنّ بعض الفحوص تقع على الناتج نفسه لا على الإعداد.
    Write-Host "→ فحص التخصيصات..." -ForegroundColor Cyan
    & (Join-Path $Site "check-custom.ps1") -Quiet
    if ($LASTEXITCODE -ne 0) { throw "سقط تخصيص — أُوقف النشر. شغّل .\check-custom.ps1 للتفصيل" }
    Write-Host "✓ التخصيصات قائمة" -ForegroundColor Green

    Publish-Repo -Name "الموقع" -Fatal
    Write-Host "  يُعاد بناء الموقع على GitHub خلال 3–4 دقائق" -ForegroundColor DarkGray

    # ── 5. الفولت الخاص ───────────────────────────────────────────
    # الأصل أن يُدفع معه، فمصدر المحتوى هو الفولت لا content/.
    Set-Location $Vault
    if ($SiteOnly) {
        $pending = (git status --porcelain | Measure-Object).Count
        Set-Location $Site
        if ($pending -gt 0) {
            Write-Host "تنبيه: في الفولت الخاص $pending تغييرًا لم يُدفع (تخطّيته بـ -SiteOnly)." -ForegroundColor Yellow
        }
    } else {
        Publish-Repo -Name "الفولت الخاص"
        Set-Location $Site
    }
}
