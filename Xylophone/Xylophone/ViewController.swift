//
//  ViewController.swift
//  Xylophone
//
//  Created by мак on 10.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audio: AVAudioPlayer!
    var SOUND_FILE_EXTENSION = ".wav"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func xylophonButtonPress(_ sender: UIButton) {
        scaleButton(button: sender)
        playSound(selectedSound: (sender.titleLabel?.text)!)
    }
    
    func playSound(selectedSound: String) {
        guard let soundUrl = Bundle.main.url(forResource: selectedSound, withExtension: SOUND_FILE_EXTENSION) else { return }
        
        do {
            try audio = AVAudioPlayer(contentsOf: soundUrl)
            audio.prepareToPlay()
            audio.play()
        }
        catch {
            print("Error during playing audio \(error)")
        }
    }
    
    func scaleButton(button: UIButton) {
        UIView.animate(withDuration: 1.0, animations: {
            button.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion: { _ in
            UIView.animate(withDuration: 1.0, animations: {
                button.transform = CGAffineTransform.identity
            })
        })
    }
    
}

