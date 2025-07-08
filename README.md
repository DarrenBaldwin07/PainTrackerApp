# IPain - Pain Tracking App

IPain (also known as Adyptaion - Pain tracker) is an iOS application designed to help users track their pain levels over time. This app allows users to record daily pain levels, identify causes, and monitor patterns to better manage chronic pain conditions.

## Features

- **Pain Level Tracking**: Record daily pain levels on a scale of 0-9
- **Cause Identification**: Choose from common pain causes (Food, Injury, Stress, Sickness) or add custom causes
- **Pain History**: View a chronological history of all pain entries
- **Pain Analytics**: Track average pain levels and visualize pain progression
- **User-friendly Interface**: Simple, intuitive design for easy daily tracking

## Technical Overview

### Requirements
- iOS 13.0+
- Xcode 11.0+
- Swift 5.0+
- CocoaPods

### Dependencies
- Firebase Authentication
- Firebase Firestore
- Other Firebase components for analytics and data management

### Project Structure
- **ViewControllers**: Contains the main app interface controllers
  - InterfaceViewController: Main pain tracking interface
  - PainHistoryViewController: Displays historical pain data
  - LoginViewController: Handles user authentication
  - SignUpViewController: Manages user registration
- **ExtraClasses**: Utility classes for app functionality
- **Resources**: Contains data models and resources

## Getting Started

1. Clone the repository
2. Install CocoaPods if not already installed:
   ```
   sudo gem install cocoapods
   ```
3. Install dependencies:
   ```
   pod install
   ```
4. Open the `.xcworkspace` file in Xcode
5. Build and run the project

## Usage

1. Register or log in to your account
2. On the main interface, enter your pain level (0-9)
3. Tap "Submit" to record your pain
4. For pain levels 1-9, select the cause of pain
5. View your pain history and statistics on the Pain History screen

## Privacy and Data Storage

The app stores user pain data securely using Firebase Firestore and local device storage. User authentication is handled through Firebase Authentication.

## License

Copyright © 2020 Darren Baldwin Jr. All rights reserved.

<!-- Why did the pain app go to therapy? It had too many issues with its relationships! -->