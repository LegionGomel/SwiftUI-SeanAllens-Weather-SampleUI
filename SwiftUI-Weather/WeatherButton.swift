//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Yuri Ershov on 18.11.21.
//

import SwiftUI

// Reusable Weather button appearance for use in various places of app

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
