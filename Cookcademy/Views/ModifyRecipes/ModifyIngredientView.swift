//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Javier Ignacio Alvarez Izaguirre on 18/6/25.
//

import SwiftUI

struct ModifyIngredientView: ModifyComponentView {
    
    @Binding var ingredient : Ingredient
    let createAction: (Ingredient) -> Void
    
    init(component: Binding<Ingredient>, createAction: @escaping (Ingredient) -> Void){
        self._ingredient = component
        self.createAction = createAction
    }
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    

    
    @Environment(\.dismiss) var dismiss

    var body: some View{
        VStack{
            Form{
                TextField("Ingredient Name", text: $ingredient.name)
                    .listRowBackground(listBackgroundColor)
                Picker("Unit", selection: $ingredient.unit){
                    ForEach(Unit.allCases, id: \.self){unit in
                        Text(unit.rawValue)
                    }
                }
                .listRowBackground(listBackgroundColor)
                HStack{
                    // \(String(format: "%.1f", ingredient.quantity))
                    Text("Quantity: ")
                    Spacer()
                    TextField("Quantity", value: $ingredient.quantity, formatter: NumberFormatter.decimal)
                        .keyboardType(.numbersAndPunctuation)
                    Stepper("", value: $ingredient.quantity, in: 0...10000, step: 0.25)
                }
                .listRowBackground(listBackgroundColor)
                HStack {
                    Spacer()
                    Button(
                        action:{
                            createAction(ingredient)
                            dismiss()
                        },
                        label: {
                            Text("Save")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        })
                    Spacer()
                }
            }
            .foregroundColor(listTextColor)
            .listRowBackground(listBackgroundColor)
        }
    }
}

extension NumberFormatter{
    static var decimal : NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

#Preview{
    @Previewable @State var ingredient = Ingredient()
    ModifyIngredientView(component: $ingredient, createAction: {_ in print("Igredient Created")})
}
