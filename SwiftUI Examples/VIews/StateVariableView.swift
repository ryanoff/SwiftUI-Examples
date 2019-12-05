//
//  StateVariableView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 12/4/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct StateVariableView: View {
    @State private var showGreeting = true
    @State private var counter = 0

    var body: some View {
        VStack {
            VStack {
                Text("State Variable").font(.title)
            }
            
            Toggle(isOn: $showGreeting) {
                Text("Show Greeting")
                    .font(.headline)
                    .padding()
            }
            
            if showGreeting {
                
                Text("Hello Bob!")
                    .font(.headline)
                    .padding()
                
            }

            Divider()
            
            Stepper("Change counter", value: $counter, in: 0...100)
            
            Text("Counter is \(self.counter)")
                .font(.title)
                .padding()

            Spacer()
            
        } // VStack
    }
}

struct StateVariableView_Previews: PreviewProvider {
    static var previews: some View {
        StateVariableView()
    }
}
