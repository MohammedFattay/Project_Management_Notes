---
title: "11 — Delivery Plan · خطة التسليم"
aliases: [Delivery Plan Template, خطة التسليم, قالب الخطة]
type: قالب
stage: "4 · التخطيط وضبط النطاق"
system: "[[نظام تشغيل التسليم]]"
area: "[[Project Management]]"
tags: [إدارة-المشاريع, قيادة-التسليم, قالب, ERP]
excel_sheet: "Delivery Plan (+ Delivery plan.docx)"
status: لم يبدأ
---

> [!info] القالب 11 · المرحلة الرابعة — التخطيط
> **متى تستخدمه:** بعد [[10 - PFRE Decision Model]] — أي بعد أن تعرف ما يدخل `Phase 1`.
> **من يملكه:** `Delivery Manager`.
> **مخرجه:** وثيقة التحكّم المرجعية التي تُقاس عليها كل القرارات اللاحقة.

# Delivery Plan — خطة التسليم

## لماذا هذا القالب موجود؟

> [!success] القاعدة الذهبية
> **الخطة الجيدة لا تشرح ماذا سنفعل فقط — بل كيف سنتحكّم في المشروع.**

> [!quote] من الكتاب
> `Delivery Plan` ليست `Timeline` فقط، بل تحتوي على: `Outcomes` · `Risks` · `Governance` · `Decision Points` · `Go-Live Strategy`.

### الفرق بين خطة المشروع ونظام التسليم

| خطة مشروع تقليدية | نظام تسليم احترافي |
|---|---|
| `Timeline` | `Timeline` + `Governance` |
| مهام | قيمة + مخرجات |
| تاريخ إطلاق | **قرار جاهزية** |
| تدريب | رحلة تمكين المستخدم |
| `UAT` طويل | `UAT Cycles` |
| `Risk Days` | `Buffer` + `Risk System` |
| تقرير حالة | [[20 - Project Health Report\|Project Health Report]] |
| دعم فني | [[23 - Hypercare & SLA\|Hypercare]] + `Value Tracking` |

> [!quote] الرسالة
> **نحن لا نلغي الخطة — نحن نضيف لها طبقة قيادة وتحكّم.**

---

## القالب — الهيكل العشري

| القسم | ماذا نكتب؟ |
|---|---|
| `Purpose` | لماذا يوجد المشروع؟ |
| `Business Outcomes` | ما النتائج القابلة للقياس؟ (من [[05 - Business Outcomes & KPIs]]) |
| `Value Streams` | ما تدفّقات القيمة؟ (من [[06 - Value Streams]]) |
| `Scope & Phases` | ما داخل وخارج النطاق؟ (من [[12 - Scope Baseline]]) |
| `PFRE Estimation` | ما سبب التقدير؟ (من [[09 - PFRE Estimation]]) |
| `Key Milestones` | ما المحطّات الحاكمة؟ |
| `Decision Points` | أين البوّابات التي لا تُعبَر بلا قرار؟ |
| `Risk Buffer` | كم الاحتياطي ولماذا؟ |
| `Governance Model` | كيف نتابع ونقرّر؟ (من [[16 - Governance Model]]) |
| `Go-Live Approach` | كيف نطلق؟ (من [[22 - Go-Live Checklist & Go NoGo]]) |

---

## جدول المراحل (فارغ)

| المرحلة | الأنشطة | المخرجات | المدة |
|---|---|---|---|
| | | | |

---

## القالب مملوءاً — [[حالة النور للتوزيع]]

| المرحلة | الأنشطة | المخرجات | المدة |
|---|---|---|---|
| `Discovery` | `Workshops` + `VSM` | `Requirements Pack` | 3 أسابيع |
| `Design` | `Workflow Design` | `Approved Design` | أسبوعان |
| `Build` | `Configuration` + `Development` | `Configured System` | 6 أسابيع |
| `Data` | `Cleansing` + `Migration` | `Validated Data` | 3 أسابيع |
| `Training` | `User Training` | `Users Ready` | 3 أسابيع |
| `UAT` | **3 `Cycles`** | `Signed UAT` | 4 أسابيع |
| `Go-Live` | `Final Migration` | `Production` | أسبوع |
| `Hypercare` | `Stabilization` | **`Value Tracking`** | 4 أسابيع |

**الإجمالي: 26 أسبوعاً.**

---

## كيف تقرأ الجدول — «ما بين السطور»

