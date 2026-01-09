# Flash Mart ⚡️

A feature-rich e-commerce Flutter application demonstrating production-ready architecture, real-time data handling, and state management best practices.

## 🚀 Features

- **Real-Time Stock Updates**: Simulates a live backend using Dart Streams to broadcast stock changes instantly.
- **Reactive UI**: Product badges and buttons react effectively to data changes (e.g., badges turn red when low stock, "Add to Cart" disables when out of stock).
- **Shopping Cart**: Fully functional cart with add, remove, and checkout capabilities.
- **Clean Architecture**: Built using MVVM pattern with Provider for clear separation of concerns.

## 🛠 Tech Stack

- **Framework**: Flutter (Material 3)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Architecture**: MVVM (Model-View-ViewModel)
- **Asynchronous Data**: Dart Streams

## 📂 Project Structure

```
lib/
├── models/         # Data classes (e.g., Product)
├── services/       # Business logic & Mock Backend (StockService)
├── providers/      # State management logic (ProductProvider, CartProvider)
├── screens/        # UI Pages (ProductList, Details, Cart)
├── widgets/        # Reusable UI components
└── main.dart       # Application entry point & Provider setup
```

## 🏁 Getting Started

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/flash_mart.git
    cd flash_mart
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the app:**
    ```bash
    flutter run
    ```

## 🧪 Testing

The project includes unit and widget tests to ensure reliability.

```bash
flutter test
```
