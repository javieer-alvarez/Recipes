//
//  NewRecipeView.swift
//  Cookcademy
//
//  Created by Javier Ignacio Alvarez Izaguirre on 19/5/25.
//

import SwiftUI

struct ModifyRecipeView : View{
    
    enum Selection: String, CaseIterable{
        case main = "Main"
        case ingredients = "Ingredients"
        case directions = "Directions"
    }
    
    
    @Binding var recipe: Recipe
    @State private var selection : Selection = .main
    
    
    var body: some View{
        VStack {
            Picker("Options", selection: $selection){
                ForEach(Selection.allCases, id:\.self){ selection in
                    Text(selection.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            switch selection{
            case .main:
                ModifyMainInformationView(mainInformation: $recipe.mainInformation)
            case .ingredients:
                ModifyComponentsView<Ingredient, ModifyIngredientView>(components: $recipe.ingredients)
            case .directions:
                ModifyComponentsView<Direction, ModifyDirectionView>(components: $recipe.directions)
            }
            Spacer()
        }
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
  @State static var recipe = Recipe()
  static var previews: some View {
      NavigationStack {
          ModifyRecipeView(recipe: $recipe)
      }
  }
}
