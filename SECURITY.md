# Security Policy

repo นี้เป็นแอปที่สร้างบน [pstack](https://github.com/willpower-institute/pstack)

## แจ้งช่องโหว่ยังไง

**อย่าเปิด issue สาธารณะ** — ใช้ **Private vulnerability reporting** ของ GitHub แทน

> แท็บ **Security** → **Report a vulnerability**

ถ้าช่องโหว่อยู่ใน framework ไม่ใช่โค้ดของแอปนี้ ให้แจ้งที่
[pstack/security](https://github.com/willpower-institute/pstack/security) แทน
จะได้แก้ที่ต้นทางและกระทบทุกแอปที่ใช้ร่วมกัน

## เวอร์ชัน pstack ที่แอปนี้ผูกอยู่

ดูค่า `PSTACK_REF` ใน `.env.example` — ช่องโหว่ของ pstack เวอร์ชันนั้นมีผลกับแอปนี้ด้วย
ดู [CHANGELOG ของ pstack](https://github.com/willpower-institute/pstack/blob/main/CHANGELOG.md)
ว่าเวอร์ชันที่ผูกอยู่ตกหล่นการแก้อะไรไปบ้าง

## เราจะตอบยังไง

| ขั้นตอน | กรอบเวลา |
| --- | --- |
| ตอบรับว่าได้รับรายงานแล้ว | ภายใน 3 วันทำการ |
| ประเมินและยืนยัน | ภายใน 10 วันทำการ |
| ออก fix ระดับ critical/high | ภายใน 30 วัน |
