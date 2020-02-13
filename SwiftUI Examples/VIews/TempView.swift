//
//  TempView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 2/12/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct TempView: View {
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "checkmark")
                    .font(Font.system(size: 30.0))
                    .foregroundColor(Color.green)
                    .onAppear(
                
                )
                
                Text("Approval Successful")
                    .font(.headline)
            }
            .padding(.top, 60)
            .padding()
            
            Spacer()
            
            
        } // VStack
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
