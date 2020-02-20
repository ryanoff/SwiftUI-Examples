//
//  SliderView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 2/20/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    
    @State private var number: Double = 1.50
    
    var body: some View {
        VStack {
            
            Text("\(number, specifier: "%.2f")")
                .font(.largeTitle)
            
            Slider(value: $number, in: 0...10, step: 0.5)
            
            Stepper(value: $number, in: 1...10, step: 0.5) {
                Text("\(number, specifier: "%.2f")")
            }
            .labelsHidden()
            .scaleEffect(1.5)
            .padding()
            
        }
        .padding()
        
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
