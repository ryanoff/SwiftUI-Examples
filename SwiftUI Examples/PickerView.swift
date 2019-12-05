//
//  PickerView.swift
// SwiftUI Examples
//
//  Created by Ryan Off on 10/8/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct TabItem: View {
    let image: String
    let tag: Int

    var body: some View {
        Image(systemName: image).tag(tag)
    }
}


struct PickerView: View {
    @State private var selectorIndex = 0
    @State private var numbers = ["One","Two","Three"]

    @State private var optionIndex = 0

    
    var body: some View {
    
        VStack {
            Text("Simple Segmented Picker")

            Picker("Numbers", selection: $selectorIndex) {
                ForEach(0 ..< numbers.count) { index in
                    Text(self.numbers[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            Text("Selected value is: \(numbers[selectorIndex])").padding()

            Text("New").font(.largeTitle).foregroundColor(Color.red)
            
            Picker("Test Option", selection: $optionIndex ) {
                Image(systemName: "square.split.2x1.fill").tag(0)
                Image(systemName: "list.dash").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(minWidth: 0, maxWidth: 50)


            if optionIndex == 0 {
                OptionView1()
            } else if optionIndex == 1 {
                OptionView2()
            }
            
        } //VStack
        .padding()
    }
}

struct OptionView1: View {
    var body: some View {
        Text("First View")
    }
}

struct OptionView2: View {
    var body: some View {
        Text("Second View")
    }
}


struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
