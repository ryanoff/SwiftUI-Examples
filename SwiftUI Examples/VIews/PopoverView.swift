//
//  PopoverView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 12/18/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct PopoverView: View {
    
    @State private var showPopover: Bool = false
    
    var body: some View {
        
        VStack{
            
            Button(action: { self.showPopover = true }) {
                Text("Show Popover")
            }.popover(
                isPresented: self.$showPopover,
                arrowEdge: .bottom
            ) {
                //            Text("Hello world")
                PopoverDetailView()
            }
            
        }
        
    }
}

struct PopoverDetailView: View {
    
    @State private var lastname: String = ""
    @State private var firstname: String = ""
    
    var body: some View {
        VStack {
            Text("Form Title")
            Form {
                Section(header: Text("Your information")) {
                    TextField("First Name", text: $firstname)
                    TextField("Last Name", text: $lastname)
                }
            } // Form
            
        }
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
    }
}
