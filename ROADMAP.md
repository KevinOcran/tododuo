# Tododuo: MVP Development Roadmap

**Overview:** This document outlines the 6-week agile sprint plan to build and deliver the Minimum Viable Product (MVP) for the Tododuo application. Each sprint focuses on a specific set of deliverables to incrementally build the app.

---

## **Sprint 1: Foundation & Authentication (Week 1)**

**Goal:** Establish the project'''s technical foundation, set up the development environment, and implement the core authentication and role management systems.

**Deliverables:**

-   [ ] **Project Setup:** Initialize the Flutter project with the Clean Architecture folder structure (`/data`, `/domain`, `/presentation`).
-   [ ] **Firebase Integration:** Create a new Firebase project and integrate it with the Flutter app (iOS, Android).
-   [ ] **Authentication Flow:** Implement email & password sign-up and login screens.
-   [ ] **Role-Based Access Control (RBAC):**
    -   Create a Cloud Function to assign a `role` (e.g., `buyer`, `seller_goods`) to a user upon registration.
    -   Use Firebase custom claims to enforce roles.
-   [ ] **State Management:** Set up Riverpod for state management and dependency injection.
-   [ ] **Navigation:** Implement a basic routing solution (e.g., `go_router`) to handle navigation between auth screens and a placeholder home screen.
-   [ ] **Testing:** Write unit tests for authentication logic and role assignment.

---

## **Sprint 2: Onboarding & User Profiles (Week 2)**

**Goal:** Build the guided onboarding flows for all user roles and establish the database structure for user profiles.

**Deliverables:**

-   [ ] **Onboarding UI:** Create the multi-step onboarding screens for:
    -   **Sellers (Goods):** Store creation, ID upload placeholder.
    -   **Sellers (Dispatch):** Vehicle info, ID upload placeholder.
    -   **Buyers:** Basic profile setup (name, phone number).
-   [ ] **Firestore Schemas:** Define and implement the Firestore collections for `users`, `seller_profiles`, `dispatch_profiles`, and `buyer_profiles`.
-   [ ] **Cloud Storage:** Configure Firebase Storage to handle uploads for ID documents and profile pictures.
-   [ ] **Profile Management:** Create a dedicated screen where users can view and edit their own profile information.
-   [ ] **Testing:** Write unit tests for profile data models and widget tests for the onboarding screens.

---

## **Sprint 3: Seller (Goods) & Product Management (Week 3)**

**Goal:** Empower goods providers to manage their virtual store and product listings. Enable buyers to see these products.

**Deliverables:**

-   [ ] **Store & Product Schemas:** Implement the Firestore schemas for `stores` and their `products` sub-collection.
-   [ ] **Seller Dashboard (Goods):** A dashboard where sellers can:
    -   View their store details.
    -   Add, edit, and delete product listings.
-   [ ] **Product Creation Flow:** A dedicated UI flow for uploading product images (to Cloud Storage), setting prices, names, and descriptions.
-   [ ] **Product Browsing UI:** Create the main interface for buyers to browse and search for products from all sellers.
-   [ ] **Testing:** Write unit tests for all product management logic and data models.

---

## **Sprint 4: Buyer & Order Placement (COD) (Week 4)**

**Goal:** Enable buyers to select products, add them to a cart, and complete an order using the Cash on Delivery (COD) method.

**Deliverables:**

-   [ ] **Shopping Cart:** Implement a client-side shopping cart using Riverpod to manage its state.
-   [ ] **Checkout Flow (COD):**
    -   UI for buyers to review their cart.
    -   Screen to confirm delivery address and contact details.
    -   A "Place Order" button that finalizes the COD order.
-   [ ] **Order Creation:** Upon checkout, create a new document in the `/orders` collection in Firestore with `status: 'pending'` and `payment: { method: 'COD' }`.
-   [ ] **Buyer Order History:** A screen for buyers to view a list of their past and current orders.
-   [ ] **Testing:** Write integration tests for the entire "add to cart -> checkout" flow.

---

## **Sprint 5: Dispatch Matching & Order Lifecycle (Week 5)**

**Goal:** Implement the core serverless logic for order fulfillment, including notifying sellers and matching with dispatch riders.

**Deliverables:**

-   [ ] **Seller Notification:** Create a Cloud Function that triggers when a new order is created, sending a push notification (FCM) to the relevant seller.
-   [ ] **Seller Order Management:** UI for the seller to view the new order and confirm it, changing the status to `awaiting_pickup`.
-   [ ] **Dispatch Matching Logic:**
    -   A Cloud Function that queries for available dispatch riders near the seller'''s location (requires storing rider location).
    -   Send FCM notifications to all nearby riders about the new delivery job.
-   [ ] **Dispatch Job View:** UI for dispatch riders to view and accept an available delivery job on a "first-come, first-served" basis.
-   [ ] **Order State Progression:** Logic to assign the `dispatchId` to the order and update its status.
-   [ ] **Testing:** Write unit tests for the Cloud Functions.

---

## **Sprint 6: Delivery Completion, Receipts & MVP Polish (Week 6)**

**Goal:** Finalize the end-to-end order flow, generate receipts, and conduct final testing and polishing before release.

**Deliverables:**

-   [ ] **Live Tracking Placeholder:** A basic screen for the buyer and seller that shows the order status (`in_transit`, `completed`). A real map is a post-MVP feature.
-   [ ] **Delivery Confirmation:**
    -   UI for the dispatch rider to mark the order as "Picked Up".
    -   UI for the buyer to "Confirm Delivery", which updates the order status to `completed`.
-   [ ] **Receipt Generation:** A Cloud Function that triggers on order completion to create receipt documents in Firestore for the buyer, seller, and rider.
-   [ ] **Receipts UI:** A screen where users can view their digital receipts.
-   [ ] **End-to-End Testing:** Perform thorough integration testing of the entire user journey.
-   [ ] **UI/UX Polish:** Review the entire application for consistency, clarity, and ease of use. Fix bugs and address any UI issues.
-   [ ] **Build Preparation:** Prepare the final builds for submission to the iOS App Store and Google Play Store.
