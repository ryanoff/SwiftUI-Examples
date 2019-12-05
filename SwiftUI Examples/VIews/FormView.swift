//
//  FormView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 12/4/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct FormView: View {
    @State private var firstname: String = ""
    @State private var lastname: String = ""

    var body: some View {
        VStack {
            Text("Hello, \(self.firstname) \(self.lastname)!")
                .font(.title)


            Form {
                Section(header: Text("Your information")) {
                    TextField("First Name", text: $firstname)
                    TextField("Last Name", text: $lastname)
                }
            } // Form

            Spacer()
            
        } // VStack
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
