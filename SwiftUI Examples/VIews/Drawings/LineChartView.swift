//
//  LineChartView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 6/4/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct LineChartView: View {
    
    
    @State private var width: CGFloat = 250.0
    @State private var height: CGFloat = 150.0
    
    var points: [CGPoint] = [
        CGPoint(x: 1, y: 4),
        CGPoint(x: 2, y: 5),
        CGPoint(x: 5, y: 7),
        CGPoint(x: 8, y: 16),
        CGPoint(x: 12, y: 8),
        CGPoint(x: 60, y: 3),
        CGPoint(x: 16, y: 6),
        CGPoint(x: 26, y: 11),
        CGPoint(x: 30, y: 0),
        CGPoint(x: 32, y: 7),
        CGPoint(x: 35, y: 13),
        CGPoint(x: 40, y: 23),
        CGPoint(x: 64, y: 15),
    ]
    
//    @State var bigPoints: [CGPoint] = [
//        CGPoint(x: 1, y: 120)
//    ]
    
    
    var body: some View {
        VStack {
            
            Text("Sparkline Line Chart")
            
            Spacer()
            
            Sparkline(points: points, box: false)
                .stroke(Color.green, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .frame(width: self.width, height: self.height/4)
                .padding(.vertical)
                       
//            ZStack {
//                Sparkline(points: points, box: true)
//                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//                    .frame(width: self.width, height: self.height)
//                    .opacity(0.2)
//
//                Sparkline(points: points, box: false)
//                    .stroke(Color.green, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
//                    .frame(width: self.width, height: self.height)
//
//            }
            
//            Sparkline(points: bigPoints, box: false)
//                .stroke(Color.green, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
//                .frame(width: self.width, height: self.height)
//                .onAppear(){
//                    for _ in 0...20 {
//                        self.bigPoints += [CGPoint( x: Int.random(in: 1...100), y: Int.random(in: 1...100) )]
//                    }
//            }
            
            
            
            Spacer()
            
            Group {
                HStack {
                    Text("Width").font(.footnote).foregroundColor(Color.gray).frame(maxWidth: 50)
                    Text("\(Int(width))").font(.headline)
                    Slider(value: $width, in: 1...300, step: 1)
                        .padding([.horizontal, .bottom])
                }
                
                HStack {
                    Text("Height").font(.footnote).foregroundColor(Color.gray).frame(maxWidth: 50)
                    Text("\(Int(height))").font(.headline)
                    Slider(value: $height, in: 1...350, step: 1)
                        .padding([.horizontal, .bottom])
                }
                
            }
            
            Spacer()
            
//            List {
//                ForEach(points, id: \.x) { point in
//                    HStack {
//                        Text("\(point.x)")
//                        Text("\(point.y)")
//                    } //HStack
//                } //ForEach
//            } //List
            
        } //VStack
    }
}

// MARK: - Sparkline
/// Sparkline Shape must be passed a set of points where the x coordinate is always unique.
struct Sparkline: Shape {
    
    // Set up initial values
    var points: [CGPoint]

    var box: Bool = false
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Sort points so that x values are in order from lowest to highest
        let sPoints = points.sorted { $0.x < $1.x }
        
        // Get the highest X and Y values
        let maxYCoord = sPoints.map {$0.y}.max() ?? 1
        let maxXCoord = sPoints.map {$0.x}.max() ?? 1
        
        // Create a scale factor to resize the chart based on maximum values
        let xScale: CGFloat = rect.maxX / CGFloat(maxXCoord)
        let yScale: CGFloat = rect.maxY / CGFloat(maxYCoord)
        
        // Draw the first point
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY - (CGFloat(sPoints[0].y) * yScale)) )
        
        // Draw the remaining points and paths after dropping the first already used point
        for item in sPoints.dropFirst() {
            path.addLine(to: CGPoint(x: rect.minX + (item.x * xScale), y: rect.maxY - (item.y * yScale) ))
        }
        
        // Optionally draws a bounding box of the maximum coordinates
        if box {
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint( x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint( x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }
        
        return path
    }
}


struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView()
    }
}
