//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Javier Ignacio Alvarez Izaguirre on 6/7/25.
//

import SwiftUI

struct MainTabView : View {
    
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        
        TabView {
            Tab("Recipes", systemImage: "list.dash"){
                RecipeCategoryGridView()
            }
            Tab("Favorites", systemImage: "heart.fill"){
                NavigationStack {
                    RecipesListView(viewStyle: .favorite)
                }
            }
            Tab("Settings", systemImage: "gear"){
                SettingsView()
            }
        }
        .environmentObject(recipeData)
        .onAppear {
            recipeData.loadRecipes()
        }
    }
}

struct MainTabView_Previews : PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
