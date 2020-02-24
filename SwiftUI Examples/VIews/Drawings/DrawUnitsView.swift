//
//  DrawUnitsView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 2/15/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct DrawUnitsView: View {
    
    @State private var width: CGFloat = 10.0
    @State private var length: CGFloat = 5.0
    @State private var height: CGFloat = 10.0
    @State private var scale: CGFloat = 5.0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                Unit(width: self.width, length: self.length, height: self.height, scale: self.scale)
                    .rotation(Angle(degrees: -3))
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 0.7, lineCap: .round, lineJoin: .round))
                    .frame(width: 50, height: 50)

                Spacer()
                                
                Unit(width: self.width, length: self.length, height: self.height, scale: self.scale)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    .frame(width: 50, height: 50)
                
                Spacer()
                
            }
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                Unit(width: 5, length: 10, height: 8, scale: 4)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                    .frame(width: 50, height: 50)

                Spacer()
                
                Unit(width: 10, length: 5, height: 8, scale: 4)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                    .frame(width: 50, height: 50)

                Spacer()
                
                Unit(width: 10, length: 10, height: 8, scale: 4)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                    .frame(width: 50, height: 50)
                
                Spacer()
                
                Unit(width: 10, length: 20, height: 8, scale: 4)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                    .frame(width: 50, height: 50)
                
                Spacer()
                
            }
                        
            Spacer()
            
            HStack {
                Text("Width").font(.footnote).foregroundColor(Color.gray).frame(maxWidth: 50)
                Text("\(Int(width))").font(.headline)
                Slider(value: $width, in: 1...50, step: 1)
                    .padding([.horizontal, .bottom])
            }
            
            HStack {
                Text("Length").font(.footnote).foregroundColor(Color.gray).frame(maxWidth: 50)
                Text("\(Int(length))").font(.headline)
                Slider(value: $length, in: 0...50, step: 1)
                    .padding([.horizontal, .bottom])
            }
            
            HStack {
                Text("Height").font(.footnote).foregroundColor(Color.gray).frame(maxWidth: 50)
                Text("\(Int(height))").font(.headline)
                Slider(value: $height, in: 1...50, step: 1)
                    .padding([.horizontal, .bottom])
            }
            
            HStack {
                Text("Scale").font(.footnote).foregroundColor(Color.gray).frame(maxWidth: 50)
                Text("\(Int(scale))").font(.headline)
                Slider(value: $scale, in: 0...10, step: 0.5)
                    .padding([.horizontal, .bottom])
            }
            
        }
        
    }
}


struct Unit: Shape {
    
    var width: CGFloat = 10.0
    var length: CGFloat = 10.0
    var height: CGFloat = 10.0
    var scale: CGFloat = 1.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let depth = (length / 2.3)

        // Front face
        let topleft = CGPoint(x: rect.minX, y: rect.minY)
        let bottomleft = CGPoint(x: rect.minX, y: height * scale)
        let bottomright = CGPoint( x: width * scale, y: height * scale )
        let topright = CGPoint( x: width * scale, y: rect.minY)
        
        // Back face
        let back_topleft = CGPoint(x: rect.minX - (depth * scale), y: rect.minY - (depth * scale))
        let back_bottomleft = CGPoint(x: rect.minX - (depth * scale), y: (height * scale) - (depth * scale))
//        let back_bottomright = CGPoint( x: (width * scale) - (depth * scale), y: (height * scale) - (depth * scale))
        let back_topright = CGPoint( x: (width * scale) - (depth * scale), y: rect.minY - (depth * scale))

        // Front face
        path.move( to: topleft )
        path.addLine( to: bottomleft )
        path.addLine( to: bottomright )
        path.addLine( to: topright )
        path.addLine( to: topleft )

        
        // Back lines
        path.move( to: back_topleft )
        path.addLine( to: back_bottomleft )

        path.move( to: back_topleft )
        path.addLine( to: back_topright )

//        path.addLine( to: back_bottomright )
//        path.addLine( to: back_topright )
//        path.addLine( to: back_topleft )
        
        
        // Connect the front and back
        path.move( to: back_topleft )
        path.addLine( to: topleft )

        path.move( to: back_topright )
        path.addLine( to: topright )

        path.move( to: back_bottomleft )
        path.addLine( to: bottomleft )
        
//        path.move( to: back_bottomright )
//        path.addLine( to: front_bottomright )
        
        // Small door
        path.move( to: CGPoint(x: rect.minX + (width * 0.2 * scale), y: height * scale) )
        path.addLine ( to: CGPoint(x: rect.minX + (width * 0.2 * scale), y: (height * 0.2) * scale) )
        path.addLine ( to: CGPoint(x: rect.minX + (width * 0.8 * scale), y: (height * 0.2) * scale) )
        path.addLine ( to: CGPoint(x: rect.minX + (width * 0.8 * scale), y: height * scale) )
        
        // Door stripes
        path.move( to: CGPoint(x: rect.minX + (width * 0.3 * scale), y: (height * 0.4) * scale) )
        path.addLine( to: CGPoint(x: rect.minX + (width * 0.7 * scale), y: (height * 0.4) * scale) )

        path.move( to: CGPoint(x: rect.minX + (width * 0.3 * scale), y: (height * 0.6) * scale) )
        path.addLine( to: CGPoint(x: rect.minX + (width * 0.7 * scale), y: (height * 0.6) * scale) )

        path.move( to: CGPoint(x: rect.minX + (width * 0.3 * scale), y: (height * 0.8) * scale) )
        path.addLine( to: CGPoint(x: rect.minX + (width * 0.7 * scale), y: (height * 0.8) * scale) )

        

        return path
    }
}


struct DrawUnitsView_Previews: PreviewProvider {
    static var previews: some View {
        DrawUnitsView()
    }
}
