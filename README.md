
<h1 align="center"><strong>PetCare - Flutter Application</strong></h1>


<p align="center">
  <img src="https://github.com/JhoanGZ/PetCare_FrontEnd/blob/main/assets/images/logo_petcare.png?raw=true" alt="PetCare Logo" />
</p>


PetCare is a comprehensive Flutter application designed to help pet foundations to show pets profiles for adoption and give a donors and new adopting owners the opportunity to help a pet in need. 
This project was collaboratively developed as part of a university module in software engineering. 
We, as a team, chose to develope this project in Flutter/Laravel.

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
- **SQL**: Relational database management system
- **Laravel - Laragon**: Backend services for authentication and notifications (API)

## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed the latest version of [Flutter](https://flutter.dev/docs/get-started/install)
- You have a compatible IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)
- You have Android Studio for Mobile Virtualization Management and features
- You have set up the PetCare - BackEnd Project and added the necessary configuration files

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
## License
This project is licensed under the Apache License, Version 2.0. See the LICENSE file for more details.

## Acknowledgements
Special thanks to my partners and friends from my university and professors for their support and guidance for this midterm studies project.
Thanks to the Flutter communities for their excellent resources and support.

[Project Link BackEnd](https://github.com/JhoanGZ/PetCare_BackEnd)
