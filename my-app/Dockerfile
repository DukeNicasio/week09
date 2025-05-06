# เลือก base image ที่มี Node.js
FROM node:20

# กำหนด working directory ใน container
WORKDIR /app

# คัดลอก package.json และ package-lock.json
COPY package*.json ./

# ติดตั้ง dependencies
RUN npm install

# คัดลอก source code ของแอปทั้งหมด
COPY . .

# สั่งให้ build แอป (หากจำเป็น)
RUN npm run build

# เปิด port 3000 (หรือ port ที่แอปของคุณรัน)
EXPOSE 3000

# คำสั่งให้ container รันแอป
CMD ["npm", "start"]
