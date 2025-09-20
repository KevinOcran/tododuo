# Tododuo: Master Plan

**Version:** 1.0.0
**Last Updated:** $(date)

---

## **1. App Concept: Tododuo**

- **Name:** Tododuo
- **Purpose:** A cross-platform marketplace where buyers order goods from sellers, and independent dispatch riders deliver them in an on-demand (Uber-style) model.
- **Platforms:** iOS & Android (built with Flutter/Dart).
- **Backend:** Firebase (utilizing the free Spark plan).

---

## **2. User Roles & Permissions**

The application is built around four primary user roles, each with specific permissions and access levels managed through Firebase Authentication'''s custom claims.

### **Role-Based Access Control (RBAC)**

| Feature/Action              | System Admin | System Manager | Seller (Goods) | Seller (Dispatch) | Buyer   |
| --------------------------- | :----------: | :------------: | :------------: | :---------------: | :-----: |
| **Authentication**          |      ✅      |       ✅       |       ✅       |         ✅        |    ✅   |
| - Create/Assign Roles       |      ✅      |       ❌       |       ❌       |         ❌        |    ❌   |
| **Dashboard Access**        |      ✅      |       ✅       |       ✅       |         ✅        |    ✅   |
| - View System Analytics     |      ✅      |       ✅       |       ❌       |         ❌        |    ❌   |
| **User Management**         |      ✅      |       ✅       |       ❌       |         ❌        |    ❌   |
| - Verify/Suspend Users      |      ✅      |       ✅       |       ❌       |         ❌        |    ❌   |
| **Store & Product Mgmt**    |      ✅      |       ✅       |       ✅       |         ❌        |    ❌   |
| - Create/Update Store       |      ❌      |       ❌       |       ✅       |         ❌        |    ❌   |
| - Add/Update Products       |      ❌      |       ❌       |       ✅       |         ❌        |    ❌   |
| **Order Management**        |      ✅      |       ✅       |       ✅       |         ✅        |    ✅   |
- Browse Products           |      -       |       -        |       -        |         -         |    ✅   |
| - Place Order               |      -       |       -        |       -        |         -         |    ✅   |
| - View Own Orders           |      -       |       -        |       ✅       |         ✅        |    ✅   |
| - Accept/Decline Order      |      -       |       -        |       ✅       |         ❌        |    -    |
| - Accept/Decline Delivery   |      -       |       -        |       -        |         ✅        |    -    |
| **Live Tracking & Chat**    |      -       |       -        |       ✅       |         ✅        |    ✅   |
| **Payment & Payout**        |      -       |       -        |       ✅       |         ✅        |    ✅   |
| - Make Payment              |      -       |       -        |       -        |         -         |    ✅   |
| - View Own Receipts         |      -       |       -        |       ✅       |         ✅        |    ✅   |
| - Configure Payout Acct     |      -       |       -        |       ✅       |         ✅        |    -    |

### **Required Screens & Dashboards**

-   **System Admin:** Full-access super-dashboard for user management, role assignment, system-wide analytics, and settings.
-   **System Manager:** Dashboard to manage (view, verify, suspend) sellers and buyers, oversee transaction disputes, and view operational metrics.
-   **Seller (Goods Provider):** Store dashboard to manage product listings, inventory, view incoming orders, track active deliveries, and see sales analytics/payouts.
-   **Seller (Dispatch Rider):** Dashboard to view available delivery jobs, accept jobs, manage active deliveries (with map navigation), and track earnings/payouts.
-   **Buyer:** Main app interface for browsing products, managing the shopping cart, placing orders, tracking deliveries in real-time, and viewing order history/receipts.

---

## **3. Transaction & Order Flow**

The entire order lifecycle is orchestrated using a combination of Firestore for data persistence and Cloud Functions for backend logic.

### **Transaction Flowchart**

```mermaid
graph TD
    A[Buyer adds items to cart] --> B{Ready to Checkout?};
    B --> |Yes| C[Buyer provides delivery details & phone];
    C --> D[Buyer selects payment method & pays];
    D --> E{Payment Successful};
    E --> |Yes| F[Order created in Firestore (status: '''pending''')];
    F --> G[Cloud Function triggers];
    G --> H[Notifies Seller of new order];
    G --> I[Finds nearby Dispatch Riders via Geo-query];
    I --> J[Sends delivery request to all nearby Riders];
    J --> K{First Rider accepts?};
    K --> |Yes| L[Rider assigned to Order, status -> '''awaiting_pickup'''];
    L --> M[Rider gets Seller'''s location for pickup];
    M --> N{Rider clicks '''Picked Up'''?};
    N --> |Yes| O[Order status -> '''in_transit'''];
    O --> P[Real-time tracking & chat channel established (Buyer, Seller, Rider)];
    P --> Q[Rider delivers to Buyer];
    Q --> R{Buyer clicks '''Confirm Delivery'''?};
    R --> |Yes| S[Order status -> '''completed'''];
    S --> T[Cloud Function triggers to generate receipts];
    T --> U[Receipts sent to Buyer, Seller, Rider];
    T --> V[Cloud Function schedules Seller payout (24h hold)];
    T --> W[Cloud Function initiates instant Rider payout];