> [!warning] تناقض يجب أن تنتبه له
> مجموع مراحل هذا الجدول **26 أسبوعاً**، بينما ورقة `PFRE Summary` تعطي **35 أسبوعاً** للحالة نفسها. السبب أن جدول المراحل مبنيّ على تقديرات نمطية لا على مخرجات `PFRE`.
> **القاعدة:** خطة المراحل يجب أن تُشتقّ من `Realistic Duration` لا أن تُكتب بالتوازي معه. راجع [[_جدول مطابقة الأرقام]].

> [!tip] إضافة 1 — المخرَج الأخير هو ما يميّز هذه الخطة
> لاحظ مخرج `Hypercare`: ليس «نظام مستقرّ» بل **`Value Tracking`**. أي أن الخطة **لا تنتهي بالتسليم بل بإثبات القيمة**. هذا الصفّ وحده يفرّق بين `Project Plan` و`Delivery Plan`.

> [!tip] إضافة 2 — نسب المراحل تكشف فلسفة الخطة
> | الكتلة | المدة | النسبة |
> |---|---|---|
> | البناء (`Design` + `Build`) | 8 أسابيع | **31%** |
> | التهيئة البشرية والبياناتية (`Data` + `Training`) | 6 أسابيع | **23%** |
> | الجاهزية والاستقرار (`UAT` + `Go-Live` + `Hypercare`) | 9 أسابيع | **35%** |
> | الاستكشاف (`Discovery`) | 3 أسابيع | 11% |
>
> **أقل من ثلث الخطة برمجة.** وهذا هو التجسيد العملي لقاعدة «ERP مشروع تشغيل لا مشروع بناء». الخطة التي تعطي البناء 70% خطةُ مشروع تقني لا خطة تسليم.

> [!tip] إضافة 3 — كيف تغيّر خطة قائمة دون إعادة كتابتها؟
> لست مضطراً لرمي خطة العميل. غيّر **العناوين** فقط:
> | قبل | بعد |
> |---|---|
> | جلسات `Training` | `Training System` |
> | فترة `UAT` طويلة | `UAT Cycles` |
> | تاريخ `Go-Live` | `Go-Live Decision` |
> | `Risk Days` | `Buffer` + `Risk System` |
> | شهر `Support` | `Stabilization` + `Adoption` + `Value` |
> | `Progress` فقط | `Project Health Report` |
>
> **نفس شكل الخطة يبقى — لكن نضيف داخله عقل التسليم.**

---

## نموذج خطة كاملة — من `Delivery plan.docx`

الوثيقة تعطي هيكلاً أوسع يصلح كقالب مرجعي (لحالة شركة توزيع مواد غذائية):

`هدف المشروع` → `Business Outcomes` → `Value Streams` → `Scope Definition (In / Out)` → `PFRE Estimation` → `Timeline` → `Training Plan` → `UAT Plan (Cycles)` → `Risk Management (RAID Summary)` → `Early Warning Indicators` → `Governance Model` → `Decision Framework` → `Change Management` → `Data Plan` → `Go-Live Strategy` → `Go-Live Execution (Day -3 / -1 / 0 / +1)` → `Hypercare Plan` → `Value Measurement` → `Project Health Report`

> [!tip] `Go-Live Execution` — الجزء الوحيد غير الموجود في أي مصدر آخر
> | الخطوة | النشاط |
> |---|---|
> | `Day -3` | `Final Data Load` |
> | `Day -1` | `System Freeze` |
> | `Day 0` | `Go-Live` |
> | `Day +1` | `Monitoring` |
>
> جدول بسيط لكنه يمنع أشيع خطأ في يوم الإطلاق: **تحميل البيانات النهائي في نفس اليوم**.

> [!warning] لا تقتبس أرقام تقدير `Delivery plan.docx`
> الوثيقة تستخدم منظومة تقدير مبسّطة مختلفة (`Process | Fit/Gap | Multipliers | Velocity | Score`) لعميل مختلف. **استخدمها كقالب لشكل الخطة لا كمصدر أرقام.** انظر [[_جدول مطابقة الأرقام]].

## 🔗 روابط
[[12 - Scope Baseline]] · [[16 - Governance Model]] · [[09 - PFRE Estimation]] · [[22 - Go-Live Checklist & Go NoGo]] · [[24 - Value Tracking & Lessons Learned]] · [[05 - بناء نظام التسليم الكامل]] · [[حالة النور للتوزيع]]

## مصادر
- ورقة `Delivery Plan` في ملف الـ Excel.
- `Delivery plan.docx` — الهيكل الكامل بأقسامه الـ19.
- شرائح المحاضرة الرابعة — القسم التاسع «Delivery Plan».
- الوثيقة التفسيرية — القسم 17.
