# Intro Screen Application

This project is an "Intro Screen" application developed with Flutter, utilizing the Hive database. When users open the application for the first time, a series of introductory screens presenting various information are displayed. Users can navigate through these screens to reach the main page.

## Project Structure

The project consists of the following main components:

- **main.dart**: The entry point of the application. It checks whether to display the intro screen or not.
- **home_page.dart**: The main page component. It shows a welcome message to the user when the application opens.
- **intro_screen_page.dart**: The introductory screen component. It allows the user to navigate between screens.
- **intro_screen_page_card.dart**: The card component used for each intro screen. It contains an image, title, description, and button.

## Packages Used

- **flutter**: The Flutter SDK.
- **hive_flutter**: Used for local database management with Hive.
- **smooth_page_indicator**: A page indicator that shows the current page when navigating through screens.

## Getting Started

### 1. Setting Up the Flutter Environment
Make sure you have Flutter installed and set up on your machine. Refer to the [Flutter installation guide](https://flutter.dev/docs/get-started/install) for instructions.

### 2. Installing Required Packages
Add the following dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.0.0
  hive_flutter: ^1.1.0
  path_provider: ^2.0.11
  smooth_page_indicator: ^1.2.0+3

```
### 3. Creating the Intro Screen Component
- Develop the `IntroScreenPage` class to incorporate the information and visuals that will be presented to the user.
- Create a card structure for each page using the `IntroScreenPageCard` component.

### 4. Creating the Home Page Component
- Implement the `HomePage` component, adding a welcoming message for the user.

### 5. Data Management
- Utilize the Hive database to determine whether the user has previously viewed the intro screens. First-time users will be shown the intro screens, while returning users will be redirected directly to the main page.