```

### **Firebase Services Mapping**

-   **Firebase Authentication:** Handles sign-up, login, and secures the app using role-based custom claims for each user type.
-   **Firestore:** The primary database for all structured data, including user profiles, stores, products, orders, and receipts.
-   **Cloud Storage:** Stores all user-generated media, such as profile pictures, product images, and ID verification documents.
-   **Cloud Functions:** The serverless backend for all business logic:
    -   Processing payments.
    -   Notifying users (via FCM).
    -   Matching dispatch riders.
    -   Generating receipts.
    -   Handling payouts and escrow logic.
-   **Firebase Cloud Messaging (FCM):** Sends push notifications for critical events (new order, dispatch accepted, delivery complete, etc.).

---

## **4. Ordering & Payment System**

### **Payment Architecture**

-   **MVP Approach:** For the initial launch, payments will be handled via **Cash on Delivery (COD)** to simplify the release. The "Make Payment" step will be a placeholder confirmation.
-   **Future Integration:** Post-MVP, we will integrate:
    -   **Stripe:** For credit/debit card payments (Visa, Mastercard). It has a robust free developer tier for testing.
    -   **Paystack:** To support local payment methods in Africa, including MTN Momo, Telecel Cash, etc. Also has a free developer tier.
-   **Escrow & Payout Logic:**
    1.  When a buyer pays (future-state), the funds are held in an escrow account managed by a Cloud Function.
    2.  **Dispatch Rider Payout:** The rider'''s fee is transferred to their payout account *immediately* after the buyer confirms delivery.
    3.  **Seller Payout:** The seller'''s funds are held for **24 hours** after delivery confirmation. If no return is initiated within this window, a scheduled Cloud Function releases the funds to the seller'''s payout account.

### **Example Firestore Schemas**

```
// /orders/{orderId}
{
  "orderId": "ORD12345",
  "buyerId": "USER_BUYER_ABC",
  "sellerId": "USER_SELLER_XYZ",
  "dispatchId": "USER_DISPATCH_123",
  "items": [
    { "productId": "PROD001", "quantity": 2, "price": 25.00 },
    { "productId": "PROD007", "quantity": 1, "price": 50.00 }
  ],
  "totalAmount": 100.00,
  "dispatchFee": 10.00,
  "status": "completed", // pending, awaiting_pickup, in_transit, completed, cancelled
  "payment": {
    "method": "COD", // or "STRIPE", "PAYSTACK"
    "status": "paid"
  },
  "createdAt": "2023-10-27T10:00:00Z",
  "completedAt": "2023-10-27T11:30:00Z"
}

