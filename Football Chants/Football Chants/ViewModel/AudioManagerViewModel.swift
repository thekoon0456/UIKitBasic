//
//  AudioManagerViewModel.swift
//  Football Chants
//
//  Created by Deokhun KIM on 2023/02/21.
//

import Foundation
import AVKit

class AudioManagerViewModel {
    private var chantAudioPlayer: AVAudioPlayer?
    
    func playback(_ team: Team) {
        if team.isPlaying {
            chantAudioPlayer?.stop()
        } else {
            //Bundle.main.path: 번들 경로 확인하고 가져오기
            guard let path = Bundle.main.path(forResource: "\(team.id.chantFile).mp3", ofType: nil) else { return }
            let url = URL(fileURLWithPath: path)
            do {
                chantAudioPlayer = try AVAudioPlayer(contentsOf: url)
                chantAudioPlayer?.numberOfLoops = -1
                chantAudioPlayer?.play()
            } catch {
                print(error)
            }
        }
    }
}
