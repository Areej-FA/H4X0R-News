//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Areej on 3/1/20.
//  Copyright © 2020 Areej. All rights reserved.
//

import Foundation

class NetworkManager : ObservableObject{
    
    @Published var posts = [Post]()
    
    func fatchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, resonse, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                             let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            print(safeData)
                        } catch {
                            print(error)
                        }
                       
                    }
                    
                }
            }
            task.resume()
        }
        
    }
}
