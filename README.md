# url_shortener

This is a Flutter url shortener app powered by [shrtcode API](https://shrtco.de/docs/)

# Screen Record

## Success

https://user-images.githubusercontent.com/46047252/132255955-2436ca9c-f74e-4668-a268-f80426993665.mp4

## Fail

https://user-images.githubusercontent.com/46047252/132255962-8d052f83-e33a-41a0-adbe-0ca6a290dfe7.mp4

## Getting Started

- Clone this repo to your desktop and run  `flutter pub get packages` to install all the dependencies.
- Run `flutter run` to launch app

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Features

- Shorten any valid link
- Save link history in phone

## Built with

- Flutter 2.2.3
- Dart 2.13.4

## Packages i used and why

- Provider: I don't want to read data every time from database, i just read once in loading and keep store it in provider
- Sqflite: Stroe data in phone
- Dio: Networking
- json_annotation: Parse json to model

## Project Structure

- MVVM
- Every view is inherited from BaseView
- Every model is inherited from BaseModel
- Every viewmodel is inherited from BaseViewModel
- Dio network layer
- Database layer

## Todo

- Test for iOS

# Screenshots

##
![Screenshot_1630952624](https://user-images.githubusercontent.com/46047252/132256334-fe061007-6d98-48f0-8ade-a285bcd484a6.png)

##
![Screenshot_1630952707](https://user-images.githubusercontent.com/46047252/132256356-cfc71f5a-a8f0-4d8b-810e-a070be2922b6.png)


