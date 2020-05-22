//
//  NodejsAPI.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 5/22/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct NodejsAPI: View {
    
    struct Result: Codable {
        let id: Int
        let client: String
        let location: String
        let move_in: Bool
        let timestamp: String
    }
    
    @State private var results = [Result]()

    
    var body: some View {
        
        VStack {
            Text("Reports").font(.largeTitle)
                
            List(results, id: \.id) { item in
                VStack(alignment: .leading) {
                    Text(item.client)
                        .font(.headline)
                    HStack{
                        Text("Location").font(.subheadline)
                        Text(item.location).font(.subheadline)
                    }
                    HStack{
                        Text("Move In").font(.subheadline)
                        Text(String(item.move_in)).font(.subheadline)
                    }
                    HStack{
                        Text("Timestamp").font(.subheadline)
                        Text(item.timestamp).font(.subheadline)
                    }
                }
            }
            .onAppear(perform: loadData)
            
            Spacer()
            
        } // VStack
        
    } // body
    
        func loadData() {
//            print("loading reports..")
            guard let url = URL(string: "http://localhost:5000/reports") else {
                print("Invalid URL")
                return
            }

            let request = URLRequest(url: url)

            URLSession.shared.dataTask(with: request) { data, response, error in

//                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) {
//                    print(json)
//                }

                if let data = data {

                    if let decodedResponse = try? JSONDecoder().decode([Result].self, from: data) {
                        // we have good data – go back to the main thread
                        DispatchQueue.main.async {
                            // update our UI
                            self.results = decodedResponse
                        }
                        // everything is good, so we can exit
                        return
                    }
                }

                // if we're still here it means there was a problem
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")

            }.resume()
            
//            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

//            let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    fatalError("Error: \(error.localizedDescription)")
//                }
//                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                    fatalError("Error: invalid HTTP response code")
//                }
//                guard let data = data else {
//                    fatalError("Error: missing response data")
//                }
//
//                do {
//                    let decoder = JSONDecoder()
//                    self.reports = try decoder.decode([Report].self, from: data)
//                }
//                catch {
//                    print("Error: \(error.localizedDescription)")
//                }
//            }
//            task.resume()
            
        } // loadReports
        

}

struct NodejsAPI_Previews: PreviewProvider {
    static var previews: some View {
        NodejsAPI()
    }
}
