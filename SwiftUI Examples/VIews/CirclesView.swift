//
//  CirclesView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 1/2/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct CirclesView: View {
    
    @State private var numberCircles = 12.0
    @State private var circleRadius = 200.0
    @State private var innerRadius = 40.0
    @State private var hue = 0.04
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            ZStack {
                ForEach([Int](1...Int(numberCircles)), id: \.self) { item in
                    
                    Circle()
                        .stroke(Color(hue: self.hue, saturation: 1, brightness: 1), lineWidth: 1)
                        .frame(width: CGFloat(self.circleRadius), height: CGFloat(self.circleRadius))
                        .offset(x: self.xPosition(item), y: self.yPosition(item))
                    
                    
                } // ForEach
            } // ZStack
            
            Spacer()
            
            VStack (spacing: 0) {
                
                VStack {
                    HStack{
                        Text("Circles").font(.footnote).foregroundColor(Color.gray)
                        Text("\(Int(numberCircles))").font(.headline)
                    }
                    Slider(value: $numberCircles, in: 1...200, step: 1)
                        .padding([.horizontal, .bottom])
                }
                
                HStack {
                    Text("Circle Radius").font(.footnote).foregroundColor(Color.gray).frame(maxWidth: 50)
                    Text("\(Int(circleRadius))").font(.headline)

                    Slider(value: $circleRadius, in: 1...200, step: 1)
                        .padding([.horizontal, .bottom])
                }
                
                HStack {
                    Text("Inner Radius").font(.footnote).foregroundColor(Color.gray).frame(maxWidth: 50)
                    Text("\(Int(innerRadius))").font(.headline)
                    Slider(value: $innerRadius, in: 1...200, step: 1)
                        .padding([.horizontal, .bottom])
                }
                
                HStack {
                    Text("Color").font(.footnote).foregroundColor(Color.gray).frame(maxWidth: 50)
                    Text("\(hue, specifier: "%.2f")").font(.headline)
                    Slider(value: $hue)
                        .padding(.horizontal)
                    
                }
                
                
            }
            .padding()
            
            
        } // VStack
        
    }
    
    func xPosition(_ item: Int ) -> CGFloat {
        let xPosition = cos(Double(item)) * innerRadius
        return CGFloat(xPosition)
    }
    
    func yPosition(_ item: Int ) -> CGFloat {
        let yPosition = sin(Double(item)) * innerRadius
        return CGFloat(yPosition)
    }
}

struct CirclesView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesView()
    }
}
