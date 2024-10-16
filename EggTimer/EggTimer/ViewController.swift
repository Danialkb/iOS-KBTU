//
//  ViewController.swift
//  EggTimer
//
//  Created by мак on 10.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var softBoiledEggImage: UIImageView!
    
    @IBOutlet weak var mediumBoiledEggImage: UIImageView!
    
    @IBOutlet weak var hardBoiledEggImage: UIImageView!
    
    @IBOutlet weak var softBoiledEggLabel: UILabel!
    
    @IBOutlet weak var mediumBoiledEggLabel: UILabel!
    
    @IBOutlet weak var softBoiledEggProgressBar: UIProgressView!
    
    @IBOutlet weak var hardBoiledEggLabel: UILabel!
    
    @IBOutlet weak var mediumBoiledEggProgressBar: UIProgressView!
    
    @IBOutlet weak var hardBoiledEggProgressBar: UIProgressView!
    
    @IBOutlet weak var softBoiledEggTimerLabel: UILabel!
    
    @IBOutlet weak var mediumBoiledEggTimerLabel: UILabel!
    
    @IBOutlet weak var hardBoiledEggTimerLabel: UILabel!
    
    var softBoiledTimeRemaining: Int = 10 // 5 minutes in seconds
    var mediumBoiledTimeRemaining: Int = 15 // 7 minutes in seconds
    var hardBoiledTimeRemaining: Int = 20 // 12 minutes in seconds
    
    var softBoiledTimer: Timer?
    var mediumBoiledTimer: Timer?
    var hardBoiledTimer: Timer?
    
    var TIMER_ENDED_SOUND_FILE = "alarm_sound"
    var TIMER_ENDED_SOUND_FILE_EXTENSION = ".mp3"
    var timerEndedAudio: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetLabels()
        resetProgress()
    }
    
    @IBAction func startSoftBoiledEggTimer(_ sender: UIButton) {
        resetAllTimersExceptCurrent(currentTimer: self.softBoiledTimer)
        scaleButton(button: sender)
        startBoiledEggTimer(boiledTimeRemaining: self.softBoiledTimeRemaining, boiledEggTimerLabel: self.softBoiledEggTimerLabel, timer: &self.softBoiledTimer, progressBar: self.softBoiledEggProgressBar)
    }
    
    @IBAction func startMediumBoiledEggTimer(_ sender: UIButton) {
        resetAllTimersExceptCurrent(currentTimer: self.mediumBoiledTimer)
        scaleButton(button: sender)
        startBoiledEggTimer(boiledTimeRemaining: self.mediumBoiledTimeRemaining, boiledEggTimerLabel: self.mediumBoiledEggTimerLabel, timer: &self.mediumBoiledTimer, progressBar: self.mediumBoiledEggProgressBar)
    }
    
    @IBAction func startHardBoiledEggTimer(_ sender: UIButton) {
        resetAllTimersExceptCurrent(currentTimer: self.hardBoiledTimer)
        scaleButton(button: sender)
        startBoiledEggTimer(boiledTimeRemaining: self.hardBoiledTimeRemaining, boiledEggTimerLabel: self.hardBoiledEggTimerLabel, timer: &self.hardBoiledTimer, progressBar: self.hardBoiledEggProgressBar)
    }
    
    func startBoiledEggTimer(boiledTimeRemaining: Int, boiledEggTimerLabel: UILabel, timer: inout Timer?, progressBar: UIProgressView){
        var timeRemaining = boiledTimeRemaining
        var progress: Float = 0.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            timeRemaining -= 1
            boiledEggTimerLabel.text = self.formatTime(seconds: timeRemaining)
            
            progress += 1.0
            progressBar.progress = progress / Float(boiledTimeRemaining)
            
            if timeRemaining <= 0 {
                self.playTimerEndedSound()
                print("time ended")
                timer.invalidate()
                self.resetLabels()
                self.resetProgress()
            }
        }
    }
    
    func resetAllTimersExceptCurrent(currentTimer: Timer?) {
        if currentTimer !== self.softBoiledTimer {
            self.softBoiledTimer?.invalidate()
        }
        if currentTimer !== self.mediumBoiledTimer {
            self.mediumBoiledTimer?.invalidate()
        }
        if currentTimer !== self.hardBoiledTimer {
            self.hardBoiledTimer?.invalidate()
        }
        
        resetLabels()
    }
    
    func resetLabels() {
        // set deefault time for all timers
        softBoiledEggTimerLabel.text = formatTime(seconds: softBoiledTimeRemaining)
        mediumBoiledEggTimerLabel.text = formatTime(seconds: mediumBoiledTimeRemaining)
        hardBoiledEggTimerLabel.text = formatTime(seconds: hardBoiledTimeRemaining)
    }

    func resetProgress() {
        // set deefault progress for all eggs
        softBoiledEggProgressBar.progress = 0.0
        mediumBoiledEggProgressBar.progress = 0.0
        hardBoiledEggProgressBar.progress = 0.0
    }
        
    func formatTime(seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func playTimerEndedSound() {
        guard let soundUrl = Bundle.main.url(forResource: self.TIMER_ENDED_SOUND_FILE, withExtension: self.TIMER_ENDED_SOUND_FILE_EXTENSION) else { return }
        
        do {
            try timerEndedAudio = AVAudioPlayer(contentsOf: soundUrl)
            timerEndedAudio.prepareToPlay()
            timerEndedAudio.play()
        }
        catch {
            print("Error during playing audio \(error)")
        }
    }
    
    func scaleButton(button: UIButton) {
        UIView.animate(withDuration: 1.0, animations: {
            button.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: { _ in
            UIView.animate(withDuration: 1.0, animations: {
                button.transform = CGAffineTransform.identity
            })
        })
    }
}

