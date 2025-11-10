//
//  ModifyDirectionView.swift
//  Cookcademy
//
//  Created by Javier Ignacio Alvarez Izaguirre on 26/6/25.
//

import SwiftUI

struct ModifyDirectionView: ModifyComponentView{
    
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    @Binding var direction: Direction
    let createAction: (Direction) -> (Void)
    
    init(component: Binding<Direction>, createAction: @escaping (Direction) -> Void){
        self._direction = component
        self.createAction = createAction
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        VStack{
            Form{
                TextField("Direction Description", text: $direction.description)
                    .listRowBackground(listBackgroundColor)
                Toggle("Optional Direction", isOn: $direction.isOptional)
                    .listRowBackground(listBackgroundColor)
                    HStack{
                        Spacer()
                        Button(
                            action:{
                                createAction(direction)
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

struct ModifyDirectionView_Preview: PreviewProvider {
    
    @State static var direction: Direction = Direction(description: "", isOptional: false)
    static var previews: some View {
        NavigationStack {
            ModifyDirectionView(component: $direction, createAction: {_ in print("Direction Created")
            })
        }
    }
}
