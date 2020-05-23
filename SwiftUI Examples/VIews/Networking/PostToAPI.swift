//
//  PostToAPI.swift
//  SwiftUI Examples
//
//  Created by Ryan Off on 5/22/20.
//  Copyright © 2020 Ryan Off. All rights reserved.
//

import SwiftUI

struct PostToAPI: View {
    
    @State private var postResponse: String = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Post to API").font(.largeTitle)
            
            Button(action: {
                self.postToAPI()
            }) {
                Text("Post to API")
            }
            .padding()
            
            Spacer()
            
            if !postResponse.isEmpty {
                Text("Result").font(.headline)
                Text(postResponse).font(.subheadline)
            }
            Spacer()

        } // VStack
        
    } // body
    
    func postToAPI() {
        // send information to NodeJS API
        self.postResponse = "Loading.."
  
        // Prepare URL
        let url = URL(string: "https://shrouded-mesa-55819.herokuapp.com/report")
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "client=GREEN&location=none&move_in=true";
        
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                    self.postResponse = dataString
                }
        }
        task.resume()
        
        
    }
}

struct PostToAPI_Previews: PreviewProvider {
    static var previews: some View {
        PostToAPI()
    }
}
