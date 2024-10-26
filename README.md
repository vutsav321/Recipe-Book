# Recipe Book 📖
Recipe Book is a Flutter application designed to help you find delicious recipes across various cuisines, meal types, and dish types. Powered by the Edamam API, this app lets you search for recipes, save your favorite ones, and view your browsing history with ease.

## Features ✨
Recipe Search: Search recipes based on cuisine, meal type, or dish type using the Edamam API.
Favorite Recipes: Mark recipes as favorites for quick access.
Recipe History: View a list of previously viewed recipes.
Shared Preferences: Stores favorites and history locally using the shared_preferences package.

## Getting Started 🚀
### Prerequisites
-Flutter SDK installed on your machine
-Edamam API credentials (app ID and app key) to access the recipe search API. You can obtain these by signing up on the Edamam website.
-Installation
Clone the repository:

bash
Copy code
git clone https://github.com/yourusername/recipe-book.git
cd recipe-book
Install dependencies:

bash
Copy code
flutter pub get
Configure API credentials:

Create a .env file in the root of the project and add your Edamam API credentials:
env
Copy code
EDAMAM_APP_ID=your_app_id
EDAMAM_APP_KEY=your_app_key
Run the app:

bash
Copy code
flutter run
Dependencies 🛠️
http: For making API requests to the Edamam API.
shared_preferences: For storing favorite and previously viewed recipes.
flutter_dotenv: For managing API credentials in a secure way.
## Usage 🧑‍🍳
Search Recipes:  Select a cuisine, meal type, or dish type to fetch recipes from the Edamam API.
View Recipe Details: Tap on a recipe to see detailed information, including ingredients and cooking instructions.
Save Favorites: Mark recipes you like as favorites and access them anytime.
Browse History: Check recipes you've previously viewed in the history section.
## Screenshots 📸
(Add screenshots of the app here to showcase the user interface)

## [Edamam API 🔗](https://www.edamam.com/)
The Recipe Book app uses the Edamam API to fetch recipe data. Be sure to read their documentation and terms of use to understand the data usage limits and guidelines.