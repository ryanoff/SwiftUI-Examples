//
//  SearchResponseView.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 2/21/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct SearchResponseView: View {
    
    struct Response: Codable {
        var results: [Result]
    }

    struct Result: Codable {
        var trackId: Int
        var trackName: String
        var collectionName: String
        var releaseDate: String
        var artworkUrl30: String
    }
    
    @State private var results = [Result]()
    @State var searchInput: String = ""

    func getDate(_ dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.date(from: dateString) ?? Date() //TODO: replace today with some error message
    }
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            Text ("Search iTunes Music")
                .font(.title)
                .padding()
            
            HStack {
                
                TextField("Artist, Song, Album", text: $searchInput)
                    .padding()
                    .background(Color.LightGray)
                    .padding()
                
                Button(action: {
                    self.loadData()
                }) {
                    Text("Search")
                }
                .padding()
                
            }

//            if !results.isEmpty {
                
                List(results, id: \.trackId) { item in
                    VStack(alignment: .leading) {
                        
                        Text(item.trackName)
                            .font(.headline)
                        
                        Text(item.collectionName)
                            .font(.footnote)
                        
                        Text("\(self.getDate(item.releaseDate), formatter: Self.dateFormat)")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        
                    }
                }
//            }
            //            .onAppear(perform: loadData)

            Spacer()
            
        } // VStack
        
    } // body
    
    func loadData() {
        
        let rawUrlString = "https://itunes.apple.com/search?term=" + searchInput + "&entity=song"
        let urlString = rawUrlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        guard let url = URL(string: urlString ?? "bad search" ) else {
            print("Invalid URL: \(urlString ?? "bad url")")

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

struct SearchResponseView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResponseView()
    }
}
