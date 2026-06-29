# 1. استخدام نسخة n8n الرسمية
FROM n8nio/n8n:latest

# 2. الانتقال للمستخدم الجذر مؤقتاً لتجهيز المجلدات
USER root

# 3. إجبار السكربت على تحميل نسخة Chromium المتوافقة برمجياً مع Puppeteer تلقائياً
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=false
ENV NODE_FUNCTION_ALLOW_EXTERNAL=puppeteer

# 4. إعادة الصلاحيات للمستخدم node لتشغيل السيرفر بأمان
USER node
