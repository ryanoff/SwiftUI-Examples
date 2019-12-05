//
//  ContentView.swift
// SwiftUI Examples
//
//  Created by Ryan Off on 9/26/19.
//  Copyright © 2019 Ryan Off. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
//    init(){
//        UINavigationBar.appearance().backgroundColor = .green
//        UINavigationBar.appearance().tintColor = .black
//        UINavigationBar.appearance().barTintColor = .black
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
//    }


    
    var body: some View {
        
        
        NavigationView {

        ZStack {

                // Set the background color
                Color.orange.edgesIgnoringSafeArea(.all)

                MenuView()

                /// Your inner view content goes here.
//        GeometryReader { geometry in
//                VStack {
//                    Text("Hello")
//                    Text("World")
//                    Image(systemName: "paperplane")
//                    InnerView()
//                } // VStack
//                    .background(Color.orange)
//                    .resizable()
//                    .aspectRatio(geometry.size, contentMode: .fill)
//                    .edgesIgnoringSafeArea(.all)
//                InnerView()

            } // ZStack
            .navigationBarItems(trailing:
                HStack {
                    Button("Test") {
                    print("what's this")
                    }

                    Button(action: {}) { Image(systemName: "magnifyingglass").foregroundColor(Color.gray).padding() }

                    NavigationLink(destination: ActionSheetView()){ Image(systemName: "paperplane").padding() }

                }
            )
//                Spacer()
//                Button(action: {}) { Image(systemName: "magnifyingglass").foregroundColor(Color.gray).padding() }
//                Button(action: {}) { Image(systemName: "ellipsis").foregroundColor(Color.gray).padding() }

        } // NavgiationView
    } // body
} // ContentView

struct MenuView: View {
    var body: some View {
        HStack{
            ScrollView{
                VStack (alignment: .leading, spacing: 20) {
                    NavigationLink(destination: PickerView()){ Text("Picker").padding() }
                    NavigationLink(destination: ModalView()){ Text("Modal").padding() }
                    NavigationLink(destination: ActionSheetView()){ Text("Action Sheet").padding() }
                    NavigationLink(destination: DrawingView()){ Text("Drawing").padding() }
                    NavigationLink(destination: AnimationView()){ Text("Animation").padding() }
                    NavigationLink(destination: StringView()){ Text("Strings").padding() }

                } //VStack
                .accentColor(Color.white)
            } //ScrollView
            .navigationBarTitle(Text("Menu"))
//                .padding(.leading, 50)
//                .border(Color.orange)
            Spacer()
        } // HStack
    }
}

struct InnerView: View {
    var body: some View {

        NavigationView {
            ZStack {
                Color.green.edgesIgnoringSafeArea(.all)
                
                  VStack {
                                        
                //                        TabView {
                //                            Text("First View")
                //                                .font(.title)
                //                                .tabItem({
                //                                    Image(systemName: "bag")
                //                                    Text("First")
                //                                })
                //                                .tag(0)
                //                            Text("Second View")
                //                                .font(.title)
                //                                .tabItem({
                //                                    Image(systemName: "tag")
                //                                    Text("Second")
                //                                })
                //                                .tag(1)
                //                        }
                        /// Small square
                        HStack() {
                            VStack(){
                                Text("Hello")
                                Spacer()
                                Text("World")
                            }.padding(30)
                        } //HStack
                        .frame(width: 200, height: 200)
                        .background(Color.white)
                //        .border(Color.gray, width: 0.5)
                        .cornerRadius(20)
                        .clipped()
                        .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius:20).stroke(Color.red, lineWidth: 0.5)
                        )

//                        Spacer()

                    NavigationLink(destination: DetailView()) {
                        Text("Link").padding()
                    }

                    
                } // Main VStack
                .navigationBarTitle("Test")
                .navigationBarHidden(true)
//                        .background(Color.gray)
    //            .foregroundColor(Color.orange)
                
            }
            
          

            } //NavigationView
//                    .background(Color.orange)
//                    .foregroundColor(Color.pink)
//                    .opacity(0.2)
//                    .overlay(Color.purple.opacity(0.5))
        
    }
}


struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {

        Button(action: {
           self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "gobackward").padding()
        }
        .navigationBarHidden(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
