FROM python:3.12-slim

ARG PSTACK_REF=v0.5.1

RUN apt-get update && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

# ดึง pstack ตาม tag ที่ pin
RUN git clone --depth 1 --branch "${PSTACK_REF}" \
        https://github.com/willpower-institute/pstack.git /app \
    && rm -rf /app/.git

WORKDIR /app
RUN pip install --no-cache-dir .

# addons ของ app นี้ (PSTACK_ADDONS_PATHS=addons,app_addons)
COPY app_addons /app/app_addons

# ⚠️ image มีแค่ addons ไม่ใช่ทั้ง repo — ถ้า app อ่านไฟล์อื่นตอน runtime
# (config YAML, seed data, asset, policy) ต้อง COPY เข้ามาด้วย ไม่งั้นบูตผ่าน
# แต่พังตอนมีงานเข้าจริงด้วย FileNotFoundError เช่น:
#   COPY policies /app/policies
# แนะนำ: ให้โมดูลโหลด config ตอน on_install (config หาย = boot ไม่ผ่าน ดีกว่า 500 ตอน runtime)

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
