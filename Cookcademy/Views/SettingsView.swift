//
//  SettingsView.swift
//  Cookcademy
//
//  Created by Javier Ignacio Alvarez Izaguirre on 14/7/25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("hideOptionalSteps") private var hideOptionalSteps: Bool = false
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            NavigationStack{
                Form{
                    ColorPicker("List Background Color", selection: $listBackgroundColor)
                        .padding()
                        .listRowBackground(listBackgroundColor)
                    ColorPicker("List Foreground Color", selection: $listTextColor)
                        .padding()
                        .listRowBackground(listBackgroundColor)
                    Toggle(
                        "Hide Optional Steps",
                        isOn: $hideOptionalSteps
                    )
                    .padding()
                    .listRowBackground(listBackgroundColor)
                }
                .foregroundColor(listTextColor)
                .navigationTitle("Settings")
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {    
    static var previews: some View {
        SettingsView()
    }
}
