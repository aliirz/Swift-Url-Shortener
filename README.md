# URL Shortener iOS App
A simple iOS app built with SwiftUI that allows users to shorten URLs using the Bitly API. The app provides a text field for users to input their long URL, and upon pressing the “Shorten URL” button, the app generates and copies the short URL to the user’s clipboard.

##  Features
* Shorten URLs using Bitly API
* Automatically copy the short URL to the clipboard
* Show success or error alerts

## Installation
### Prerequisites
* Xcode 13 or later
* iOS 15 or later
* A Bitly API Key
### Steps
1. Clone this repository:
```bash
git clone https://github.com/yourusername/URLShortener.git
```

2. Open the project in Xcode.
3. Add the Alamofire library to the project using Swift Package Manager or CocoaPods.

Swift Package Manager:
* Go to File > Add Packages…
* Search for Alamofire and add the package to your project.

CocoaPods:
* Install CocoaPods if you haven’t already: sudo gem install cocoapods
* Navigate to the project directory in Terminal.
* Run pod init to create a Podfile.
*  Add pod ‘Alamofire’ to the Podfile.
* Run pod install to install the Alamofire library.
* Open the .xcworkspace file that was generated.

4. Replace “YOUR_BITLY_API_KEY” in the BitlyViewModel class with your Bitly API key.
5. Build and run the app on a simulator or a physical device.

## Usage
1. Open the app on your device or simulator.
2. Paste or type a long URL into the text field.
3. Tap the “Shorten URL” button to generate a short URL using the Bitly API.
4. If the operation is successful, the app will display a success alert and copy the short URL to your clipboard. If there is an error, the app will display an error alert.

## Contributing
Pull requests are welcome. For significant changes, please open an issue first to discuss what you want to change.

## License
MIT
