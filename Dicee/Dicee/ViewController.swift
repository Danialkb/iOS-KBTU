//
//  ViewController.swift
//  Dicee
//
//  Created by мак on 06.10.2024.
//

import UIKit

class ViewController: UIViewController {
    let imageNameList: [String] = ["Dice1.svg", "Dice2.svg", "Dice3.svg", "Dice4.svg", "Dice5.svg", "Dice6.svg"]
    
    @IBOutlet weak var firstDiceImage: UIImageView!
    
    @IBOutlet weak var secondDiceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Roll Dice button handler
    @IBAction func rollDices(_ sender: UIButton) {
        // updating images
        setRandomDiceImages()
    }
    
    func setRandomDiceImages() {
        firstDiceImage.image = UIImage(named: getRandomDiceImageName())
        secondDiceImage.image = UIImage(named: getRandomDiceImageName())
    }
    
    // function returning random image name from dice images array
    func getRandomDiceImageName() -> String {
        let randomImageIndex = Int.random(in: 0..<6)
        return imageNameList[randomImageIndex]
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        setRandomDiceImages()
    }
}

