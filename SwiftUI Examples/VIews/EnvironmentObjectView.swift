//
//  EnvironmentObjectView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 12/4/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct EnvironmentObjectView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            Text("Order")
                .font(.title)
                .padding()

            Text("\(order.name)")
                .font(.headline)
            
            Text("\(order.item)")
                .font(.headline)
            
            Text(order.nameItem())
                .font(.subheadline)

        }
    }
}

struct EnvironmentObjectView_Previews: PreviewProvider {
    static let order = Order()

    static var previews: some View {
        EnvironmentObjectView().environmentObject(order)
    }
}

class Order: ObservableObject {
    @Published var name = "this is a name"
    @Published var item = "this is an item"
    
    func nameItem () -> String {
        return "\(self.name) and \(self.item)"
    }
    
}

