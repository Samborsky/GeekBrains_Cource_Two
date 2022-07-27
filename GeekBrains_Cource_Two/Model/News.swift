//
//  News.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 03.07.2022.
//

import UIKit
import AVFoundation

struct News {
    let text: String
    let photos: UIImage?
//    let myFriendNews: Friend?
}

func audioPlayer (controller: NewsTableViewCell, song: String) {
    do {
        if let audioPath = Bundle.main.path(forResource: song, ofType: "mp3") {
            try controller.player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
        }
    } catch {
        print("error")
    }
}
