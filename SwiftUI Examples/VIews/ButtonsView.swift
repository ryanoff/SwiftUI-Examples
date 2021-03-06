//
//  ButtonsView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 1/2/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct ButtonsView: View {
    
    @State var showCheckMark: Bool = false
    
    var body: some View {
        VStack {
            
            Button( action: {
                self.showCheckMark.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.showCheckMark.toggle()
                }
                
            }
            ) {
                Text("Tap me")
            }
            .padding(.bottom, 10)
            
            if showCheckMark {
                CheckmarkView()
                    .frame(width: 200, height: 200)
            }
            
            Spacer()
            
        } // VStack
            .navigationBarItems(trailing:
                HStack {
                    Button("Test") {
                        print("This is a Test button")
                    }
                    
                    Button(action: {}) { Image(systemName: "magnifyingglass").foregroundColor(Color.gray).padding() }
                    
                    NavigationLink(destination: ActionSheetView()){ Image(systemName: "paperplane").padding() }
                    
                }
        )
    }
}



struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