// /receipts/{receiptId}
{
  "receiptId": "RCPT98765",
  "orderId": "ORD12345",
  "userId": "USER_BUYER_ABC", // Can be buyer, seller, or dispatch
  "role": "buyer",
  "details": "...",
  "createdAt": "2023-10-27T11:30:00Z"
}
```

---

## **5. Onboarding Flows**

### **Data Model Definitions**

-   **users:** Core collection for all users, containing `uid`, `email`, `displayName`, `photoURL`, `phoneNumber`, `role`, and a reference to their specific profile.
-   **seller_profiles:** Contains business-specific info like `storeName`, `idCardUrl`, `payoutDetails`.
-   **dispatch_profiles:** Contains `vehicleNumberPlate`, `idCardUrl`, `payoutDetails`, `currentLocation` (GeoPoint).
-   **buyer_profiles:** Contains `deliveryAddress`, `orderHistory`.
-   **stores:** Owned by sellers, contains store-level info.
-   **products:** Sub-collection under a `store`, with `name`, `description`, `price`, `images`, `stock`.

### **Example Onboarding Screen Flow (Seller)**

1.  **Sign Up:** Create account with email/password.
2.  **Select Role:** Choose "Become a Seller".
3.  **Create Your Store:**
    -   Screen 1: Enter Store Name & Description.
    -   Screen 2: Upload ID for verification.
    -   Screen 3: Set up payout account (Mobile Money number or Bank details).
4.  **Add Products:** Guided flow to add the first product (name, price, images).
5.  **Dashboard:** Land on the main seller dashboard.

---

## **6. Cancellation & Returns**

Business logic will be enforced by Firestore Security Rules and Cloud Functions.

-   **Free Cancellation:** A buyer can cancel an order for free if the `status` is `pending`. A Cloud Function will validate this condition.
-   **Paid Cancellation:** If the status is `awaiting_pickup`, a cancellation fee is charged to the buyer, which is then paid to the assigned dispatch rider.
-   **Returns:** If a buyer wishes to return a product after delivery, they initiate a "Return Request." This creates a new delivery job for a dispatch rider, and the associated fee is charged to the buyer.

### **Example Firebase Security Rule**

```javascript
// In firestore.rules
match /orders/{orderId} {
  // Allow a buyer to update an order to "cancelled" only if its current status is "pending"
  allow update: if request.auth.uid == resource.data.buyerId &&
                   request.resource.data.status == '''cancelled''' &&
                   resource.data.status == '''pending''';
}
```

---

## **7. MVP Scope vs. Roadmap**

### **MVP Checklist (Must-Haves for Launch)**

-   [ ] **Authentication:** Email/password sign-up and login for all roles.
-   [ ] **Onboarding:** Guided setup for Sellers (Goods & Dispatch) and Buyers.
-   [ ] **Core Buyer Flow:** Browse products, add to cart, and "checkout" (COD).
-   [ ] **Core Seller (Goods) Flow:** Create store, add products, view and accept new orders.
-   [ ] **Core Seller (Dispatch) Flow:** View and accept nearby delivery jobs.
-   [ ] **Order Lifecycle:** Basic state machine (`pending` -> `awaiting_pickup` -> `in_transit` -> `completed`).
-   [ ] **Real-time Notifications:** FCM alerts for new orders, job acceptances, and completions.
-   [ ] **Digital Receipts:** Generate and store basic receipts in Firestore upon order completion.
-   [ ] **Basic Dashboards:** Simple, functional dashboards for each user role.

### **Future Roadmap (Post-MVP)**

-   [ ] **Full Payment Integration:** Stripe and Paystack.
-   [ ] **Live Tracking & Chat:** Real-time map view and in-app messaging between parties.
-   [ ] **Reviews & Ratings:** Allow buyers to rate sellers and products.
-   [ ] **Advanced Analytics:** Rich dashboards for sellers and system managers.
-   [ ] **Advanced Admin Tools:** Fraud detection, content moderation, and activity logs.
-   [ ] **Returns & Refunds:** Fully automated flow for managing returns.
-   [ ] **Promotions & Discounts:** Allow sellers to create promotional codes.
-   [ ] **Web App:** A web-based portal for System Admins and Managers.

---

## **8. Tech Stack & Architecture**

### **Architecture: Clean Architecture**

We will adopt a strict Clean Architecture to ensure separation of concerns and testability.

-   **Presentation Layer:** Flutter Widgets, UI state management (Riverpod), and navigation.
-   **Domain Layer:** Core business logic, use cases (e.g., `PlaceOrderUseCase`), and pure Dart data models (entities). This layer has no external dependencies.
-   **Data Layer:** Repositories that abstract data sources. Implements the interfaces defined in the Domain layer. It will handle all communication with Firebase.

### **Suggested Folder Structure**

```
lib/
├── src/
│   ├── core/                  # Shared utilities, constants, themes
│   │
│   ├── data/                  # Repositories, data sources, models
│   │   ├── datasources/       # Firebase-specific implementations
│   │   ├── models/            # DTOs for Firebase data
│   │   └── repositories/      # Repository implementations
│   │
│   ├── domain/                # Core business logic
│   │   ├── entities/          # Pure Dart objects
│   │   ├── repositories/      # Abstract repository interfaces
│   │   └── usecases/          # Business operations
│   │
│   └── presentation/          # UI Layer
│       ├── providers/         # Riverpod providers
│       ├── screens/           # App screens/pages
│       └── widgets/           # Reusable UI components
│
└── main.dart                  # App entry point
```

### **State Management: Riverpod**

**Riverpod** is chosen for its compile-safe, decoupled, and highly testable approach to state management, which aligns perfectly with Clean Architecture.

---

## **9. Documentation & Testing Standards**

### **Documentation**

-   **Docstrings:** Every public class, method, and function *must* have clear Dart docstrings.
-   **Feature READMEs:** Each major feature (e.g., `auth`, `orders`, `checkout`) will have its own `README.md` file within its feature folder, detailing its purpose, flow, and dependencies.

### **Testing**

-   **Unit Tests:** Required for all classes in the **Domain** and **Data** layers. Business logic (.e.g, use cases) and data transformations (models) must have 100% test coverage for critical paths.
-   **Widget Tests:** For UI components in the **Presentation** layer to verify UI rendering and basic interactions.
-   **Integration Tests:** For critical end-to-end user flows, such as "Add to Cart -> Checkout -> Order Confirmation."

### **Example Unit Test (Dart)**

```dart
// test/src/domain/usecases/place_order_usecase_test.dart
import '''package:flutter_test/flutter_test.dart''';
import '''package:mockito/mockito.dart''';

