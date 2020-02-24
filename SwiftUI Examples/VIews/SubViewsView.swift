//
//  SubViewsView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 2/23/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct SubViewsView: View {
    var body: some View {
        HStack {
            VStack {
                HeaderView()
                NavigationSectionView()
                Spacer()
            }
            Spacer()
            SideBarView()
        } // HStack
        
    }
}

struct HeaderView: View {
    @State private var showSubAView: Bool = true
    @State private var showSubBView: Bool = false
    @State private var showSubCView: Bool = false

    var body: some View {
        VStack {
            VStack {
//            Text("Header").font(.largeTitle)
            HStack {
                Spacer()
                
                Button( action: {
                    self.showSubAView = true
                    self.showSubBView = false
                    self.showSubCView = false
                }) { Text("Show A") }
                
                Spacer()
                
                Button( action: {
                    self.showSubAView = false
                    self.showSubBView = true
                    self.showSubCView = false
                }) { Text("Show B") }
                
                Spacer()
                
                Button( action: {
                    self.showSubAView = false
                    self.showSubBView = false
                    self.showSubCView = true
                }) { Text("Show C") }
                 
                Spacer()
                
            } // HStack
            
                
            } // VStack
            .padding()
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 50, maxHeight: 100)
            .border(Color.red)
            .padding()
            
            VStack {
                
                Text("SubViews below").padding()
                
                if showSubAView { SubAView() }
                if showSubBView { SubBView() }
                if showSubCView { SubCView() }

            }
            .padding()
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 200, maxHeight: 400)
            .border(Color.orange)
            .padding()
            
            
        } // VStack

        
    }
}

struct SideBarView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Sidebar")
            Spacer()
            Text("12345")
            Text("12345")
            Text("12345")
            Spacer()
        } // VStack
            .padding()
            .frame(minWidth: 20, maxWidth: 100, minHeight: 50, maxHeight: .infinity)
            .border(Color.blue)
            .padding()
        
        
    }
}

struct SubAView: View {
    var body: some View {
        VStack{
            Text("A").font(.largeTitle)
            Text("I'm subView A").font(.footnote)
        }
        .padding()
        .border(Color.green)
    }
}

struct SubBView: View {
    var body: some View {
        VStack{
            Text("B").font(.largeTitle)
            Text("I'm subView B").font(.footnote)
        }
        .padding()
        .border(Color.purple)

    }
}

struct SubCView: View {
    var body: some View {
        VStack{
            Text("C").font(.largeTitle)
            Text("I'm subView C").font(.footnote)
        }
        .padding()
        .border(Color.pink)

    }
}

struct NavigationSectionView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("I'm the navigation pane")
                NavigationLink(destination: Nav1View()) {
                    Text("Show Sub View 1")
                }
            }
            .padding()
            .navigationBarTitle("Navigation")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .padding()
        .border(Color.yellow)
        .padding()

    }
}

struct Nav1View: View {
    var body: some View {
        VStack {
            Text("1").font(.largeTitle)
            Text("I'm subView 1").font(.footnote)
            NavigationLink(destination: Nav2View()) { Text("Show Sub View 2") }
        }
    }
}
struct Nav2View: View {
    var body: some View {
        VStack {
            Text("2").font(.largeTitle)
            Text("I'm subView 2").font(.footnote)
            NavigationLink(destination: Nav3View()) { Text("Show Sub View 3") }
            NavigationLink(destination: Nav4View()) { Text("Show Sub View 4") }
        }
    }
}

struct Nav3View: View {
    var body: some View {
        VStack{
            Text("3").font(.largeTitle)
            Text("I'm subView 3").font(.footnote)
        }
    }
}

struct Nav4View: View {
    var body: some View {
        VStack{
            Text("4").font(.largeTitle)
            Text("I'm subView 4").font(.footnote)
        }
    }
}

struct SubViewsView_Previews: PreviewProvider {
    static var previews: some View {
        SubViewsView()
    }
}
