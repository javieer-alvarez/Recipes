//
//  AppColor.swift
//  Cookcademy
//
//  Created by Javier Ignacio Alvarez Izaguirre on 13/3/25.
//
import SwiftUI

struct AppColor {
  static let background: Color = Color(.sRGB,
                                       red: 250/255,
                                       green: 240/255,
                                       blue: 230/255,
                                       opacity: 1)
  static let foreground: Color = Color(.sRGB,
                                       red: 25/255,
                                       green: 1/255,
                                       blue: 45/255,
                                       opacity: 1)
}

extension Color: RawRepresentable {
  public init?(rawValue: String) {
    do {
      let encodedData = rawValue.data(using: .utf8)!
      let components = try JSONDecoder().decode([Double].self, from: encodedData)
      self = Color(red: components[0],
                   green: components[1],
                   blue: components[2],
                   opacity: components[3])
    }
    catch {
      return nil
    }
  }
  
  public var rawValue: String {
    guard let cgFloatComponents = UIColor(self).cgColor.components else { return "" }
    let doubleComponents = cgFloatComponents.map { Double($0) }
    do {
      let encodedComponents = try JSONEncoder().encode(doubleComponents)
      return String(data: encodedComponents, encoding: .utf8) ?? ""
    }
    catch {
      return ""
    }
  }
}


