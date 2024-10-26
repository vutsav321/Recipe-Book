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
![Screenshot_1729953445](https://github.com/user-attachments/assets/d99526b1-1a2e-48a9-b1f4-7499bb5d0a37)
![Screenshot_1729953548](https://github.com/user-attachments/assets/cff7892d-ecba-43fd-8d48-993810e39c45)
![Screenshot_1729953535](https://github.com/user-attachments/assets/eb3457de-281a-457d-8c59-4793139f3aa4)
![Screenshot_1729953666](https://github.com/user-attachments/assets/b71047ef-e186-4757-b343-7027d2ac59c6)
![Screenshot_1729953597](https://github.com/user-attachments/assets/ab8a95de-ba6a-4aba-95b0-a69f4eebf51f)
![Screenshot_1729953768](https://github.com/user-attachments/assets/569c191b-325a-4941-98b8-603ccf15262d)


## [Edamam API 🔗](https://www.edamam.com/)
The Recipe Book app uses the Edamam API to fetch recipe data. Be sure to read their documentation and terms of use to understand the data usage limits and guidelines.
