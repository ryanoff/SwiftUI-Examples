//
//  ToggleView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 12/4/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct ToggleView: View {
    @State private var showGreeting = true

    var body: some View {
        VStack {
            VStack {
                Text("Toggle").font(.title)
            }
            
            Toggle(isOn: $showGreeting) {
                Text("Show Greeting")
                    .font(.headline)
                    .padding()
            }
            
            if showGreeting {
                Text("Hello Bob!")
            }
            
            Spacer()
            
        } // VStack
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
