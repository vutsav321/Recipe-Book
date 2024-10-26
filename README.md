# Recipe Book 📖
Recipe Book is a Flutter application designed to help you find delicious recipes across various cuisines, meal types, and dish types. Powered by the Edamam API, this app lets you search for recipes, save your favorite ones, and view your browsing history with ease.

## Features ✨
Recipe Search: Search recipes based on cuisine, meal type, or dish type using the Edamam API.
Favorite Recipes: Mark recipes as favorites for quick access.
Recipe History: View a list of previously viewed recipes.
Shared Preferences: Stores favorites and history locally using the shared_preferences package.

## Getting Started 🚀
### Prerequisites
-Flutter SDK installed on your machine<br>
-Edamam API credentials (app ID and app key) to access the recipe search API. You can obtain these by signing up on the Edamam website.<br>
-Installation<br>
Clone the repository:<br>

bash<br>
-git clone https://github.com/vutsav321/Recipe-Book.git<br>
-cd recipe-book<br>
-Install dependencies:<br>

bash<br>

-flutter pub get<br>
-Configure API credentials:<br>

Create a .env file in the root of the project and add your Edamam API credentials:<br>
env<br>
-EDAMAM_APP_ID=your_app_id<br>
-EDAMAM_APP_KEY=your_app_key<br>
Run the app:<br>

bash<br>
-flutter run<br>
## Dependencies 🛠️<br>
-http: For making API requests to the Edamam API.<br>
-shared_preferences: For storing favorite and previously viewed recipes.<br>
-get: For state management.<br>
-webview: For embeding the Android's WebView within the Flutter app.<br>

## Usage 🧑‍🍳
-Search Recipes:  Select a cuisine, meal type, or dish type to fetch recipes from the Edamam API.<br>
-View Recipe Details: Tap on a recipe to see detailed information, including ingredients and cooking instructions.<br>
-Save Favorites: Mark recipes you like as favorites and access them anytime.<br>
-Browse History: Check recipes you've previously viewed in the history section.<br>
## Screenshots 📸
<img src="https://github.com/user-attachments/assets/1c4e9704-9010-4ff6-b4ed-f0e749e7c85e" alt="Screenshot" width="300"/>
<img src="https://github.com/user-attachments/assets/d99526b1-1a2e-48a9-b1f4-7499bb5d0a37" alt="Screenshot" width="300"/>
<img src="https://github.com/user-attachments/assets/cff7892d-ecba-43fd-8d48-993810e39c45" alt="Screenshot" width="300"/>
<img src="https://github.com/user-attachments/assets/eb22976c-2d9f-42d6-b76f-d6570d3a6fb9" alt="Screenshot" width="300"/>
<img src="https://github.com/user-attachments/assets/eb032f49-998a-4d6a-94a1-e1f730875db3" alt="Screenshot" width="300"/>
<img src="https://github.com/user-attachments/assets/bdf0a090-6f99-4fd6-9183-98fc123fd958" alt="Screenshot" width="300"/>
<img src="https://github.com/user-attachments/assets/2d8263a5-a94f-4d6c-9492-22f301af3a16" alt="Screenshot" width="300"/>
<img src="https://github.com/user-attachments/assets/e2299886-a708-40ab-9b31-86658dd94d96)" alt="Screenshot" width="300"/>


## [Edamam API 🔗](https://www.edamam.com/)
The Recipe Book app uses the Edamam API to fetch recipe data. Be sure to read their documentation and terms of use to understand the data usage limits and guidelines.
