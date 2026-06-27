# 📚 Student Grade Tracker

A comprehensive Flutter application that helps students track their academic performance by managing subjects, marks, and grades with real-time statistics and a beautiful dark/light theme interface.

![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.0+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Provider](https://img.shields.io/badge/State%20Management-Provider-purple.svg)

---

## 📱 Screenshots

All screenshots are stored in `assets/ss`.

| Screenshot 1 | Screenshot 2 | Screenshot 3 | Screenshot 4 |
|--------------|--------------|--------------|--------------|
| ![Student Grade Tracker screenshot 1](assets/ss/Screenshot_20260627_172458.png) | ![Student Grade Tracker screenshot 2](assets/ss/Screenshot_20260627_172603.png) | ![Student Grade Tracker screenshot 3](assets/ss/Screenshot_20260627_172611.png) | ![Student Grade Tracker screenshot 4](assets/ss/Screenshot_20260627_172619.png) |

| Screenshot 5 | Screenshot 6 | Screenshot 7 | Screenshot 8 |
|--------------|--------------|--------------|--------------|
| ![Student Grade Tracker screenshot 5](assets/ss/Screenshot_20260627_172627.png) | ![Student Grade Tracker screenshot 6](assets/ss/Screenshot_20260627_172635.png) | ![Student Grade Tracker screenshot 7](assets/ss/Screenshot_20260627_172641.png) | ![Student Grade Tracker screenshot 8](assets/ss/Screenshot_20260627_172649.png) |

---

## ✨ Features

### 🎯 Core Features
- **Add Subjects**: Input subject names and marks with real-time validation
- **Subject List**: View all subjects with their grades and marks
- **Swipe to Delete**: Remove subjects with a simple swipe gesture
- **Summary Dashboard**: See overall performance statistics at a glance

### 📊 Academic Features
- **Grade Calculation**: Automatic grade assignment based on marks:
  - A: ≥ 80%
  - B: 65% - 79%
  - C: 50% - 64%
  - F: < 50%
- **Performance Metrics**:
  - Total subjects count
  - Average mark
  - Overall grade
  - Number of passing subjects
  - Grade distribution breakdown

### 🎨 User Experience
- **Light/Dark Theme**: Toggle between themes with a single tap
- **Responsive Design**: Works on both phones and tablets
- **Validation**: Form validation with clear error messages
- **Visual Feedback**: Snackbar notifications for actions
- **Grade Visualization**: Color-coded grades and progress bars

### 🏗️ Technical Features
- **State Management**: Provider pattern for reactive updates
- **Clean Architecture**: Separation of concerns with models, providers, and screens
- **Reusable Components**: Custom widgets for grade chips and cards
- **Theme-Based Styling**: Colors are managed through `ThemeData`

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0 or higher
- Android Studio or VS Code
- Android Emulator, iOS Simulator, or physical device

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/student-grade-tracker.git
   cd student-grade-tracker
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```
