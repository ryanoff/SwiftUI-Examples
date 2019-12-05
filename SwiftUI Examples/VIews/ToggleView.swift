//
//  ToggleView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 12/4/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct ToggleView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Toggle").font(.title)
                Text("not implemented yet")
            }
            
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                Text("Toggle Me")
                    .font(.headline)
            }
            
        }
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
