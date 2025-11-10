//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Javier Ignacio Alvarez Izaguirre on 7/3/25.
//

import SwiftUI

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    
    var favoriteRecipes: [Recipe]{
        recipes.filter {$0.isFavorite}
    }
    
    private var recipesFileURL: URL {
        do {
            
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return documentsDirectory.appendingPathComponent("recipeData")
            
        }
        catch{
            fatalError("Failed to find documents directory: \(error)")
        }
    }
    
    func filteredRecipes(for category: Category) -> [Recipe]{
        var filteredRecipes = [Recipe]()
        for recipe in recipes{
            if recipe.mainInformation.category == category{
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    func add(_ recipe: Recipe){
        if(recipe.isValid){
            recipes.append(recipe)
            saveRecipes()
        }
    }
    
    func index(of recipe: Recipe) -> Int?{
        for i in recipes.indices{
            if recipes[i].id == recipe.id{
                return i
            }
        }
        return nil
    }
    
    func saveRecipes() {
        do {
            let data = try JSONEncoder().encode(recipes)
            try data.write(to: recipesFileURL)
        }
        catch {
            fatalError("Failed to save recipes: \(error)")
        }
    }
    func loadRecipes() {
            guard let data = try? Data(contentsOf: recipesFileURL) else { return }
        do{
            let savedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
            recipes = savedRecipes
        }
        catch{
            fatalError("Failed to load recipes: \(error)")
        }
    }
}