// Mocks would be generated for repository interfaces
class MockOrderRepository extends Mock implements OrderRepository {}

void main() {
  late PlaceOrderUseCase useCase;
  late MockOrderRepository mockOrderRepository;

  setUp(() {
    mockOrderRepository = MockOrderRepository();
    useCase = PlaceOrderUseCase(mockOrderRepository);
  });

  test('''should call repository to create order when executed''', () async {
    // Arrange
    final order = OrderEntity(...);
    when(mockOrderRepository.createOrder(any)).thenAnswer((_) async => '''ORD123''');

    // Act
    await useCase.execute(order);

    // Assert
    verify(mockOrderRepository.createOrder(order));
    verifyNoMoreInteractions(mockOrderRepository);
  });
}
```

---

## **10. Project Management**

-   **Methodology:** Agile sprints (2 weeks) managed via a **GitHub Projects Kanban board**.
-   **Task Board Columns:** `Backlog` -> `To Do` -> `In Progress` -> `In Review` -> `Done`.
-   **CI/CD:** **GitHub Actions** will be used to automate the development pipeline. Every push/pull request to `main` or `develop` will trigger:
    1.  `flutter analyze`
    2.  `flutter test`
    3.  A build of the Android and iOS apps.

### **Example GitHub Actions YAML**

```yaml
# .github/workflows/ci.yml
name: Flutter CI

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - uses: subosito/flutter-action@v2
      with:
        channel: '''stable'''
    - name: Install dependencies
      run: flutter pub get
    - name: Analyze project
      run: flutter analyze
    - name: Run tests
      run: flutter test
```
