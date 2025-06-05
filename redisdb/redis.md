# Redis Schema Documentation

> 📦 **Environment:** `production`, `staging`
> 📅 **Last Updated:** 2025-06-05
> ✍️ **Maintainer:** [Your Name](mailto:your.email@example.com)

---

## 📘 Overview

Redis là hệ thống key-value in-memory được sử dụng cho:

- Cache dữ liệu tạm thời
- Session storage cho người dùng
- Pub/Sub event streaming
- Queues (Job queues, retry queues...)

---

## 🧱 Key Patterns & Namespaces

| Prefix          | Purpose                                | Data Type | TTL (s) | Example Key                           |
|-----------------|----------------------------------------|-----------|---------|---------------------------------------|
| `user:session:` | Lưu trữ session người dùng             | `HASH`    | 3600    | `user:session:2394875`                |
| `user:auth:`    | Token xác thực tạm thời                | `STRING`  | 600     | `user:auth:email:john@example.com`    |
| `post:views:`   | Đếm số lượt xem của bài viết           | `STRING`  | ∞       | `post:views:12345`                    |
| `queue:email`   | Hàng đợi gửi email                     | `LIST`    | ∞       | `queue:email`                         |
| `lock:order:`   | Khóa để xử lý đơn hàng (mutex)         | `STRING`  | 30      | `lock:order:98765`                    |

---

## 📂 Detailed Key Descriptions

### `user:session:<user_id>`
- **Type:** `HASH`
- **TTL:** 1 giờ (3600s)
- **Fields:**
  - `access_token`: Token JWT
  - `refresh_token`: Token refresh
  - `device`: Thiết bị đăng nhập
  - `ip`: IP đăng nhập

### `user:auth:email:<email>`
- **Type:** `STRING`
- **TTL:** 10 phút (600s)
- **Usage:** Token xác thực gửi qua email (OTP, reset password...)

### `post:views:<post_id>`
- **Type:** `STRING`
- **TTL:** Không giới hạn
- **Usage:** Đếm số lượt xem

### `queue:email`
- **Type:** `LIST`
- **Usage:** Danh sách các email cần gửi. Mỗi phần tử là JSON serialized message:
  ```json
  {
    "to": "user@example.com",
    "subject": "Welcome",
    "template": "welcome_email",
    "params": { "name": "User" }
  }
  ```

### `lock:order:<order_id>`
- **Type:** `STRING`
- **TTL:** 30 giây
- **Usage:** Đảm bảo chỉ một tiến trình xử lý đơn hàng

## 🧪 Testing & Conventions
- ⚠️ Tránh dùng `KEYS *` trong production
- ✅ Sử dụng `SCAN` để duyệt keys an toàn
- 🔐 Lock sử dụng `SET NX PX`

## 📈 TTL Management
- Mọi key cần có TTL rõ ràng nếu không yêu cầu lưu vĩnh viễn
- Sử dụng `EXPIRE` và `SET ... PX` trong logic

## ✅ Best Practices
- Namespacing bằng dấu `:`
- Tên key ngắn gọn nhưng rõ mục đích
- TTL theo logic kinh doanh
- Dữ liệu nhạy cảm nên mã hóa trước khi lưu

## 📌 Notes
- Nếu cần atomic operations: `MULTI/EXEC`, `WATCH`
- Sử dụng `RedisJSON`, `RedisStream` nếu mở rộng schema phức tạp

## 📚 References
- [Redis Commands](https://redis.io/commands)
- [Redis Best Practices](https://redis.io/docs/management/best-practices/)
