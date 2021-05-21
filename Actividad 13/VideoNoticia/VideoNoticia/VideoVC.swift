//  VideoVC.swift
//  VideoNoticia
/* Octavio Cuellar Almazan 2874558 ICA
Desarrollo de aplicaciones en plataforma iOS - Miguel Pérez Maciel
Actividad 13 - Reproductor de video y noticias - 04/05/2021
Versión 1.0
*/

import SwiftUI
import UIKit
import AVKit
import AVFoundation
var audioPlayer: AVAudioPlayer!


class VideoVC: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let ligaVideo = "https://walterebert.com/playground/video/hls/sintel-trailer.m3u8"

        let urlvideo = URL(string: ligaVideo)
                
        if let urlvideo = urlvideo
        {
          let asset = AVAsset(url: urlvideo)
          let item = AVPlayerItem(asset: asset)
          let miPlayer = AVPlayer(playerItem: item)
                    
          self.player = miPlayer
            miPlayer.play()
        }
    }
}
