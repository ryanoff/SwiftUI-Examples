//
//  BackgroundColorView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 12/4/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct BackgroundColorView: View {
    var body: some View {
        ZStack {
            
            Color.orange
            
            VStack {
                Text("Hello world")
                    .font(.title)
                    .foregroundColor(Color.white)
            }
            
        } //ZStack
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundColorView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundColorView()
    }
}
