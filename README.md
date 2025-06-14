# 🐄 Farmly – Where Farm Meets Family

**Farmly** is a modern Flutter-based mobile application for selling fresh farm products online.  
It includes both a **Customer Panel** and an **Admin Panel**, and integrates with **Firebase** for authentication and real-time data.

---

## 🌟 Features

### 👩‍🌾 Customer Side:
- 🔐 Login & Register (via Firebase Authentication)
- 🧺 Browse products by category (horizontal scrollable categories)
- 🔍 Search for products
- 📄 Product detail screen
- 🛒 Place orders
- 📦 View orders (Delivered / Undelivered status)
- 💰 Wallet screen with wallet transaction history
- 🙍 Profile screen

### 👩‍💼 Admin Panel:
- 📃 View all customer orders
- ✅ Mark orders as “Delivered” by tapping
- 👥 View all users
- ❌ Delete user accounts

---

## 🔧 Technologies Used

### 💻 Flutter & Dart

### ☁️ Firebase Services:
- Firebase Authentication  
- Firebase Firestore  
- Firebase Core  

### 📦 Flutter Packages:

```yaml
curved_navigation_bar: ^1.0.6
cloud_firestore:
firebase_core:
firebase_auth:
random_string:
shared_preferences:
http:
flutter_stripe: ^11.5.0
intl:
