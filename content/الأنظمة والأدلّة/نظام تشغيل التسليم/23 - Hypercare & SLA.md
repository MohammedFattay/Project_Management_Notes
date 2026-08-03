---
title: "23 — Hypercare & SLA · الرعاية المكثّفة واتفاقية الخدمة"
aliases: [Hypercare Template, قالب الرعاية المكثفة, SLA Template, Exit Criteria]
type: قالب
stage: "7 · ما بعد الإطلاق"
system: "[[نظام تشغيل التسليم]]"
area: "[[Project Management]]"
tags: [إدارة-المشاريع, قيادة-التسليم, قالب, ERP, دعم]
excel_sheet: "Hypercare · SLA (ورقتان)"
status: لم يبدأ
---

> [!info] القالب 23 · المرحلة السابعة — ما بعد الإطلاق
> **متى تستخدمه:** من `Day 0` وحتى تحقّق `Exit Criteria`.
> **من يملكه:** **المورّد هو `Responsible`** (الصفّ الوحيد كذلك في [[17 - Client Responsibility RACI]]).
> **مخرجه:** استقرار + بداية قياس القيمة.

# Hypercare & SLA — الرعاية المكثّفة

## لماذا هذا القالب موجود؟

> [!success] القاعدة الذهبية
> **`Hypercare` ≠ `Support`. `Hypercare` استباقي · `Support` ردّ فعل.**

### الفرق التفصيلي

| `Support` عادي | `Hypercare` |
|---|---|
| ردّ فعل عند المشكلة | **متابعة استباقية** |
| شهر دعم عام | **أول أسبوعين مكثّفين** |
| `SLA` غير واضح | **`SLA` واضح** |
| لا `War Room` | **`War Room`** |
| لا يقيس القيمة | **يمهّد لقياس القيمة** |

| البند | `Hypercare` | `Support` |
|---|---|---|
| المدّة | **10–14 يوماً** | 2–4 أسابيع |
| الاجتماع | **يومي** | أسبوعي |
| `SLA Critical` | **4 ساعات** | عادي |
| `War Room` | **أول 5 أيام** | لا يوجد |
| الهدف | **تثبيت التشغيل** | تحسينات |

---

## أ) القالب — الأسابيع الأربعة

| الأسبوع | التركيز | `KPI` |
|---|---|---|
| **Week 1** | `Stabilization` | `Critical Bugs` |
| **Week 2** | `Adoption` | `Active Users` |
| **Week 3** | `Performance` | `Order Processing Time` |
| **Week 4** | **`Value Measurement`** | **`KPI Achievement`** |

> [!important] هذا الجدول هو الفكرة كلّها
> شهر الدعم التقليدي شهر انتظار للشكاوى. وهنا يتحوّل إلى **أربع مهامّ متسلسلة** تنتهي بقياس القيمة لا بانتهاء المدّة.
> ولاحظ التدرّج: **استقرار → تبنٍّ → أداء → قيمة**. لا يمكن قياس القيمة في الأسبوع الأول لأن النظام لم يستقرّ، ولا يُقاس التبنّي قبل الاستقرار لأن الناس تهرب من نظام غير مستقرّ.

> [!quote] من الشرائح — كيف نحوّله إلى `Value Closure`؟
> إذا كانت الخطة تنصّ على «شهر دعم فني»، فقسّمه إلى هذه الأربعة — **نفس المدّة، نتيجة مختلفة تماماً**.

---

## ب) القالب — `SLA`

| `Priority` | `Response` | `Resolution` |
|---|---|---|
| **`Critical`** | **1 ساعة** | **4 ساعات** |
| `High` | 4 ساعات | 24 ساعة |
| `Medium` | يوم 1 | 3 أيام |

> [!quote] الهدف من الـ`SLA`
> **منع انهيار الثقة بعد `Go-Live`.**

### نموذج `Hypercare` كامل (من الشرائح)

```
Duration: 2 weeks
Support Channels: WhatsApp · Ticketing
Daily Checkpoint: 10 AM
SLA:
  Critical: 4 hours
  Major:    24 hours
  Minor:    3 days
War Room: Active first 5 days
```

---

## ج) `Exit Criteria` — متى تنتهي `Hypercare`؟

> [!important] `Hypercare` تنتهي بمعيار لا بتاريخ
> - لا توجد `Critical Issues`.
> - المستخدم يعمل **بدون دعم مباشر**.
> - العمليات مستقرّة.
> - التقارير صحيحة.

