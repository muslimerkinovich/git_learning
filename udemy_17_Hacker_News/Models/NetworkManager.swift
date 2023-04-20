//
//  NetworkManager.swift
//  udemy_17_Hacker_News
//
//  Created by Muslim on 20/04/23.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts: [Post] = []

    func fetcData() {
        
        let urlString: String = "https://hn.algolia.com/api/v1/search?tags=front_page"
        let url = URL(string: urlString)
        
        if let url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                
                if let data {
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let result = try decoder.decode(Response.self, from: data)
                        DispatchQueue.main.async {
                            self.posts = result.hits
                        }
                    } catch  {
                        print(error)
                    }
                    
                }
            }
            task.resume()
        }
    }
}
