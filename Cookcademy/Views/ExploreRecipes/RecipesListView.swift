//
//  ContentView.swift
//  Cookcademy
//
//  Created by Javier Ignacio Alvarez Izaguirre on 27/2/25.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject private var recipeData : RecipeData
    let viewStyle: ViewStyle
    
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
    var body: some View {
            List{
                ForEach(recipes){recipe in
                    let r = binding(for: recipe)
                    NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: r))
                }
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
            }
            .navigationTitle(navigationTitle)
            .toolbar{
                ToolbarItem{
                    Button(action:{
                        isPresenting = true
                    },
                           label:{
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $isPresenting, content: {
                NavigationStack{
                    ModifyRecipeView(recipe: $newRecipe)
                        .toolbar{
                            ToolbarItem(placement: .cancellationAction){
                                Button("Dismiss"){
                                    isPresenting = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction){
                                if newRecipe.isValid {
                                    Button("Add"){
                                        if case .favorite = viewStyle{
                                            newRecipe.isFavorite = true
                                        }
                                        recipeData.recipes.append(newRecipe)
                                        isPresenting = false
                                    }
                                }
                            }
                        }
                        .navigationTitle("New Recipe")
                }
            })
        }
    }


extension RecipesListView {
    var navigationTitle : String{
        switch viewStyle {
        case let .singleCategory(category):
            return "\(category.rawValue) Recipes"
        case .favorite:
            return "Favorite Recipes"
        }
    }
    
    private var recipes : [Recipe] {
        switch viewStyle {
        case let .singleCategory(category):
            return recipeData.filteredRecipes(for: category)
        case .favorite:
            return recipeData.favoriteRecipes
        }
    }
    
    func binding(for recipe: Recipe) -> Binding<Recipe> {
        guard let index = recipeData.index(of: recipe) else{
            fatalError("Recipe Not Found")
        }
        return $recipeData.recipes[index]
    }
    
    enum ViewStyle {
        case favorite
        case singleCategory(Category)
    }
}

#Preview {
    NavigationStack {
        RecipesListView(viewStyle: .singleCategory(.breakfast))
            .environmentObject(RecipeData())
    }
}
