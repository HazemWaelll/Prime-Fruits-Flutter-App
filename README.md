# Prime Fruits - Fresh Produce Shopping App

A modern, feature-rich Flutter application that enables users to browse and purchase fresh fruits. Prime Fruits combines an elegant user interface with robust state management and persistent storage to deliver a seamless shopping experience across Android and iOS.

## 📱 Project Overview

Prime Fruits is a complete e-commerce application designed specifically for fresh produce shopping. The app provides users with an intuitive interface to explore a diverse selection of fruits, manage their shopping cart, save favorite items, and enjoy a customizable dark/light theme. All user data including cart items and favorites are persisted locally using Hive, ensuring data availability even after the app is closed.

### Key Highlights:
- **Cross-Platform Support**: Runs seamlessly on Android and iOS
- **Theme Persistence**: Users can toggle between light and dark modes with automatic preference saving
- **Local Data Persistence**: Hive NoSQL database for cart and favorites management
- **Provider Pattern**: Clean state management using the Provider pattern for scalability

## ✨ Features

### 🛍️ Shopping Experience
- **Product Catalog**: Browse 16+ fresh fruits including apples, bananas, mangoes, strawberries, and more
- **Add to Cart**: Easily add items to your shopping cart with quantity management

### ❤️ Favorites Management
- **Wishlist Functionality**: Mark items as favorites for quick access later
- **Persistent Favorites**: Your saved items remain even after closing the app
- **One-Tap Browsing**: Dedicated favorites page to view all saved items

### 🛒 Cart Management
- **Real-Time Updates**: View cart total with instant price calculations
- **Quantity Controls**: Increase or decrease item quantities
- **Cart Persistence**: All items remain in your cart between sessions

### 🌓 Theme Customization
- **Light & Dark Modes**: Toggle between themes based on your preference
- **Automatic Saving**: Your theme selection is remembered across sessions
- **Eye-Friendly Design**: Optimized colors and contrast for both themes

### 📱 User Interface
- **Animated Splash Screen**: Eye-catching entrance animation with Lottie
- **Navigation Bar**: Bottom navigation for easy access to Home, Cart, Favorites, and Settings
- **Settings Page**: Manage app preferences and theme options

## 🏗️ Project Structure

```
lib/
├── main.dart                # Application entry point with provider setup
├── components/
│   |── Food_grid.dart       # Reusable product grid component
|   └── Bottom_Bar.dart      # Bottom navigation model
├── models/
│   ├── Cart_model.dart      # Shopping cart state and logic
│   └── Favorite_model.dart  # Favorites wishlist state and logic
└── pages/
    ├── Home_page.dart       # Main product listing page
    ├── Cart_page.dart       # Shopping cart display
    ├── Favorites_page.dart  # Wishlist view
    ├── Settings_page.dart   # User preferences and theme control
    ├── Error_page.dart      # Placeholder page
    └── Splash_page.dart     # Animated splash screen

assets/
├── images/                  # Product images (16+ fruit assets)
└── fonts/                   # Custom fonts if used
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK: >= 3.8.1
- Dart SDK: >= 3.8.1
- An IDE with Flutter support (VS Code, Android Studio, or IntelliJ IDEA)

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/HazemWaelll/Prime-Fruits-Flutter-App.git
   cd Prime_Fruits
   ```

2. **Install Dependencies**
   ```
   flutter pub get
   ```

3. **Generate Hive Adapters** (if using Hive models)
   ```
   flutter pub run build_runner build
   ```

4. **Run the Application**
   ```
   flutter run
   ```

## 💡 Architecture & Design Patterns

### Provider Pattern for State Management
The app uses Provider for efficient state management with two main notifiers:
- **Cartmodel**: Manages cart items, quantities, and total price calculation
- **Favoritemodel**: Handles favorite items and wishlist functionality

### Hive for Persistence
- Cart and favorites are automatically synced with Hive
- Theme preference is persisted in a dedicated 'themeBox'
- All data remains available offline

## 🎨 Customization

### Adding New Products
Edit the `_shopitems` list in `lib/models/Cart_model.dart` and `lib/models/Favorite_model.dart`:
```dart
final List _shopitems = [
  ["product_name", "price", "assets/images/product.png"],
  // ...
];
```

### Modifying Theme Colors
Update the MaterialApp theme in `main.dart` to customize colors, fonts, and overall appearance.

## 🐛 Troubleshooting

### Build Runner Issues
If you encounter code generation problems:
```bash
flutter clean
flutter pub get
```

### Hive Initialization Errors
Ensure `Hive.initFlutter()` is called before `runApp()` in main.dart.

---

**Happy Shopping! 🍎🍌🍓**
