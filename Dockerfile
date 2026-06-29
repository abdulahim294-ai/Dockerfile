# 1. جلب نسخة n8n الرسمية الأخيرة
FROM n8nio/n8n:latest

# 2. التبديل للمستخدم الجذر (Root)
USER root

# 3. تثبيت لغات ومكتبات Chromium المتوافقة مع النظام الحالي
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont

# 4. إجبار بوبيتير على استخدام المتصفح الداخلي المحمل لحفظ الرام
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
ENV NODE_FUNCTION_ALLOW_EXTERNAL=puppeteer

# 5. العودة للمستخدم العادي لتشغيل الخدمة
USER node

