//
//  LoadingView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 1/1/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var loading = true
    
    var body: some View {
        
        VStack {
            
            Toggle(isOn: $loading) { Text("Loading") }
                .padding(100)
                .padding(.top, 100)

            if self.loading == true {
                IndicatorView()
            }

            Spacer()
            
        } //VStack
        
    } // body
} // view

struct IndicatorView: View {
        
    @State private var rotating = false
    private var size: CGFloat = 15
    private var thickness: CGFloat = 2

    var body: some View {
        
        VStack {
            
            Circle()
                .trim(from: 0, to: 0.30)
                .stroke(Color.green, style: StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round))
                .background(Circle().stroke(Color.green, lineWidth: thickness).opacity(0.2))
                .frame(width: size, height: size)
                .rotationEffect(.degrees(rotating ? 360 : 0))
                .animation(
                    Animation.linear(duration: 0.7)
                        .repeatForever(autoreverses: false)
            )
                .onAppear(){
                    self.rotating.toggle()
            }

        } //VStack
        
    } // body
} // view

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
