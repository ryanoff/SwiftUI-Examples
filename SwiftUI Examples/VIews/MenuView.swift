//
//  ContentView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 9/26/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        
        
        NavigationView {

        ZStack {

                // Set the background color
                Color.orange.edgesIgnoringSafeArea(.all)

                MenuListView()

            } // ZStack
            .navigationBarItems(trailing:
                HStack {
                    Button("Test") {
                        print("This is a Test button")
                    }

                    Button(action: {}) { Image(systemName: "magnifyingglass").foregroundColor(Color.gray).padding() }

                    NavigationLink(destination: ActionSheetView()){ Image(systemName: "paperplane").padding() }

                }
            )

        } // NavgiationView
    } // body
} // ContentView

struct MenuListView: View {
    var body: some View {
        
        List{
            // Modals, Action Sheets
            Section(header: Text("Modals and Action Sheets")) {
                NavigationLink(destination: ModalView()){ Text("Modal").padding() }
                NavigationLink(destination: ActionSheetView()){ Text("Action Sheet").padding() }
                NavigationLink(destination: PopoverView()){ Text("Popover").padding() }
            }
            
            Section(header: Text("Drawings and Animation")) {
                
                NavigationLink(destination: DrawingView()){ Text("Drawing").padding() }
                NavigationLink(destination: AnimationView()){ Text("Animation").padding() }

            }
            
            Section(header: Text("Basics")) {
                
                NavigationLink(destination: StringView()){ Text("Strings").padding() }
                NavigationLink(destination: BackgroundColorView()){ Text("Background Color").padding() }
                NavigationLink(destination: FormView()){ Text("Forms").padding() }
                NavigationLink(destination: NotificationsView()){ Text("Notifications").padding() }

            }
            
            Section(header: Text("Combine")) {
                
                NavigationLink(destination: EnvironmentObjectView()){ Text("Environment Object").padding() }
                NavigationLink(destination: BindingView()){ Text("Binding Object").padding() }
                NavigationLink(destination: StateVariableView()){ Text("State Variable").padding() }
                
            }
            
            Section(header: Text("Pickers, Toggles")) {
                
                NavigationLink(destination: PickerView()){ Text("Picker").padding() }
                NavigationLink(destination: ToggleView()){ Text("Toggle").padding() }
                
                // TODO: forms
                // TODO: stepper
                
            }

        } // List
        .navigationBarTitle(Text("Menu"))

    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
