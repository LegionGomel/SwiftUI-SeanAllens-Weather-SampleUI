//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Yuri Ershov on 18.11.21.
//

import SwiftUI

struct ContentView: View {
    
    /*
     Making property wrapper to react UI on change this value.
     value with @state is taking out of struct to part of memory,
     that allows changes to variable and do not destroyed when views
     are constantly created and destroyed. Because body view is
     immutable STRUCT.
     @state value acts as a POINTER
     */
    @State private var isNight = false

    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                WeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                            temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
                }
                
                Spacer()
                
                Button {
                    /*
                     Toggle night mode. UI is watching isNight value
                     and change background color according values
                     that stored for top and bottom background gradient color
                     */
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extracted day of weather to not to repeat yourself - reusable day view
struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

// Reusable background view with color paremeters
struct BackgroundView: View {
    
    /*
     Binding means it is always the same as the @state (isNight)
     Binds @binding value as a children to main value
     We need bind in an arguments field when we call our function
     in main view body
     */
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

// Reusable text view with city name parameter
struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

// Reusable main weather view with weather icon name and temperature number
struct WeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
            // To make this icon multicolored
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
            // To make this icon not so big (size of the frame)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}


