<div align="center">
<img width="400" alt="AppIconRecipes" src="https://github.com/user-attachments/assets/b7f14702-83e8-4a21-a544-a37994e7ac55" />
</div>


# Recipes

<div align="center">
![Swift](https://img.shields.io/badge/Swift-6.2.1-orange?style=for-the-badge&logo=swift)
![Platform](https://img.shields.io/badge/iOS-18.2%2B-lightgrey?style=for-the-badge&logo=apple)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-blue?style=for-the-badge)
![Persistence](https://img.shields.io/badge/Storage-CoreData%20%2F%20UserDefaults-green?style=for-the-badge)
</div>

A simple and elegant **recipe manager** built with SwiftUI — designed to help users create, organize, and favorite their own recipes with full data persistence.

<div align="center">
<img width="400" alt="IMG_5268" src="https://github.com/user-attachments/assets/3eef38d5-1015-4112-8258-2b74f006e16b" />
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
<div align="center">
<img width="300" alt="IMG_5269" src="https://github.com/user-attachments/assets/7d5fc520-b0a2-43a4-94e0-1d26554e26f2" />
<img width="300" alt="IMG_5270" src="https://github.com/user-attachments/assets/d3f487fc-732d-484b-9fd4-4d8ffaa31f67" />
<img width="300" alt="IMG_5271" src="https://github.com/user-attachments/assets/51d5f5b1-200b-4c41-959b-ea70ae8a0139" />
<img width="300" alt="Screenshot 2025-11-21 at 23 37 42" src="https://github.com/user-attachments/assets/2b63c4a9-ddf7-4e91-8a52-28ad11741f28" />
</div>

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
