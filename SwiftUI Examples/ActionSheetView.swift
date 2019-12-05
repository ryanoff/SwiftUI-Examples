//
//  ActionSheetView.swift
// SwiftUI Examples
//
//  Created by Ryan Off on 10/8/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct ActionSheetView: View {
    
    @State var showActionSheet = false

    var actionSheet: ActionSheet {
           ActionSheet(title: Text("Action Sheet"), message: Text("Choose Option"), buttons: [
               .default(Text("Save")),
               .default(Text("Delete")),
               .destructive(Text("Cancel"))
           ])
       }
    
    var body: some View {
        VStack {
                                                         
           Button(action: { self.showActionSheet.toggle() }) {
               Text("Action Sheet")
           }
           .actionSheet(isPresented: $showActionSheet, content: {
               self.actionSheet })

       }  // VStack
        
    } // body View
} // ActionSheet

struct ActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetView()
    }
}
