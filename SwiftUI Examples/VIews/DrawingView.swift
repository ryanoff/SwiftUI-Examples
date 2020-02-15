//
//  Drawing.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 10/11/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct DrawingView: View {
        
    var body: some View {
        
        VStack {
            
            CrossView()
                .frame(width: 200, height: 150)
            
            CheckmarkView()
                .frame(width: 200, height: 200)
            
            BoxView()
                .frame(width: 100, height: 100)

            Box()
                .stroke(Color.green, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                .frame(width: 50, height: 50)
            
            Spacer()

            
        } // VStack
    }
}

struct CrossView: View {
    var body: some View {
        /// Draw a cross between the icons
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let spacing: CGFloat = 20.0
                let center = height / 2
                path.move(to: CGPoint(x: spacing, y: center ))
                path.addLine(to: CGPoint(x: width-spacing, y: center ))
            } // Path
                .stroke(Color.red, lineWidth: 2)
            
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let spacing: CGFloat = 60.0
                let middle = width / 2
                path.move(to: CGPoint(x: middle, y: 0 + spacing ))
                path.addLine(to: CGPoint(x: middle, y: height - spacing ))
            } // Path
                .stroke(Color.orange, lineWidth: 2)
            
        } // Geometry reader
        
    }
}

struct CheckmarkView: View {
    
    @State var drawCheckMark = false
    
    var body: some View {
        
        /// Draw a checkmark
        GeometryReader { geometry in
            Path { path in
                //                let width = geometry.size.width
                let height = geometry.size.height
                let spacing: CGFloat = 10.0
                let center = height / 2
                let leading: CGFloat = 0.0 + spacing
                let trailing = geometry.size.width - spacing
                let top: CGFloat = 0.0 + spacing
                let bottom = geometry.size.height - spacing
                path.move(to: CGPoint(x: leading + 36 , y: center + 30 ))
                path.addLine(to: CGPoint(x: center, y: bottom))
                path.addLine(to: CGPoint(x: trailing, y: top + 34 ))
            } // Path
                //                .stroke(Color.green, lineWidth: 6)
                .trim(from: 0, to: self.drawCheckMark ? 1 : 0)
                .stroke(Color.green, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .animation(
                    Animation
                        .easeInOut(duration: 0.6)
                        .delay(0.5)
                    //                        .repeatForever()
            )
            
        }  // Geometry reader
            .onAppear() {
                self.drawCheckMark.toggle()
                print("check appeared")
                
        } // onAppear
            .onDisappear() {
                print("check disappeared")
        }
        
    }
}

struct BoxView: View {
    
    @State var drawCheckMark = false
    
    var unit_length: CGFloat = 5.0
    var unit_width: CGFloat = 10.0
    
    var body: some View {
        
        /// Draw a checkmark
        GeometryReader { geometry in
            Path { path in
                //                let width = geometry.size.width
//                let height = geometry.size.height
                let padding: CGFloat = 10.0
//                let center = height / 2
                let leading: CGFloat = 0.0 + padding
                let trailing = geometry.size.width - padding
                let top: CGFloat = 0.0 + padding
                let bottom = geometry.size.height - padding
                path.move(to: CGPoint(x: leading, y: top))
                path.addLine(to: CGPoint(x: leading, y: bottom))
                path.addLine(to: CGPoint(x: trailing, y: bottom ))
                path.addLine(to: CGPoint(x: trailing, y: top ))
                path.addLine(to: CGPoint(x: leading, y: top ))

            } // Path
                //                .stroke(Color.green, lineWidth: 6)
                .trim(from: 0, to: self.drawCheckMark ? 1 : 0)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .animation(
                    Animation
                        .easeInOut(duration: 0.6)
                        .delay(0.5)
                    //                        .repeatForever()
            )
            
        }  // Geometry reader
            .onAppear() {
                self.drawCheckMark.toggle()
                print("check appeared")
                
        } // onAppear
            .onDisappear() {
                print("check disappeared")
        }
        
    }
}

struct Box: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))

        return path
    }
}

struct Drawing_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
