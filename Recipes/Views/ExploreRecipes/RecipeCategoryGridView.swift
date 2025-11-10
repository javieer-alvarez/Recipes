//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Javier Ignacio Alvarez Izaguirre on 28/3/25.
//
import SwiftUI
import Foundation
struct RecipeCategoryGridView : View{
    
    @EnvironmentObject private var recipeData: RecipeData

    var body: some View{
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: [GridItem()]){
                    ForEach(Category.allCases, id: \.self){ category in
                        NavigationLink(
                            destination: RecipesListView(viewStyle: .singleCategory(category))
                                .environmentObject(recipeData),
                            label: {
                            CategoryView(category: category)
                        })
                    }
                }
                .navigationTitle("Categories")
            }
        }
    }
}

struct CategoryView: View{
    let category: Category
    var body: some View{
        ZStack{
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(category.rawValue)
                .font(.title)
                .foregroundColor(.white)
                .fontWeight(.light)
                .shadow(color: .black.opacity(1), radius: 20)
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider{
    static var previews : some View{
        RecipeCategoryGridView()
            .environmentObject(RecipeData())
    }
}

