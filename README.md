# StrawberryHRM 🍓

A comprehensive Flutter-based Human Resource Management (HRM) application that provides complete HR functionalities for modern businesses.

## 📱 Overview

StrawberryHRM is a feature-rich mobile application designed to streamline HR operations including attendance tracking, leave management, employee management, payroll, and comprehensive reporting features. Built with Flutter, it supports multiple platforms and includes offline capabilities for reliable operation.

## ✨ Key Features

### 🎯 Core HR Features
- **Attendance Management** - Multiple check-in methods (GPS, QR code, facial recognition)
- **Leave Management** - Leave requests, approvals, and comprehensive tracking
- **Employee Management** - Complete employee profiles, phonebook, and team management
- **Payroll** - Salary management and deduction handling
- **Task Management** - Task assignment, tracking, and progress monitoring
- **Document Management** - Document requests, approvals, and digital storage
- **Travel Management** - Travel planning, expense tracking, and meeting coordination
- **Reporting** - Detailed reports for attendance, leave, performance, and analytics

### 📊 Advanced Features
- **Real-time Notifications** - Firebase-powered push notifications
- **Offline Support** - Local data storage with Realm database
- **Multi-language Support** - English, Bengali (bn-BN), and Arabic (ar-AR)
- **Location Tracking** - GPS-based attendance and visit tracking
- **Digital Clock** - Custom time tracking widgets
- **Chat System** - Internal communication platform
- **Performance Analytics** - Comprehensive dashboards and insights

## 🏗️ Architecture

### Modular Package Structure
The application follows a clean, modular architecture with packages organized by layer:

```
packages/
├── core/                          # Shared utilities, constants, and models
├── domain/                        # Business logic and use cases
├── hrm_framework/                 # Framework utilities and services
├── data/                         # Data layer packages
│   ├── authentication_repository/ # Authentication services
│   ├── meta_club_api/            # Main API service layer
│   ├── user_repository/          # User data management
│   └── dio_service/              # HTTP client service
└── feature/                      # Feature-specific packages
    ├── chat/                     # Chat functionality
    ├── location_track/           # GPS tracking and location services
    ├── notification/             # Push notification handling
    ├── qr_attendance/            # QR code attendance scanning
    ├── selfie_attendance/        # Facial recognition attendance
    ├── offline_attendance/       # Offline attendance storage
    └── offline_location/         # Offline location tracking
```

### Main App Structure
```
lib/
├── presentation/                 # UI screens organized by feature
│   ├── attendance/              # Attendance tracking and reporting
│   ├── leave/                   # Leave management system
│   ├── employee/                # Employee management
│   ├── payroll/                 # Payroll and salary management
│   ├── task/                    # Task management
│   ├── document/                # Document handling
│   ├── travel/                  # Travel management
│   ├── report/                  # Reporting and analytics
│   ├── menu/                    # Application menu and settings
│   └── home/                    # Dashboard and main screen
├── res/                         # Shared resources
│   ├── widgets/                 # Common UI components
│   ├── common/                  # Utility functions
│   └── service/                 # Application services
├── routes/                      # Navigation configuration
└── injection/                   # Dependency injection setup
```

## 🔧 Technical Stack

### Core Technologies
- **Flutter** 3.7+ - Cross-platform mobile development framework
- **Dart** - Programming language
- **BLoC Pattern** - State management with flutter_bloc and hydrated_bloc
- **Firebase** - Backend services (Analytics, Crashlytics, Messaging, Performance)

### Key Dependencies
- **State Management**: flutter_bloc, hydrated_bloc
- **Networking**: dio, http
- **Database**: realm (local), Firebase Firestore (cloud)
- **Location**: geolocator, google_maps_flutter
- **Camera**: image_picker, camera
- **QR Code**: qr_code_scanner
- **UI Components**: syncfusion_flutter_datepicker, flutter_rating_bar
- **Localization**: easy_localization
- **Charts**: fl_chart, syncfusion_flutter_gauges

