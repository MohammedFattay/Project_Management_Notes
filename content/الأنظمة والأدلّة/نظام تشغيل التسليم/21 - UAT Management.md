---
title: "21 — UAT Management · إدارة اختبار قبول المستخدم"
aliases: [UAT Management Template, دورات UAT, UAT Cycles, نظام التدريب]
type: قالب
stage: "6 · الاختبار والإطلاق"
system: "[[نظام تشغيل التسليم]]"
area: "[[Project Management]]"
tags: [إدارة-المشاريع, قيادة-التسليم, قالب, ERP, اختبار]
excel_sheet: "UAT Management · UAT Metrics (ورقتان)"
status: لم يبدأ
---

> [!info] القالب 21 · المرحلة السادسة — الاختبار
> **متى تستخدمه:** يُخطَّط مع [[11 - Delivery Plan]] ويُنفَّذ بعد التدريب لا قبله.
> **من يملكه:** `QA Lead` + `Delivery Manager` — والتنفيذ مسؤولية **العميل** (`R` في [[17 - Client Responsibility RACI]]).
> **مخرجه:** `UAT Sign-off` — أحد شروط [[22 - Go-Live Checklist & Go NoGo]].

# UAT Management — إدارة اختبار القبول

## لماذا هذا القالب موجود؟

> [!quote] من الكتاب
> `UAT` **ليس فترة طويلة غير منظّمة — بل نظام جاهزية**.

> [!quote] من الشرائح
> `UAT` الطويل غير المنظّم يتحوّل إلى فوضى، لذلك نقسّمه إلى **دورات واضحة**.

> [!success] القاعدة الذهبية
> **المستخدم غير الجاهز = مشروع غير جاهز. والتدريب ليس جلسة — بل نظام جاهزية.**

---

## أ) رحلة التمكين — نظام التدريب

> [!important] التدريب يسبق `UAT` ولا يوازيه
> الخطأ الشائع: تدريب أثناء `UAT`، فيتحوّل الاختبار إلى تدريب عشوائي وتنهار نسبة النجاح.

| المرحلة | الهدف |
|---|---|
| `Overview Training` | فهم الصورة العامة |
| `Core Training` | تعلّم المهام اليومية |
| `Scenario-Based Training` | تطبيق سيناريوهات حقيقية |
| **`UAT Preparation`** | **تجهيز المستخدم للاختبار** |
| `UAT Coaching` | دعم أثناء الاختبار |
| `Go-Live Reinforcement` | تثبيت قبل الإطلاق |
| `Hypercare Training` | دعم بعد التشغيل |

---

## ب) القالب — دورات `UAT` الثلاث

| `Cycle` | الهدف | المخرَج | `KPI` |
|---|---|---|---|
| **1 · `Discovery`** | اكتشاف المشاكل | `Issue List` | `Bugs Found` |
| **2 · `Stabilization`** | إصلاح وإعادة اختبار | `Reduced Bugs` | `Retest Success` |
| **3 · `Readiness`** | تأكيد الجاهزية | **`UAT Sign-off`** | `Pass Rate` |

> [!tip] إضافة — لماذا `KPI` كل دورة مختلف؟
> هذا أذكى ما في التصميم: **في الدورة الأولى كثرة الأخطاء نجاح لا فشل.**
> - `Cycle 1` يقاس بـ`Bugs Found` → كلّما وجدت أكثر كان أفضل.
> - `Cycle 2` يقاس بـ`Retest Success` → هل الإصلاح نجح فعلاً؟
> - `Cycle 3` يقاس بـ`Pass Rate` → وهنا فقط تصير الأخطاء مشكلة.
>
> ولو قِسْتَ الدورات الثلاث بـ`Pass Rate` وحده لعاقبتَ الفريق على اكتشاف مبكّر مفيد — ولدفعت المختبِرين إلى إخفاء الملاحظات.

---

## ج) القالب — مؤشّرات `UAT`

| `KPI` | الهدف |
|---|---|
| `Pass Rate` | **85%+** |
| `Critical Bugs` | **0** |
| `Retest Success` | 90% |
| `User Participation` | 90% |

