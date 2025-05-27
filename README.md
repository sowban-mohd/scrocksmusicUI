# S Rocks Music App HomeScreen

This repository contains the clone of **HomeScreen module** of the **S Rocks Music App**.

## ✨ Features

* 🔥 Reads data from **Firestore**
* 🎵 Displays a **list of Service Cards**
* 🖱️ On tapping a card, navigates to a new screen showing:
  `"You tapped [Service Name]"`
* 🧠 Uses **Provider** for state management
* 🧩 Uses **Get It** for dependency injection
* 🏗️ Follows **MVVM architecture**
* ✅ Gracefully handles errors and asynchronous operations

## 📁 Project Structure

```
lib/
├── core/               # Core utilities like dependency injection, app theme, etc.
├── models/             # Data models
├── viewmodels/         # Business logic and state
├── views/              # UI screens
│   └── widgets/        # Reusable UI components
├── main.dart
```

## 🛠️ Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/s-rocks-music-app-homescreen.git
   cd s-rocks-music-app-homescreen
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

> ⚠️ Ensure your Firestore project is correctly configured.

## 📦 Dependencies

* `provider`
* `get_it`
* `cloud_firestore`
* `flutter`

## 🧠 Architecture

This module uses **MVVM**:

* **Model**: Represents Firestore data
* **ViewModel**: Handles logic, state, and Firestore interactions
* **View**: UI that listens to ViewModel via Provider

## 📄 License

MIT License