### جدول الخروج التدريجي

| اليوم | المشاكل | القرار |
|---|---|---|
| `Day 1` | 2 `Critical` | **`War Room`** |
| `Day 2` | 1 `Critical` | `Fix` |
| `Day 3` | 0 `Critical` | `Stable` |
| `Day 5` | `Minor issues` | `Reduce support` |
| `Day 10` | مستقرّ | **`Exit Hypercare`** |

---

## القالب مملوءاً — [[حالة النور للتوزيع]]

| الأسبوع | التركيز | `KPI` |
|---|---|---|
| Week 1 | `Stabilization` | `Critical Bugs` |
| Week 2 | `Adoption` | `Active Users` |
| Week 3 | `Performance` | `Order Processing Time` |
| Week 4 | `Value Measurement` | `KPI Achievement` |

| `Priority` | `Response` | `Resolution` |
|---|---|---|
| `Critical` | 1h | 4h |
| `High` | 4h | 24h |
| `Medium` | Day 1 | 3 Days |

**المدّة المتّفق عليها في [[01 - Project Intake]]: 4 أسابيع.**

---

## كيف تقرأ الجداول — «ما بين السطور»

> [!warning] تعارض في `SLA Critical` بين المصدرين
> ورقة `SLA` في الـ Excel: **`Response` = 1 ساعة** و`Resolution` = 4 ساعات.
> شرائح `Hypercare`: **`SLA Critical` = 4 ساعات** بلا تفصيل.
> **التفسير:** الشرائح تذكر `Resolution` فقط، والـ Excel يفصل `Response` عن `Resolution`.
> **القاعدة:** لا تكتب `SLA` برقم واحد أبداً. «4 ساعات» بلا تحديد هل هي ردّ أم حلّ ستُقرأ من العميل بالمعنى الأشدّ ومن الفريق بالمعنى الأخفّ — والنزاع مضمون.

> [!tip] إضافة 1 — تعارض في المدّة أيضاً
> | المصدر | المدّة |
> |---|---|
> | [[01 - Project Intake]] و[[11 - Delivery Plan]] | **4 أسابيع** |
> | جدول مقارنة `Hypercare`/`Support` | **10–14 يوماً** |
> | نموذج `Hypercare` في الشرائح | **أسبوعان** |
>
> **التوفيق:** `Hypercare` **المكثّف** = 10–14 يوماً (`War Room` + اجتماع يومي)، ثم `Support` مخفَّف حتى نهاية الشهر لإتمام `Adoption` و`Value Measurement`. أي أن الأربعة أسابيع تشمل الاثنين — وليست كلّها `Hypercare` بالمعنى المكثّف.

> [!tip] إضافة 2 — `WhatsApp` كقناة دعم رسمية
> نموذج الشرائح يذكر `WhatsApp` صراحةً إلى جانب `Ticketing`. وهذا واقعي في السوق الخليجي وليس تساهلاً — **بشرط قاعدة واحدة:** كل ما يصل عبر `WhatsApp` يُسجَّل في `Ticketing` خلال ساعة. وإلا ضاع نصف بلاغات الأسبوع الأول ولم يظهر منها شيء في `Value Tracking`.

> [!tip] إضافة 3 — `Daily Checkpoint` في موعد ثابت
> «10 صباحاً» ليس تفصيلاً. الموعد الثابت يُنتج انضباطاً: المستخدمون يجمّعون ملاحظاتهم له، والفريق يستعدّ له، والـ`Sponsor` يعرف متى يسأل. أمّا الاجتماع «عند الحاجة» فيصبح اجتماع الأزمات فقط — وحينها تكون `Hypercare` قد فشلت في كونها استباقية.

## 🔗 روابط
[[Hypercare]] · [[SLA]] · [[22 - Go-Live Checklist & Go NoGo]] · [[24 - Value Tracking & Lessons Learned]] · [[17 - Client Responsibility RACI]] · [[05 - بناء نظام التسليم الكامل]]

## مصادر
- ورقتا `Hypercare` و`SLA` في ملف الـ Excel.
- شرائح المحاضرة الرابعة — القسم الحادي عشر (الشرائح 61–64).
- `Delivery plan.docx` — قسم `Hypercare Plan`.
- الوثيقة التفسيرية — القسم 25.
