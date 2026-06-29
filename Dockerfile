# 1. جلب نسخة n8n الرسمية المستقرة القائمة على دبيان
FROM n8nio/n8n:latest

# 2. التبديل للمستخدم الجذر (Root) لامتلاك صلاحيات التثبيت
USER root

# 3. تحديث الحزم وتثبيت Chromium وكافة الاعتماديات اللازمة لتشغيل Puppeteer
RUN apt-get update && apt-get install -y \
    chromium \
    libnss3 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libxss1 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

# 4. ضبط المتغيرات البيئية لـ Puppeteer لكي يشير للمتصفح المثبت بشكل صحيح
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV NODE_FUNCTION_ALLOW_EXTERNAL=puppeteer

# 5. العودة للمستخدم الافتراضي node لتشغيل المنظومة بأمان
USER node
