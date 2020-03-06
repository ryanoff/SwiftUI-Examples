//
//  BreatheView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 3/4/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct BreatheView: View {
    @State private var numberCircles = 6.0
    @State private var circleRadius = 50.0
    @State private var innerRadius = 0.0
    
    @State private var rotating = false
    @State private var expanding = false
    @State private var radiating = false
    
    var body: some View {
        
        ZStack {
            ForEach([Int](1...Int(numberCircles)), id: \.self) { item in
                
                Circle()
                    .fill(Color.blue)
                    .opacity(0.3)
                    .scaleEffect(self.expanding ? 4.2 : 1.0) //scale size
                    .frame(width: CGFloat(self.circleRadius), height: CGFloat(self.circleRadius))
                    .offset(x: self.xPosition(item), y: self.yPosition(item))
                    .animation(Animation
                        .easeIn(duration: 5.0)
                        .repeatForever(autoreverses: true)
                )
                
            } // ForEach
            
            ForEach([Int](1...Int(numberCircles)), id: \.self) { item in
                
                Circle()
                    .fill(Color.green)
                    .opacity(0.3)
                    .scaleEffect(self.expanding ? 4.0 : 0.8) //scale size
                    .frame(width: CGFloat(self.circleRadius), height: CGFloat(self.circleRadius))
                    .offset(x: self.xPosition(item), y: self.yPosition(item))
                    .animation(Animation
                        .easeIn(duration: 6.0)
                        .repeatForever(autoreverses: true)
                )
                
            } // ForEach
            
            
            ForEach([Int](1...Int(numberCircles)), id: \.self) { item in
                
                Circle()
                    .fill(Color.white)
                    .opacity(0.3)
                    .scaleEffect(self.expanding ? 3.0 : 0.5) //scale size
                    .frame(width: CGFloat(self.circleRadius), height: CGFloat(self.circleRadius))
                    .offset(x: self.xPosition(item), y: self.yPosition(item))
                    .animation(Animation
                        .easeIn(duration: 7.0)
                        .repeatForever(autoreverses: true)
                )
                
            } // ForEach
            
            
        } // ZStack
            .rotationEffect(.degrees(rotating ? 360 : 0))
            .animation(
                Animation.linear(duration: 30.0) // rotation duration
                    .repeatForever(autoreverses: false)
        )
            .onAppear(){
                self.rotating.toggle()
                self.expanding.toggle()
                withAnimation {
                    self.innerRadius += 80
                }
        }
        
        
    } // Body
    
    
    func xPosition(_ item: Int ) -> CGFloat {
        let xPosition = cos(Double(item)) * innerRadius
        return CGFloat(xPosition)
    }
    
    func yPosition(_ item: Int ) -> CGFloat {
        let yPosition = sin(Double(item)) * innerRadius
        return CGFloat(yPosition)
    }
    
} // View

struct BreatheView_Previews: PreviewProvider {
    static var previews: some View {
        BreatheView()
    }
}
