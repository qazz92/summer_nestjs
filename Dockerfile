# Step 1
FROM node:22-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build


# Step 2
FROM node:22-alpine
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 3000
CMD ["npm", "run", "start:prod"]
