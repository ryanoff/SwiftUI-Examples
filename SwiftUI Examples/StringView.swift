//
//  StringView.swift
// SwiftUI Examples
//
//  Created by Ryan Off on 11/7/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI


struct StringView: View {
    @State var stringExtension : String = ""
    @State var textString : String = "Practically perfect in every way"

    var body: some View {
        //                    Text("Super")
        //                    Text("Supercallifragilisticexpialidocious")
        //                    Text("Practically perfect in every way")
        VStack {
            
        GeometryReader { _ in

            Text("\(self.textString)")
                .fontWeight(.semibold)
                .font(.system(size: 600))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
                .multilineTextAlignment(.center)
                .border(Color.red)
//                .onAppear() {
//                    self.doNothing()
//                } // onAppear
            }
            
            Button("Push me"){
                self.updateString()
            }.padding()
//
//            Text("\(emptyString)")
//            \u{00a0}

        }
    }
    
    func updateString() {
        if textString == "Practically perfect in every way" {
            textString = "Practically imperfect in every way"
        } else {
            textString = "Practically perfect in every way"
        }
    }
    
    func addString() {
        stringExtension = stringExtension + " "
    }

} // View


struct StringView_Previews: PreviewProvider {
    static var previews: some View {
        StringView()
    }
}
