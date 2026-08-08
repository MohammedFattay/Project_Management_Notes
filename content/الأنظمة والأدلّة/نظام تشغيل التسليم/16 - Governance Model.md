---
title: "16 — Governance Model · نموذج الحوكمة"
aliases:
  - Governance Model
  - نموذج الحوكمة
type: قالب
stage: "5 · التنفيذ والحوكمة"
system: "[[نظام تشغيل التسليم]]"
area: "[[Project Management]]"
tags: [إدارة-المشاريع, قيادة-التسليم, قالب, ERP, حوكمة]
excel_sheet: "Governance"
status: لم يبدأ
---

> [!info] القالب 16 · المرحلة الخامسة — الحوكمة
> **متى تستخدمه:** يُعتمد مع [[11 - Delivery Plan]] ويبدأ من الأسبوع الأول.
> **من يملكه:** `Delivery Manager` — ورئاسة `Steering` للـ`Sponsor`.
> **مخرجه:** إيقاع قرار ثابت يمنع تراكم `Decision Delay`.

# Governance Model — نموذج الحوكمة

## لماذا هذا القالب موجود؟

> [!quote] من الكتاب
> `Governance` **تحوّل الاجتماعات إلى أدوات تحكّم**.

> [!quote] من الوثيقة التفسيرية
> `Governance` تحوّل الاجتماعات إلى أدوات قرار، والعميل يصبح **جزءاً من نظام التسليم لا متلقّياً سلبياً**.

---

## القالب (فارغ)

| الاجتماع | التكرار | الحضور | جدول الأعمال الثابت | المخرَج |
|---|---|---|---|---|
| | | | | |

**`Decision Framework` — من يقرّر ماذا؟**

| نوع القرار | المالك | المهلة (`SLA`) |
|---|---|---|
| | | |

---

## القالب مملوءاً — [[حالة النور للتوزيع]]

### أ) الاجتماعات وجداول أعمالها (من ملف الـ Excel)

| الاجتماع | العناصر الثابتة |
|---|---|
| **`Weekly Review`** | `Delivery Status` · `RAID` · `Decisions Required` · `UAT Readiness` · `Escalations` |
| **`Steering Committee`** | `Budget Risk` · `Timeline Risk` · `Critical Decisions` · `Vendor Escalations` |

### ب) الإيقاع الكامل (من `Delivery plan.docx`)

| الاجتماع | التكرار |
|---|---|
| `Daily Standup` | يومي |
| `Weekly Review` | أسبوعي |
| `Steering Committee` | كل أسبوعين |

### ج) `Decision Framework` — ملكية القرار

| القرار | المالك |
|---|---|
| `Scope` | **`Sponsor`** |
| `Process` | **`Business Owner`** |
| `Technical` | **`Tech Lead`** |

---

## كيف تقرأ الجداول — «ما بين السطور»

> [!important] الفرق الجوهري بين الاجتماعين
> لاحظ أن جداول الأعمال **لا تتقاطع في بند واحد**:
> | `Weekly Review` | `Steering Committee` |
> |---|---|
> | تشغيلي — ماذا يحدث الآن؟ | استراتيجي — ما الذي يهدّد المشروع؟ |
> | `RAID` كاملاً | `Budget Risk` + `Timeline Risk` فقط |
> | `Decisions Required` | `Critical Decisions` فقط |
> | `Escalations` تُرفع منه | `Vendor Escalations` تُحسم فيه |
>
> **القاعدة:** إن وجدت البندين متطابقين فأحد الاجتماعين زائد. والاجتماع الزائد ليس محايداً — بل يستهلك وقت الـ`Sponsor` ويُضعف حضوره حين تحتاجه فعلاً.

> [!tip] إضافة 1 — البند الأهمّ في `Weekly Review` هو `Decisions Required`
> ليس «ما أنجزناه» بل **«ما ننتظره منكم»**. وهذا البند وحده يحوّل الاجتماع من عرض إلى مقصلة قرار.
> **الصيغة العملية:** ابدأ الاجتماع الأسبوعي بقائمة القرارات المعلّقة ومهلها من [[15 - Decision Log]] — لا بشرائح التقدّم. ولن يتكرّر أكثر من مرّتين قبل أن يبدأ العميل بالتحضير.

> [!tip] إضافة 2 — `Decision SLA` هو العمود المفقود من جدول الملكية
> جدول `Decision Framework` يحدّد **من** يقرّر ولا يحدّد **متى**. أضِف عمود المهلة:
> | القرار | المالك | `SLA` مقترح |
> |---|---|---|
> | `Scope` | `Sponsor` | 3 أيام عمل |
> | `Process` | `Business Owner` | 48 ساعة |
> | `Technical` | `Tech Lead` | 24 ساعة |
>
> وبدون هذا العمود يظلّ `Decision Delay > 48h` مؤشّراً بلا مرجع — إذ **بأي معيار تأخّر القرار إن لم يُحدَّد له موعد أصلاً؟**
> راجع الاستراتيجية السادسة في [[12 - Scope Baseline]]: «أكبر سبب للفوضى هو تأخّر العميل».

> [!warning] الحوكمة الضعيفة تُسعَّر في التقدير
> `Decision Governance = Red` في [[02 - Readiness Assessment]] ترجمتها **+0.4** في [[Reality Factor]] — أي **زيادة 20% في مدة المشروع كاملاً**.
> اعرض هذا الرقم على الـ`Sponsor` صراحةً: «غياب `SLA` للقرارات يكلّفكم سبعة أسابيع إضافية». فالحوكمة حين تُسعَّر تُعتمد.

---

## مسار التصعيد (`Escalation Path`)

| المستوى | متى؟ | إلى من؟ |
|---|---|---|
| 1 | تجاوز `SLA` القرار | مالك القرار مباشرة |
| 2 | تجاوز 48 ساعة إضافية | `Steering Committee` |
| 3 | خطر على `Go-Live` | **`Executive Sponsor`** |

> [!tip] إضافة — التصعيد ليس شكوى
> صِغه دائماً بلغة الأثر لا بلغة اللوم: **«قرار هيكل الحسابات متأخّر 4 أيام؛ كل يوم إضافي يؤخّر `UAT` يوماً ويكلّف 6,600 ريال من خسارة `Order to Cash`.»**
> الرقم من [[07 - Financial Loss Analysis]] (200,000 ÷ 30 يوماً). والتصعيد المُسعَّر يُستجاب له؛ والتصعيد المشتكي يُؤجَّل.

## 🔗 روابط
[[Steering Committee]] · [[15 - Decision Log]] · [[17 - Client Responsibility RACI]] · [[19 - Early Warning Dashboard]] · [[20 - Project Health Report]] · [[SLA]] · [[21 - Stakeholder Communication]] · [[05 - بناء نظام التسليم الكامل]]

## مصادر
- ورقة `Governance` في ملف الـ Excel.
- `Delivery plan.docx` — أقسام `Governance Model` و`Decision Framework`.
- شرائح المحاضرة الرابعة — قسم `Governance`.
- الوثيقة التفسيرية — القسم 20.
