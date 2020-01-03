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
}

struct Drawing_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
