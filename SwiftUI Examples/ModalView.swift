//
//  ModalView.swift
// SwiftUI Examples
//
//  Created by Ryan Off on 10/8/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct ModalView: View {

    @State var modalDisplayed = false
    
    var body: some View {
        VStack{
                     
          Button(action: { self.modalDisplayed = true }) {
              Text("Modal")
          }.sheet(isPresented: $modalDisplayed) {
              Modal1View(onDismiss: {
                  self.modalDisplayed = false
              })
          }
            
        }
    }
}

struct Modal1View: View {
    var onDismiss: () -> ()
    
    var body: some View {
        Button(action: { self.onDismiss() }) {
            Text("Dismiss")
        }
    }
}


struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}

