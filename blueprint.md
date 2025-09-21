# Tododuo Blueprint

## 1. App Concept: Tododuo

- **Name:** Tododuo
- **Purpose:** A cross-platform marketplace where buyers order goods from sellers, and independent dispatch riders deliver them in an on-demand (Uber-style) model.
- **Platforms:** iOS & Android (built with Flutter/Dart).
- **Backend:** Firebase (utilizing the free Spark plan).

## 2. User Roles & Permissions

The application is built around four primary user roles, each with specific permissions and access levels managed through Firebase Authentication’s custom claims.

### Implemented Features

*   **User Authentication:**
    *   Users can sign up and log in using email and password.
    *   Firebase Authentication handles user sessions.
*   **Onboarding:**
    *   Users select their role (buyer, seller, or dispatcher) after signing up.
    *   Based on the role, users provide additional information:
        *   **Buyer:** Full Name and Phone Number.
        *   **Seller:** Store Name.
        *   **Dispatcher:** Vehicle Plate Number.
    *   User profiles, including role and specific details, are created in Firestore.
    *   Users are redirected to the appropriate home screen based on their role.

### Latest Update: Enhanced Onboarding

*   **Goal:** To capture essential user details during the onboarding process to create more complete user profiles.
*   **Steps Completed:**
    1.  **Domain Models Updated:** Added `name` and `phoneNumber` to `BuyerProfile`, `storeName` to `SellerProfile`, and `vehicleNumberPlate` to `DispatchProfile`.
    2.  **View Model Logic:** The `OnboardingViewModel` was updated to include `TextEditingController`s for the new fields and to pass this data during profile creation.
    3.  **UI Enhancement:** The `OnboardingScreen` now dynamically displays input fields based on the user's selected role, allowing them to enter their specific details.
    4.  **Code Generation:** Ran `build_runner` to update the `freezed` and `json_serializable` generated files.
    5.  **Formatting:** Ensured code consistency with `dart format`.

## 3. Project Structure

```
lib
├── core
│   └── providers
│       └── firebase_providers.dart
├── features
│   ├── authentication
│   │   ├── data
│   │   │   └── repositories
│   │   │       └── auth_repository_impl.dart
│   │   ├── domain
│   │   │   └── repositories
│   │   │       └── auth_repository.dart
│   │   └── presentation
│   │       ├── providers
│   │       │   └── auth_state_notifier.dart
│   │       └── screens
│   │           ├── buyer_home_screen.dart
│   │           ├── login_screen.dart
│   │           ├── seller_dispatch_home_screen.dart
│   │           ├── seller_goods_home_screen.dart
│   │           └── signup_screen.dart
│   └── onboarding
│       ├── data
│       │   └── repositories
│       │       ├── buyer_profile_repository_impl.dart
│       │       ├── dispatch_profile_repository_impl.dart
│       │       ├── seller_profile_repository_impl.dart
│       │       └── user_profile_repository_impl.dart
│       ├── domain
│       │   ├── entities
│       │   │   ├── buyer_profile.dart
│       │   │   ├── dispatch_profile.dart
│       │   │   ├── seller_profile.dart
│       │   │   └── user_profile.dart
│       │   └── repositories
│       │       ├── buyer_profile_repository.dart
│       │       ├── dispatch_profile_repository.dart
│       │       ├── seller_profile_repository.dart
│       │       └── user_profile_repository.dart
│       └── presentation
│           ├── onboarding_screen.dart
│           └── onboarding_view_model.dart
└── main.dart
```
