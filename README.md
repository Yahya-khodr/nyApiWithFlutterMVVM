# NewYork Times API testing

A sample FlutterApp that get list of Most poplular Articles from NyTimesAPi 

# Tools
* Flutter/Dart
* MVVM architecture
* Provider(State Managment)
* Http package for Network Calls

## How to run the App
1. Go to The NY times Developer site => https://developer.nytimes.com/apis
2. Get your API key by creating new api
3. Add your Api key to ```constants.dart``` in ```utils``` folder
```Dart
 const String apiKey = 'YOUR API KEY';
```
4. Add ```Latest Versions``` to your Packages 
[http](https://pub.dev/packages/http "http Package") and [Provider](https://pub.dev/packages/provider "provider package ")


## Screenshots 
![DetailScreen](/relative/path/to/homeScreen.jpg?raw=true "Home Screen")
![DetailScreen](/relative/path/to/detailScreen.jpg?raw=true "Detail Screen")


## For Testing 
Write ```flutter test ``` in the Terminal 

## Getting Started
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
