# Adyptaion - Pain Tracker

## Overview
Adyptaion is a mobile application designed to help users track and monitor their pain levels over time. The app provides a simple interface for recording daily pain intensity on a scale of 0-9, along with associated causes such as food, injury, stress, sickness, or custom factors. By tracking these patterns, users can identify potential triggers and gain insights into their pain management.

## Features

### Pain Tracking
- Record daily pain levels on a scale from 0-9
- Track the cause of pain (Food, Injury, Stress, Sickness, or Other)
- Add custom causes for more specific tracking
- View current pain level and cause at a glance

### Data Visualization
- View pain history in a chronological list
- Monitor average pain level over time
- Track progress with visual progress indicator

### User Experience
- Clean, intuitive interface
- Simple one-tap pain recording
- Secure local data storage
- Welcome screen for first-time users

## Technical Details

### Development Environment
- Swift 5
- iOS 13.0+
- Xcode 11.0+

### Dependencies
- Firebase Authentication
- Firebase Core
- Firebase Firestore (for future cloud synchronization)

## Getting Started

### Prerequisites
- Xcode 11.0 or later
- iOS 13.0 or later
- CocoaPods

### Installation
1. Clone the repository
```
git clone [repository URL]
```

2. Install CocoaPods dependencies
```
pod install
```

3. Open the workspace file
```
open "Adyptaion - Pain tracker.xcworkspace"
```

4. Build and run the application on a simulator or device

## Usage
1. First-time users will see a welcome screen
2. Enter your pain level (0-9) in the input field
3. Tap "Submit" to record your pain level
4. If pain level is 1-9, select a cause from the options provided
5. View your pain history by tapping the "Pain History" button
6. Monitor your average pain level on the main screen

## Future Enhancements
- Cloud synchronization of pain data
- Advanced analytics and pattern recognition
- Medication tracking
- Appointment scheduling
- Export functionality for sharing with healthcare providers

## Contributing
Contributions to improve Adyptaion are welcome. Please feel free to submit a pull request or open an issue to discuss proposed changes.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments
- Developed by Darren Baldwin Jr.
- Thanks to all contributors and testers

<!-- Why did the developer go broke? Because he used up all his cache! -->