//
//  CodableView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 2/20/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct CodableView: View {
    
    struct Response: Codable {
        var results: [Result]
    }

    struct Result: Codable {
        var trackId: Int
        var trackName: String
        var collectionName: String
    }
    
    @State private var results = [Result]()

    var body: some View {
        
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName)
                    .font(.footnote)
                
            }
        }
        .onAppear(perform: loadData)
        
    } // body
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=storybots&entity=song") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // For debugging
//            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) {
//                print(json)
//            }

            
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
    
} // View

struct CodableView_Previews: PreviewProvider {
    static var previews: some View {
        CodableView()
    }
}
