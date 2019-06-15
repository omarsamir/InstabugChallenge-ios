# Instabug Challenge
This task is to make a UItableView displays movies from API moreover, user can upload his own movies (title, overview, date and poster)
# Environment
-   Swift 5
-   Xcode 10.2.1

# Design
  - VIPER design pattern.
    - View : 2 Classes `MoviesViewController` (Main View) and  `CreateNewMovieViewController` (Add movie)
    - Interactor : 1 Class `MoviesInteractor`, It Contains all business methods
    -  Entity : It owns all models needed `Movies`and`Results`.

# Managers
- APIClient: handle all network methods (API Calls) and parsing by implementing Codable methods.
- UIManager: handle main UI methods (Application TabbarViewController, RootView and UIALerts).

# Other Files
- Extentions: handle categories of cocoa framework models.
- Constants: contains all needed constants.
  
