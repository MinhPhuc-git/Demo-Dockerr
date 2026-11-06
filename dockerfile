# Sử dụng môi trường Node.js 20
FROM node:20-alpine

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy file cấu hình và dependency
COPY package*.json ./
COPY .npmrc ./

# Cài đặt dependency
RUN npm install

# Copy source code vào Container
COPY server.js ./

# Mở port 3000
EXPOSE 3000

# Khởi chạy ứng dụng
CMD ["npm", "start"]