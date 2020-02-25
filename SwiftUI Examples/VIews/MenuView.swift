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
            
            MenuListView()
            
        } // NavgiationView
        .navigationViewStyle(StackNavigationViewStyle())

    } // body
} // ContentView

struct MenuListView: View {
    var body: some View {
        
        List {
            // Modals, Action Sheets
            Section(header: Text("Modals and Action Sheets")) {
                NavigationLink(destination: ModalView()){ Text("Modal").padding() }
                NavigationLink(destination: ActionSheetView()){ Text("Action Sheet").padding() }
                NavigationLink(destination: PopoverView()){ Text("Popover").padding() }
            }
            
            Section(header: Text("Drawings and Animation")) {
                
                NavigationLink(destination: DrawingView()){ Text("Drawing").padding() }
                NavigationLink(destination: AnimationView()){ Text("Animation").padding() }
                NavigationLink(destination: LoadingView()){ Text("Loading").padding() }
                NavigationLink(destination: SpirographView()){ Text("Spirograph").padding() }
                NavigationLink(destination: CirclesView()){ Text("Circles").padding() }
                NavigationLink(destination: CubesView()){ Text("Cubes").padding() }
                NavigationLink(destination: DrawUnitsView()){ Text("Units").padding() }

            }
            
            Section(header: Text("Basics")) {
                NavigationLink(destination: ButtonsView()){ Text("Buttons").padding() }
                NavigationLink(destination: StringView()){ Text("Strings").padding() }
                NavigationLink(destination: BackgroundColorView()){ Text("Background Color").padding() }
                NavigationLink(destination: FormView()){ Text("Forms").padding() }
                NavigationLink(destination: NotificationsView()){ Text("Notifications").padding() }
                NavigationLink(destination: SubViewsView()){ Text("SubViews and Navigation").padding() }
            }
            
            Section(header: Text("Combine")) {
                
                NavigationLink(destination: EnvironmentObjectView()){ Text("Environment Object").padding() }
                NavigationLink(destination: BindingView()){ Text("Binding Object").padding() }
                NavigationLink(destination: StateVariableView()){ Text("State Variable").padding() }
                
            }
            
            Section(header: Text("Pickers, Toggles, Sliders, Steppers")) {
                
                NavigationLink(destination: PickerView()){ Text("Picker").padding() }
                NavigationLink(destination: ToggleView()){ Text("Toggle").padding() }
                NavigationLink(destination: SliderView()){ Text("Sliders and Steppers").padding() }
                
            }

            Section(header: Text("Networking")) {
                
                NavigationLink(destination: CodableView()){ Text("Codable URLSession").padding() }
                NavigationLink(destination: StarWarsApiView()){ Text("Star Wars API").padding() }
                NavigationLink(destination: SearchResponseView()){ Text("Search and Sort Network Response").padding() }

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
