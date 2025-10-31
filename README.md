# 📱 SAS Mobile

**SAS Mobile** is the mobile companion app for the **Situation Awareness System (SAS)** — a platform designed to visualize, track, and monitor real-world events such as crimes, disasters, and social incidents on an interactive map.
It allows users to access daily events, view event details, and stay informed about ongoing situations directly from their mobile device.

---

## 🚀 Features

* 🌍 **Map-Based Event Visualization** — Explore real-time and daily events on an interactive map.
* 🕒 **Daily Updates** — Automatically fetches events updated in the last 24 hours.
* 📄 **Event Details** — View event title, description, location, and update history.
* 🔄 **Real-Time Sync** — Integrates with SAS backend microservices for up-to-date event data.
* 🧭 **Cross-Platform Support** — Works on Android, iOS, Web, Windows, macOS, and Linux.

---

## 🧩 Project Structure

```
sas_mobile/
├── lib/
│   ├── app/                     # App entry configuration (providers, routes, etc.)
│   │   └── app.dart
│   ├── core/                    # Core utilities and shared configuration
│   │   ├── config/              # App and environment configuration
│   │   ├── interceptors/        # Dio interceptors (e.g., logging, auth)
│   │   ├── network/             # Dio client and API setup
│   │   ├── theme/               # App themes, colors, and typography
│   │   └── utils/               # Helper functions
│   ├── features/                # Main feature modules
│   │   └── events/              # Event feature module
│   │       ├── data/            # Data sources (API calls, repositories)
│   │       ├── domain/          # Domain models and entities
│   │       └── presentation/    # UI and state management (pages, widgets)
│   ├── shared/                  # Shared widgets and components
│   └── main.dart                # App entry point
│
├── assets/                      # Static assets (logos, icons, etc.)
├── test/                        # Unit and widget tests
├── web/                         # Web entry files
├── android/                     # Android project files
├── ios/                         # iOS project files
├── windows/, macos/, linux/     # Desktop platform files
├── pubspec.yaml                 # Dependencies and assets configuration
└── README.md
```

---

## ⚙️ Setup & Installation

### Prerequisites

* Flutter SDK (>= 3.0)
* Dart SDK (included with Flutter)
* Android Studio or VS Code with Flutter/Dart plugins
* Running instance of SAS backend (for API connection)

### Installation Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/HasanKhadd0ur/sas_mobile.git
   cd sas_mobile
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure environment**

   * Edit your base API URL inside
     `lib/core/config/app_config.dart` (or similar).
   * Example:

     ```dart
     const String baseUrl = "https://api.sasplatform.com";
     ```

4. **Run the application**

   ```bash
   flutter run
   ```

   Or specify a platform:

   ```bash
   flutter run -d chrome       # Web
   flutter run -d android      # Android
   flutter run -d windows      # Windows
   ```

---

## 🔌 API Integration

SAS Mobile communicates with the backend **EventsService** through a REST API.
Example endpoint used:

```http
GET /events/updated-after?lastUpdated={ISO8601}&pageNumber=1&pageSize=10
```

Implemented in:
`lib/features/events/data/event_api.dart`

---

## 🧠 Architecture

Follows **Clean Architecture** principles with separation of concerns across:

* **Data Layer** → Repositories, API calls, DTOs
* **Domain Layer** → Business entities and use cases
* **Presentation Layer** → UI, ViewModels, and state management

This ensures testability, scalability, and maintainability.

---

## 🧱 Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **Networking:** Dio
* **Architecture:** Clean Architecture
* **State Management:** Provider / Riverpod (depending on your setup)
* **Backend Integration:** SAS microservices (EventsService, IdentityService, etc.)

---

## 🤝 Contributing

1. Fork the project
2. Create a feature branch: `git checkout -b feature/YourFeature`
3. Commit changes: `git commit -m "Add YourFeature"`
4. Push to the branch: `git push origin feature/YourFeature`
5. Submit a pull request

---

## 🧾 License

This project is part of the **Situational Awareness System (SAS)** and follows its licensing terms.

---

## 👨‍💻 Author

**Hasan Khaddour**
📧 [GitHub Profile](https://github.com/HasanKhadd0ur)
💡 Fullstack Developer | Machine Learning & Web Systems Engineer