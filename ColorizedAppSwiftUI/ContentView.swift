//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Иван on 10/21/20.
//  Copyright © 2020 Ivan Savkov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValueR : Double = 0
    @State private var sliderValueG : Double = 0
    @State private var sliderValueB : Double = 0
    
    var body: some View {
        ZStack {
            Color.init(.lightGray)
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 20) {
                Color.init(red: (sliderValueR / 255) ,
                           green: (sliderValueG / 255) ,
                           blue: (sliderValueB / 255))
                    .cornerRadius(15)
                    .frame(height: 200.0)
                    .overlay(RoundedRectangle.init(cornerRadius: 20)
                        .stroke(lineWidth: 4) .foregroundColor(.white))
                
                ColorSlider(value: $sliderValueR).accentColor(.red)
                ColorSlider(value: $sliderValueG).accentColor(.green)
                ColorSlider(value: $sliderValueB).accentColor(.blue)
                Spacer()
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    let formatter = NumberFormatter()
    
    var body: some View {
        HStack() {
            Text(String(lround(value))).foregroundColor(.black)
            Slider(value: $value, in: 0...255, step: 1)
            TextField(String(lround(value)), value: $value, formatter: formatter)
                .frame(width: 40)
                .background(Color.init(.white)
                .cornerRadius(7))
        }
    }
}
