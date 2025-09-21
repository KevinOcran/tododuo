# Seller Goods Blueprint

## Overview

This document outlines the project structure, features, and implementation details for the Seller Goods application. The app allows sellers to manage their stores and products.

## Project Structure

The project is structured by feature, with each feature having its own `data`, `domain`, and `presentation` layers. This promotes separation of concerns and makes the codebase easier to maintain.

## Features

### Products

*   Sellers can create, read, update, and delete products.
*   Products have a name, description, price, and a list of images.
*   Product images are uploaded to Firebase Storage.

## Implementation Details

*   **State Management:** `flutter_riverpod` is used for state management, providing a clean and scalable way to manage application state.
*   **Database:** Cloud Firestore is used to store product and store data.
*   **Storage:** Firebase Storage is used to store product images.
*   **Code Generation:** `freezed` is used to generate immutable data classes, and `json_serializable` is used for JSON serialization/deserialization.

## Current Task: Add Image Upload Functionality

*   **Goal:** Allow sellers to upload images for their products.
*   **Steps:**
    1.  Update the `Product` entity to include a list of image URLs.
    2.  Run `build_runner` to update the generated `Product` model.
    3.  Add the `image_picker` dependency to `pubspec.yaml`.
    4.  Update `add_edit_product_screen.dart` to allow users to pick and display images.
    5.  Update `product_viewmodel.dart` to handle image uploads.
    6.  Update the `product_repository.dart` to upload images to Firebase Storage.
