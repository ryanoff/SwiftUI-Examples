//
//  Styles.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 12/5/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

extension Color {

    static let ButtonBlue: Color = Color("ButtonBlue")

}

struct PrimaryButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.headline)
            .padding(.top, 15)
            .padding(.trailing, 40)
            .padding(.bottom, 15)
            .padding(.leading, 40)
            .background(Color.ButtonBlue)
            .cornerRadius(5)
            .accentColor(Color.white)
    }
}

struct SecondaryButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.headline)
            .padding(.top, 15)
            .padding(.trailing, 40)
            .padding(.bottom, 15)
            .padding(.leading, 40)
            .accentColor(Color.ButtonBlue)
            .foregroundColor(Color.ButtonBlue)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.ButtonBlue))
    }
}

struct ClearButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.headline)
            .padding(.top, 15)
            .padding(.trailing, 18)
            .padding(.bottom, 15)
            .padding(.leading, 18)
            .accentColor(Color.ButtonBlue)
            .foregroundColor(Color.ButtonBlue)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.ButtonBlue))
    }
}

struct GradientBackgroundStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
//            .background(LinearGradient(gradient: Gradient(colors: [Color("ButtonBlue"), Color("ButtonBlue")]), startPoint: .leading, endPoint: .trailing))
            .background(Color.ButtonBlue)
            .cornerRadius(5)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}
