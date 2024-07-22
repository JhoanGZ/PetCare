# PetCare - Flutter Application

![PetCare Logo](https://your-image-link.com/logo.png)

PetCare is a comprehensive Flutter application designed to help pet owners manage their pets' health and well-being. This project was collaboratively developed as part of a university module in software engineering, focusing on the development of mobile applications.

## Features

- User authentication and profile management
- Pet health records and reminders
- Appointment scheduling with veterinarians
- In-app messaging and notifications
- Integration with external health services
- Responsive UI for various device sizes

## Technologies Used

- **Flutter**: For building the cross-platform mobile application
- **Dart**: Programming language for Flutter development
- **Laravel - SQL / Laragon**: Backend services for authentication, database, and notifications

## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed the latest version of [Flutter](https://flutter.dev/docs/get-started/install)
- You have a compatible IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)
- You have set up a Firebase project and added the necessary configuration files

### Installation

1. Clone the repository

    ```sh
    git clone https://github.com/JhoanGZ/PetCare_FrontEnd.git
    ```

2. Navigate to the project directory

    ```sh
    cd PetCare_FrontEnd
    ```

3. Install the dependencies

    ```sh
    flutter pub get
    ```

4. Run the application

    ```sh
    flutter run
    ```

## Usage

1. Register or log in to your account.
2. Add your pets' details and health records.
3. Schedule appointments with veterinarians.
4. Use the in-app messaging feature to communicate with health professionals.

## Project Structure

Here's an overview of the main files and directories in the project:

- `lib/main.dart`: Entry point of the Flutter application
- `lib/screens/`: Directory containing various screens of the app
- `lib/widgets/`: Directory containing reusable widgets
- `pubspec.yaml`: Project dependencies and configuration

```yaml
# pubspec.yaml
name: petcare
description: A new Flutter project.
version: 1.0.0+1

environment:
  sdk: ">=2.12.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^1.0.0
  firebase_auth: ^1.0.0
  cloud_firestore: ^1.0.0
  provider: ^5.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter

```
License
This project is licensed under the Apache License, Version 2.0. See the LICENSE file for more details.

Acknowledgements
Special thanks to our university and professors for their support and guidance.
Thanks to the Flutter and Firebase communities for their excellent resources and support.
