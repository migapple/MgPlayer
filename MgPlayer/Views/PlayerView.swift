//
//  PlayerView.swift
//  MgPlayer
//
//  Created by Michel Garlandat on 28/08/2020.
//

import SwiftUI

struct PlayerView: View {
    var item : Result
    
    var body: some View {
        VStack {
            
            UrlImageView(urlString: item.artworkUrl100)
                .frame(width: 100, height: 100)
            
            ZStack {
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding(.top)
                    Text(item.collectionName)
                        .font(.title)
                        .fontWeight(.light)
                        .opacity(0.5)
                        .foregroundColor(.white)
                    Text(item.artistName)
                        .font(.title)
                        .fontWeight(.light)
                        .opacity(0.5)
                        .foregroundColor(.white)
                }
                
            }
            
            PlayerViewController(videoURL: URL(string: item.previewUrl))
                .frame(width: 300, height: 300)
            
        }
        .background(Color.black)
//        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}


//struct PlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerView(item: Result(trackId: 1, trackName: "Sergent Pepper", collectionName: "The Beatles", artistName: "The Beatles", previewUrl: "", artworkUrl30: "", artworkUrl100: ""))
//    }
//}
