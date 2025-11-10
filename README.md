<div align="center">
<img src="https://github.com/javieer-alvarez/Recipes/assets/appicon" alt="App Icon" width="400">
</div>

# Recipes

A simple and elegant **recipe manager** built with SwiftUI — designed to help users create, organize, and favorite their own recipes with full data persistence.

<div align="center">
<img src="https://github.com/javieer-alvarez/Recipes/assets/screenshot" alt="App Demo" width="400">
</div>

## 📱 Overview

**Recipes** is a modern SwiftUI app focused on simplicity and user experience.  
It lets users:
- ✏️ Create, edit, and delete custom recipes  
- 🧂 Add ingredients and detailed descriptions  
- 💾 Save recipes locally with **persistent storage**  
- ❤️ Mark and browse favorite recipes  
- 🗂️ Organize recipes into categories  
- 🔍 Search recipes by name or ingredient  
- 👨‍🍳 View recipe details including author and ingredients  

This app highlights **clean architecture** and SwiftUI best practices while implementing persistence for an offline-first experience.

---

## 🛠️ Tech Stack

- **Swift / SwiftUI** — declarative UI framework  
- **MVVM Architecture** — separates UI, logic, and data  
- **CoreData / Codable / UserDefaults** — persistent data layer  
- **Combine** — reactive bindings for real-time updates  

---

## 🚀 Getting Started

### Prerequisites
- **Xcode 16.0** or later  
- **iOS 18.2+** deployment target  

### Setup Instructions

1. **Fork & Clone the repository**
   ```bash
   git clone https://github.com/javieer-alvarez/Recipes.git
   cd Recipes
   ```

2. **Open in Xcode**
   - Open `Recipes.xcodeproj`
   - Choose your device or simulator  
   - Build & run (`Cmd + R`)

That’s it — no API keys, no configuration needed.

---

## 🧠 Architecture Overview

The app follows a **Clean MVVM** pattern:
- **Models:** Recipe, Ingredient, Author, Category  
- **ViewModels:** Handle persistence, filtering, and logic  
- **Views:** SwiftUI screens for recipe lists, details, creation, and search  
- **Persistence Layer:** Uses `UserDefaults` or `CoreData` for storing recipes  

This makes the app **modular**, **testable**, and **easy to maintain**.

---

## 📸 Screenshots

_Coming soon!_  

---

## ✨ Features

- Persistent storage of user recipes  
- Add ingredients, author name, and preparation description  
- Favorite recipes list  
- Categorize and filter recipes  
- Search recipes by keyword or ingredient  
- Clean and minimal SwiftUI interface  
- Local-first architecture (offline support)

---

## 💡 Future Improvements

- Cloud sync between devices  
- Recipe sharing with friends  
- Enhanced dark mode styling  

---

<div align="center">
Made with ❤️ using SwiftUI
</div>
