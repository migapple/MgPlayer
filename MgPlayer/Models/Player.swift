//
//  Player.swift
//  MusicApp
//
//  Created by Michel Garlandat on 06/08/2020.
//

import AVFoundation

class Player: ObservableObject {
    static var shareInstance = Player()

    var audioPlayer: AVPlayer!

    func play(choix: String) {
        guard let url = URL(string: choix) else {
            print("Invalid url")
            return
        }

        let playerItem = AVPlayerItem(url: url)
        audioPlayer = AVPlayer(playerItem: playerItem)
        audioPlayer.play()
    }
    
    func pause() {
        audioPlayer.pause()
    }
}
