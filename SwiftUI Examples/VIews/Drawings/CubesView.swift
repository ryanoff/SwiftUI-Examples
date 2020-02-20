//
//  CubesView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 2/14/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct CubesView: View {
    
    @State private var width: CGFloat = 10.0
    @State private var depth: CGFloat = 5.0
    @State private var height: CGFloat = 10.0
    @State private var scale: CGFloat = 5.0

    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                Cube(width: self.width, depth: self.depth, height: self.height, scale: self.scale)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                    .frame(width: 100, height: 100)
                
                Spacer()
                
                Cube(width: self.width, depth: self.depth, height: self.height, scale: self.scale)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .frame(width: 100, height: 100)
                
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
                Text("Depth").font(.footnote).foregroundColor(Color.gray).frame(maxWidth: 50)
                Text("\(Int(depth))").font(.headline)
                Slider(value: $depth, in: 0...50, step: 1)
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


struct Cube: Shape {

    var width: CGFloat = 10.0
    var depth: CGFloat = 10.0
    var height: CGFloat = 10.0
    var scale: CGFloat = 5.0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Back face
        let back_topleft = CGPoint(x: rect.minX, y: rect.minY)
        let back_bottomleft = CGPoint(x: rect.minX, y: height * scale)
        let back_bottomright = CGPoint( x: width * scale, y: height * scale )
        let back_topright = CGPoint( x: width * scale, y: rect.minY)
        
        // Front face
        let front_topleft = CGPoint(x: rect.minX + (depth * scale), y: rect.minY + (depth * scale))
        let front_bottomleft = CGPoint(x: rect.minX + (depth * scale), y: (height * scale) + (depth * scale))
        let front_bottomright = CGPoint( x: (width * scale) + (depth * scale), y: (height * scale) + (depth * scale))
        let front_topright = CGPoint( x: (width * scale) + (depth * scale), y: rect.minY + (depth * scale))

        // Back face
        path.move( to: back_topleft )
        path.addLine( to: back_bottomleft )
        path.addLine( to: back_bottomright )
        path.addLine( to: back_topright )
        path.addLine( to: back_topleft )

        // Front face
        path.move( to: front_topleft )
        path.addLine( to: front_bottomleft )
        path.addLine( to: front_bottomright )
        path.addLine( to: front_topright )
        path.addLine( to: front_topleft )

        // Connect the front and back
        path.move( to: back_topleft )
        path.addLine( to: front_topleft )

        path.move( to: back_topright )
        path.addLine( to: front_topright )

        path.move( to: back_bottomleft )
        path.addLine( to: front_bottomleft )
        
        path.move( to: back_bottomright )
        path.addLine( to: front_bottomright )
        
        return path
    }
}


struct CubesView_Previews: PreviewProvider {
    static var previews: some View {
        CubesView()
    }
}
