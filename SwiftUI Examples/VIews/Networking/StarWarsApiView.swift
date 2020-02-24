//
//  StarWarsApiView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 2/20/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct StarWarsApiView: View {
    
    struct Response: Codable {
        var results: [Person]
    }
    
    struct Person: Codable, Identifiable {
        let id = UUID()
        var name: String
        var birth_year: String
        var height: String
        var mass: String
        var homeworld: String
    }

    struct Planet: Codable, Identifiable {
        let id = UUID()
        var name: String
        var population: String
    }
    
    @State private var results = [Person]()
    @State private var homeworldResult = [Planet]()

    var body: some View {
        
        VStack {
            Text("Star Wars API Example").font(.largeTitle)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach (results) { person in
                        VStack {
                                Text(person.name)
                                    .font(.headline)
                                    .padding(.vertical)
                                
                            Group {
                                Text("Born in \(person.birth_year)")
                                    .font(.footnote)
                                
                                Text("Height of \(person.height)")
                                    .font(.footnote)
                                
                                Text("Mass of \(person.mass)")
                                    .font(.footnote)
                                
                                Text("Homeworld of \(person.homeworld)")
                                    .font(.footnote)
                                //                                .onAppear(perform: loadPlanet(homeworld: person.homeworld))
                                //                            Text("Homeworld of \(homeworldResult)")
                            } .padding(.vertical, 5)
                        }
                        .padding()
                        .cornerRadius(20)
                        .frame(minHeight: 700, maxHeight: .infinity)
                        .background(Color.LightGray)

                    } // ForEach
                } // VStack
                .frame(height: 300)
                .padding()

            } // ScrollView
                .onAppear(perform: loadPeople)
            
            Spacer()
            
        } // VStack
        
    } // body
    
    func loadPeople() {
        print("loading people..")
        guard let url = URL(string: "https://swapi.co/api/people") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.results
                    }
                    // everything is good, so we can exit
                    return
                }
            }
            
            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
        }.resume()
    } // loadData
    
    
}

struct SWCellView: View {
    var body: some View {
        Text("Hello")
    }
}



struct StarWarsApiView_Previews: PreviewProvider {
    static var previews: some View {
        StarWarsApiView()
    }
}
