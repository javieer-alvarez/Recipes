//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Javier Ignacio Alvarez Izaguirre on 10/3/25.
//
import SwiftUI

struct RecipeDetailView : View {
    
    @Binding var recipe: Recipe
        
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    @AppStorage("hideOptionalSteps") private var hideOptionalSteps: Bool = false
    
    @EnvironmentObject var recipeData: RecipeData
    
    @State private var isPresented = false
        
    var body: some View{
        
        VStack{
            
            HStack{
                Text("Author: \(author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack{
                Text(recipe.mainInformation.description)
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            
            List{
                Section(header: Text("Ingredients")){
                    ForEach(ingredients.indices, id: \.self){index in
                        Text(ingredients[index].description)
                            .foregroundColor(listTextColor)
                    }
                }
                .listRowBackground(listBackgroundColor)
                Section(header: Text("Directions")){
                    ForEach(directions.indices, id: \.self){index in
                        let direction = directions[index]
                        if direction.isOptional && hideOptionalSteps {
                            EmptyView()
                        }
                        else {
                            HStack {
                                let index = recipe.index(of: direction, excludingOptionalDirections: hideOptionalSteps) ?? 0
                                Text("\(index+1). ").bold()
                                Text(directions[index].description)
                            }
                            .foregroundColor(listTextColor)
                        }
                    }
                }
                .listRowBackground(listBackgroundColor)
            }
        }
        .navigationTitle(recipe.mainInformation.name)
        .toolbar {
            ToolbarItem{
                HStack {
                    Button("Edit"){
                        isPresented = true
                    }
                    Button(action: {
                        recipe.isFavorite.toggle()
                    }){
                        Image(systemName: recipe.isFavorite ? "heart.fill" : "heart" )
                    }
                    
                }
            }
        }
        .sheet(isPresented: $isPresented){
            NavigationStack {
                ModifyRecipeView(recipe: $recipe)
                    .toolbar{
                        ToolbarItem(placement: .confirmationAction){
                            Button("Save"){
                                isPresented = false
                            }
                        }
                    }
                    .navigationTitle("Edit Recipe")
            }
            .onDisappear(){
                recipeData.saveRecipes()
            }
        }
    }
}

//MARK: - Computed Variables
extension RecipeDetailView{
    
    var author: String{
        recipe.mainInformation.author
    }
    var ingredients : [Ingredient]{
        recipe.ingredients
    }
    var directions: [Direction]{
        recipe.directions
    }
    
}

struct RecipeDetailView_Previews : PreviewProvider {
    
    @State static var recipe: Recipe = Recipe.testRecipes[0]
    
    static var previews: some View {
        NavigationView {
            RecipeDetailView(recipe: $recipe)
        }
    }
}
