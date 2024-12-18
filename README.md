# Movie App Challenge

A new flutter project that shows us the list of most popular movies and the details of the movie (Name, Description, Genre, Poster and Release Date).

## Architecture
In this project we use Clean Architecture with the following structure:

lib/
  - Core/
      - errors/
      - network/
      - utils/
  - data/
      - datasources/
      - models/
      - repositories/
  - domain/
      - entities/
      - repositories/
      - usecases/
  - presentation/
      - cubit/
      - screens/
      - widgets/
    
This architecture follows the Clean Architecture pattern, which focuses on separating application responsibilities into different layers to make the code more maintainable, scalable, and easy to test. The goal is to isolate business logic from infrastructure (e.g. APIs, databases, etc.) and presentation.

## Features

This project has the following features:
  -  List of popular movies
  -  Details of popular movies (Name, Description, Genre, Poster and Release Date).
  -  Paginated API query
  -  Dark mode
  -  Language (English, Spanish)
  -  Android, iOS and Web compatibility

## Installation
### 1. Clone the repo
```bash
git clone https://github.com/JAlexAj93/movie_app.git
cd movie_app
```
### 2. Run pub get
```bash
flutter pub get
```
### 4. Or run the script 'build_ios.sh' if you want to run in iOS Device
```bash
bash build_ios.sh
```
### 5. Add your Bearer Token into config.json file
```json
{
  "BEARER_TOKEN": "put_your_bearer_token_here"
}
```
### 6. Run the app
```bash 
flutter run --dart-define-from-file config.json
```
### 7. Run on Visual Studio
If you want to use Visual Studio to launch the application, configure your launch.json file and add the arguments as in the following example:
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "movie_app",
      "request": "launch",
      "type": "dart",
      "args": [
        "--dart-define-from-file",
        "config.json",
      ]
    }
  ]
}
```
## ScreenShots
### LightMode and English Language
<img width="1276" alt="MovieAppPlatforms" src="https://github.com/user-attachments/assets/5627895a-f40c-4912-880e-0fbb1a8c8914" />

### DarkMode and Spanish Language
<img width="1269" alt="MovieAppPlartformsDarkMode" src="https://github.com/user-attachments/assets/7391c566-5960-493d-ae81-9dcc3d9ad967" />

### Detail Screen
<img width="1270" alt="DetailScreen" src="https://github.com/user-attachments/assets/58ad3e9c-e518-48ce-8ffe-eb71db0d48d5" />

## Flutter SDK Version
This application was developed with Flutter version 3.24.5
