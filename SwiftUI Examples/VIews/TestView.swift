//
// TestsView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 11/20/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var appSettings: AppSettings
    @EnvironmentObject var networkManager: NetworkManager

    var body: some View {
        VStack {
            TextField("Username", text: $appSettings.username)
            TextField("Password", text: $appSettings.password)
            Button("Update"){
                self.networkManager.mockService()
            }
            Divider()
            SecondView()
        }

    }
}

struct SecondView: View {
    @EnvironmentObject var appSettings: AppSettings

    var body: some View {
        VStack{
            Text("\(appSettings.username)")
            Text("\(appSettings.password)")
        }
    }
}

class AppSettings: ObservableObject {
    @Published var username: String = "luke@skywalker.com"
    @Published var password: String = "r2d2c3po"
}

class NetworkManager: ObservableObject {
//    @Binding var appSettings: AppSettings

    @Published var token: String = ""

    func mockService () {
//        token = appSettings.username + appSettings.password
    }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
        .environmentObject(AppSettings())
    }
}