### Firebase Integration
- **Firebase Core** - App initialization
- **Firebase Analytics** - User behavior analytics
- **Firebase Crashlytics** - Crash reporting and monitoring
- **Firebase Messaging** - Push notifications
- **Firebase Performance** - Performance monitoring
- **Firestore** - Cloud database for data synchronization

## 🌍 Localization Support

The app supports multiple languages with complete translation:
- **English (en-US)** - Primary language
- **Bengali (bn-BN)** - Bengali language support
- **Arabic (ar-AR)** - Arabic language support with RTL layout

Translation files are located in `assets/translations/` and managed through the easy_localization package.

## 📱 Platform Support

### Mobile Platforms
- **Android** - Full support with Google Services integration (API 21+)
- **iOS** - Complete iOS support with native integrations (iOS 12+)

### Additional Platforms
- **Web** - Basic web support for administrative functions
- **Desktop** - Limited support for macOS, Windows, and Linux

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.7.0 or higher
- Dart SDK 3.7.0 or higher
- Firebase project setup
- Android Studio / Xcode for platform-specific builds

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd strawberryhrm
   ```

2. **Install dependencies**
   ```bash
   # For all packages
   ./scripts/flutter_pub_get.sh
   
   # Or manually
   flutter pub get
   ```

3. **Configure Firebase**
   - Add `google-services.json` for Android
   - Add `GoogleService-Info.plist` for iOS

4. **Run the application**
   ```bash
   flutter run
   ```

## 🛠️ Development Commands

### Flutter Commands
```bash
# Clean build artifacts
flutter clean

# Get dependencies
flutter pub get

# Run static analysis
flutter analyze

# Run unit tests
flutter test

# Build for release
flutter build appbundle --release  # Android
flutter build ipa --release        # iOS
```

### Package Management Scripts
```bash
# Get dependencies for all packages
./scripts/flutter_pub_get.sh

# Clean all Flutter projects
./scripts/flutter_clean.sh

# Feature packages only
./scripts/flutter_pub_get_feature.sh
./scripts/flutter_clean_feature.sh
```

*Note: Scripts use `fvm flutter` commands, indicating Flutter Version Management (FVM) is used.*

## 📊 Project Statistics

- **Version**: 2.1.1+25
- **SDK Constraint**: >=3.7.0 <4.0.0
- **Packages**: 15+ modular packages
- **Features**: 20+ core HR features
- **Languages**: 3 supported languages
- **Platforms**: 6 platform targets

## 🧪 Testing

The project includes comprehensive testing:
- **Unit Tests** - Located in `test/` directory
- **BLoC Testing** - Using bloc_test package
- **Mocking** - Using mocktail for test doubles
- **Coverage** - Coverage reports generated in `coverage/`

Run tests with:
```bash
flutter test
```

## 🔄 CI/CD

The project uses **Codemagic** for continuous integration and deployment:
- **Android Workflow** - Builds AAB and deploys to Google Play
- **iOS Workflow** - Builds IPA and deploys to App Store Connect
- **Configuration** - Defined in `codemagic.yaml`

## 🏢 Enterprise Features

### Security & Compliance
- **Secure Authentication** - Multi-factor authentication support
- **Data Encryption** - End-to-end data protection
- **Offline Security** - Secure local data storage
- **Privacy Controls** - GDPR/CCPA compliance features

### Scalability
- **Modular Architecture** - Easy feature addition/removal
- **Cloud Integration** - Scalable Firebase backend
- **Offline-First** - Reliable operation without internet
- **Multi-tenant** - Support for multiple organizations

### Analytics & Reporting
- **Performance Monitoring** - Real-time app performance tracking
- **User Analytics** - Comprehensive user behavior insights
- **Business Intelligence** - Advanced reporting and dashboards
- **Export Capabilities** - Data export in multiple formats

## 🤝 Contributing

This is a private project. For development guidelines and contribution processes, please refer to the internal development documentation.

## 📄 License

Proprietary software. All rights reserved.

---

**Built with ❤️ using Flutter**

*For technical support and documentation, please contact the development team.*
#   w o r k p a y I O S  
 