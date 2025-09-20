# TodoDuo Blueprint

## Overview

A cross-platform marketplace app built with Flutter and Firebase. It connects buyers with sellers of goods and independent dispatch riders.

## Key Features

*   **Multi-Tiered User System:** Admins, managers, sellers, and buyers with distinct roles and permissions.
*   **Real-Time Dispatch System:** A dynamic system for assigning dispatch riders to orders, similar to ride-sharing services.
*   **Integrated Payments:** Secure payment processing with options for Mobile Money and credit/debit cards, including an escrow system to protect buyers and sellers.
*   **Order Tracking and Communication:** Real-time order tracking and in-app messaging between the buyer, seller, and dispatch rider.
*   **Simplified Onboarding:** Guided processes for new sellers and dispatch riders to set up their accounts and profiles.

## Monetization

*   **Commissions:** A percentage-based commission on all successful transactions.
*   **Fees:** Cancellation and return fees to ensure fair compensation for dispatch riders and sellers.

## Technical Stack

*   **Framework:** Flutter
*   **Backend:** Firebase (Authentication, Firestore, Cloud Functions, Storage)
*   **State Management:** Riverpod
*   **Routing:** go_router

## Current Plan

*   **Phase 1: Core Authentication and User Roles:**
    *   Implement Firebase Authentication with email/password and social login options.
    *   Set up Firestore database with a basic user schema, including roles (admin, manager, seller, buyer).
    *   Create a basic UI for user registration and login.

*   **Phase 2: Seller and Dispatch Onboarding:**
    *   Develop the UI and logic for sellers to create their stores and upload product information.
    *   Develop the UI and logic for dispatch riders to create their profiles, including vehicle and payment details.

*   **Phase 3: Core Order and Dispatch Logic:**
    *   Implement the functionality for buyers to browse products and place orders.
    *   Develop the core logic for the dispatch system, including order broadcasting and rider acceptance.

*   **Phase 4: Payments and Tracking:**
    *   Integrate a payment gateway for Mobile Money and card payments.
    *   Implement the escrow system for holding and releasing funds.
    *   Develop the real-time order tracking and in-app messaging features.
