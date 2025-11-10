//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Javier Ignacio Alvarez Izaguirre on 18/6/25.
//

import SwiftUI

struct ModifyMainInformationView: View {
    
    @Binding public var mainInformation: MainInformation
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    var body: some View{
        Form{
            TextField("Name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
            TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
            Section(header: Text("Description")) {
                TextEditor(text: $mainInformation.description)
                    .listRowBackground(listBackgroundColor)
                    .foregroundColor(listTextColor)
            }
            Picker("Category", selection: $mainInformation.category){
                ForEach(Category.allCases, id: \.self){ category in
                    Text(category.rawValue)
                }
            }
            .pickerStyle(.inline)
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
        }
    }
}

#Preview {
    @Previewable @State var mainInformation = MainInformation(name: "", description:"Here goes the description", author: "", category: Category.breakfast)
    ModifyMainInformationView(mainInformation: $mainInformation)
}
