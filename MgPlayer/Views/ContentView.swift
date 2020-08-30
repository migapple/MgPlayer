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


struct ContentView: View {
    @ObservedObject var loadData = LoadData()
//    @State var results = [Result]()
    @State var enteredText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Recherche: ", text: $enteredText, onCommit:  {
                    let replaced = enteredText.replacingOccurrences(of: " ", with: "+")
                    loadData.loadData(artist: replaced)
                })
                .modifier(ClearButton(editedText: $enteredText))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                
                if loadData.results.count != 0 {
                    List(loadData.results, id: \.trackId) { item in
                        
                        VStack(alignment: .leading) {
                            
                            UrlImageView(urlString: item.artworkUrl30)
                                .frame(width: 30, height: 30)
                            
                            Text(item.trackName)
                                .font(.headline)
                            
                            Text(item.collectionName)
                            
                            Text(item.artistName)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