**مؤشّرات إضافية من الشرائح:** `User Engagement` · `Open Issues`.

---

## القالب مملوءاً — [[حالة النور للتوزيع]]

| `KPI` | الهدف | الفعلي | الحالة |
|---|---|---|---|
| `Pass Rate` | 85%+ | **81%** | 🟡 Amber |
| `Critical Bugs` | 0 | **2** | 🔴 Red |
| `User Participation` | 90% | ضعيف (`Lessons Learned`) | 🔴 Red |

**النتيجة:** `UAT = Amber` في [[20 - Project Health Report]] → الإجراء: `Additional Cycle`.

---

## كيف تقرأ الجداول — «ما بين السطور»

> [!important] `User Participation` هو المؤشّر الذي يُهمَل ويقرّر المصير
> ورقة `Lessons Learned` تسجّل: **«`UAT` — ضعف المشاركة — السبب: ضعف `Ownership` — التوصية: تدريب مبكّر»**.
> أي أن `Pass Rate` = 81% لم ينخفض لأن النظام سيّئ، بل **لأن من اختبره لم يكن يملك القضية**. ومعالجة الأخطاء وحدها لن ترفع الرقم — لأن السبب ليس في الأخطاء.
> **القاعدة:** إن كانت `User Participation` منخفضة، فكل مؤشّرات `UAT` الأخرى **غير موثوقة** — لأن العيّنة نفسها غير تمثيلية.

> [!tip] إضافة 1 — `Critical Bugs = 0` هو الشرط الوحيد غير القابل للتفاوض
> لاحظ أن كل المؤشّرات الأخرى نِسَب (85%، 90%) إلا هذا: **صفر مطلق**. لأنه الوحيد الذي يظهر في [[19 - Early Warning Dashboard]] بحدّ `> 0` وإجراء `Freeze Release`، وفي [[22 - Go-Live Checklist & Go NoGo]] كشرط `System Ready`.
> ومع ذلك، فقرار الحالة كان `Conditional Go` **بشرط إغلاق الأخطاء الحرجة أو توفير `Workaround`** — وهذا هو التطبيق العملي للفرق بين «صفر أخطاء» و«صفر أخطاء **مانعة**».

> [!tip] إضافة 2 — ترتيب `UAT` بعد التدريب لا قبله
> في `Delivery plan.docx` خطة تدريب مستقلّة تسبق `UAT` صراحةً: `Overview` → `Core Training` → `Scenario Training` → **`UAT Training`**.
> والسبب: المستخدم الذي يتعلّم أثناء الاختبار **يسجّل جهله كأخطاء في النظام**. فترتفع `Bugs Found` بلا معنى وتنهار الثقة بالنظام قبل إطلاقه.

> [!tip] إضافة 3 — كم تستغرق الدورات الثلاث؟
> [[11 - Delivery Plan]] يخصّص **4 أسابيع** لـ`UAT` بثلاث دورات، بينما `Delivery plan.docx` يخصّص **6 أسابيع**.
> **قاعدة عملية:** وزّعها 2 + 2 + 1 أسبوع مع أسبوع احتياطي — لأن `Cycle 1` دائماً يكشف أكثر من المتوقّع، و`Cycle 3` يجب ألّا يُضغط لأنه مصدر `Sign-off`.

## 🔗 روابط
[[UAT]] · [[22 - Go-Live Checklist & Go NoGo]] · [[19 - Early Warning Dashboard]] · [[20 - Project Health Report]] · [[17 - Client Responsibility RACI]] · [[24 - Value Tracking & Lessons Learned]] · [[04 - التقدير الواقعي وضبط النطاق]]

## مصادر
- ورقتا `UAT Management` و`UAT Metrics` في ملف الـ Excel.
- شرائح المحاضرة الرابعة — «نظام التدريب» و`UAT` (الشريحتان 51–52).
- `Delivery plan.docx` — أقسام `Training Plan` و`UAT Plan (Cycles)`.
- الوثيقة التفسيرية — القسم 23.
