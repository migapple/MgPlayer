//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Michel Garlandat on 26/08/2020.
//
//  Paul Hudson

import SwiftUI



struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
    var artistName: String
    var previewUrl: String
    var artworkUrl30: String
    var artworkUrl100: String
}

struct ContentView: View {
    @State var results = [Result]()
    @State var enteredText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Recherche: ", text: $enteredText, onCommit:  {
                    let replaced = enteredText.replacingOccurrences(of: " ", with: "+")
                    loadData(artist: replaced)
                })
                .modifier(ClearButton(editedText: $enteredText))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                
                if results.count != 0 {
                    List(results, id: \.trackId) { item in
                        
                        VStack(alignment: .leading) {
                            
                            UrlImageView(urlString: item.artworkUrl30)
                                .frame(width: 30, height: 30)
                            
                            Text(item.trackName)
                                .font(.headline)
                            
                            Text(item.collectionName)
                            
                            Text(item.artistName)
                                .foregroundColor(.red)
                        }
                        
                        
                        NavigationLink("", destination: PlayerView(item: item))
                           
                        
                    }
                } else {
                    
                    Image(systemName: "music.note")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width - 20, height: UIScreen.main.bounds.size.height - 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    
                }
            }
            .navigationBarTitle("Apple Music")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.blue)
        }
    }
    
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewDevice("iPhone SE (1st generation)")
        }
    }
}
