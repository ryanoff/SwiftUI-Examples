//
//  DateView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 1/28/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

extension Date {
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
}

struct DateView: View {
    
    @State var dateString: String = "01012016"
//    @State var age = 0
    
    func getDate(_ dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMddyyyy"
        return formatter.date(from: dateString) ?? Date() //TODO: replace today with some error message
    }
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        VStack{
            Text("Original Date: \(dateString)")
            Divider()
            Text("formatDate: \(getDate(dateString))")
            Divider()
            Text("dateFormatter: \(getDate(dateString), formatter: Self.dateFormat)")
            Divider()
            Text("Age: \(getDate(dateString).age)")
            Divider()
            Text("Date: \(Date())")
            Text("Age: \(Date().age)")

        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
