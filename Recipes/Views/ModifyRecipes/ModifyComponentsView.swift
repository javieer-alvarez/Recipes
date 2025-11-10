//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Javier Ignacio Alvarez Izaguirre on 18/6/25.
//

import SwiftUI

struct ModifyComponentsView <Component: RecipeComponent, DestinationView: ModifyComponentView> : View where DestinationView.Component == Component{
    @Binding var components: [Component]
    @State var newComponent: Component = Component()
    
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground

    var body: some View {

            VStack {
                let destination = DestinationView(component: $newComponent) { component in
                    components.append(component)
                        newComponent = Component()
                }
                
                if components.isEmpty { //En caso de que la lista esté vacía
                    NavigationLink(destination: destination
                    , label: {
                        Text("Add the first \(Component().instanceName)")
                    })
                }
                else { //En Caso de que la lista esté llena
                    
                    HStack{
                        Text(Component().pluralName().capitalized)
                            .font(.title).fontWeight(.bold)
                            .padding()
                        Spacer()
                        EditButton()
                            .padding()
                            .font(Font.custom("Mine", size: 18))
                    }
                    List{
                        ForEach(components.indices, id: \.self) { i in
                            NavigationLink(destination:
                                           modifyComponent(i)
                            , label: {Text(components[i].description)})
                            
                            
                            .foregroundColor(listTextColor)
                        }
                        .onDelete {components.remove(atOffsets: $0)} //Se tiene que poner de primero
                        .onMove { indices, newOffset in components.move(fromOffsets: indices, toOffset: newOffset)}
                        .listRowBackground(listBackgroundColor)
                    }
                    Spacer()
                    NavigationLink(destination: destination
                    , label:{
                        Text("Add New \(Component().pluralName())")
                    })
                }
            }
        }
    
    
    func modifyComponent(_ i: Int) -> some View {
        return DestinationView(component: $components[i]) { _ in
            return
            /// Because the DestinationView gets a binding to a recipe that already exists, the createAction closure doesn’t need to execute any code.
        }
        .navigationTitle("Edit \(components[i].instanceName)")
        
    }
    
    
}


protocol RecipeComponent : CustomStringConvertible, Codable{
    init()
    func pluralName() -> String
    var instanceName: String { get }
}

extension RecipeComponent {
    func pluralName() -> String {
        instanceName+"s"
    }
}

protocol ModifyComponentView : View{
    associatedtype Component
    
    init(component: Binding<Component>, createAction: @escaping (Component) -> Void)
}

extension ModifyComponentView {
    var listBackgroungColor: Color { AppColor.background }
    var listTextColor: Color { AppColor.foreground }
}


struct ModifyIngredientsView_Previews: PreviewProvider {
    @State static var ingredients: [Ingredient] = [
        Ingredient(name: "Flour", quantity: 500, unit: .gram),
        Ingredient(name: "Milk", quantity: 1, unit: .gram),
        Ingredient(name: "Sugar", quantity: 200, unit: .gram),
//        Ingredient(name: "Eggs", quantity: 3, unit: .gram),
//        Ingredient(name: "Butter", quantity: 100, unit: .gram)
    ]
    
    static var previews: some View {
        NavigationStack {
            ModifyComponentsView<Ingredient, ModifyIngredientView>(components: $ingredients)
        }
    }
}

