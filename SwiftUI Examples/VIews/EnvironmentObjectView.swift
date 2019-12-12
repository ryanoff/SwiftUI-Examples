//
//  EnvironmentObjectView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 12/4/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI
import Combine

struct EnvironmentObjectView: View {

    @EnvironmentObject var settings: Settings
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Form {
                TextField("Username", text: $settings.username)
                TextField("Password", text: $settings.password)
                HStack {
                    Text("Height in cm")
                    Slider(value: $settings.height, in: 0...300, step: 1)
                }
                Button("Update Height in Feet"){
                    self.user.heightInFeet(settings: self.settings)
                }

            }
            
            SummaryView()
            Divider()
            DetailView()

            Spacer()

        }
    }
}

struct EnvironmentObjectView_Previews: PreviewProvider {

    static var previews: some View {
        EnvironmentObjectView()
            .environmentObject(Settings())
    }
}

struct SummaryView: View {

    @EnvironmentObject var settings: Settings
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Text("Summary").font(.headline)
            Text("Username: \(settings.username)")
            Text("Height (ft): \(user.heightFeet)")
        }
    }
}

struct DetailView: View {

    @EnvironmentObject var settings: Settings
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Text("Detail").font(.headline)
            Text("Username: \(settings.username)")
            Text("Password: \(settings.password)")
            Text("Height (cm): \(settings.height)")
            Text("Height (ft): \(user.heightFeet)")
        }
    }
}


class Settings: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var height: Double = 100

//    func usernameAndHeight () -> String {
//        return "\(self.username) is \(self.height) cm tall"
//    }
}

class UserManager: ObservableObject {

    @Published var heightFeet: Double = 0
    
    func heightInFeet(settings:Settings) {
        heightFeet = settings.height * 0.393701
    }
}



