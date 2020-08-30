//
//  LoadData.swift
//  MgPlayer
//
//  Created by Michel Garlandat on 28/08/2020.
//

import Foundation

class LoadData: ObservableObject {
    @Published var results = [Result]()
    
    func loadData(artist: String) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(artist)&entity=song") else { print("Invalid URL"); return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        self.results = decodedResponse.results
                    }
                    return
                }
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}
