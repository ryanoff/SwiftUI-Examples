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
            
        }
    }
}



struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
