//
// TestsView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 11/20/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        HStack {
            Color.orange
            Text("Hello, World!")
            Color.red
                .opacity(0.8)
            SecondView()
        }

    }
}

struct SecondView: View {
    var body: some View {
            Text("42")
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
