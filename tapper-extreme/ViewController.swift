//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Muhammad Zaki Murakay on 25/6/16.
//  Copyright © 2016 BLESA LABS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    var maxTaps = 0
    var currentTaps = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var coinBtn: UIButton!
    @IBOutlet weak var tapLbl: UILabel!
    
    @IBAction func onCoinTapped(sender: UIButton!) {
        currentTaps += 1
        updateTapsLbl()
    
        if isGameover() {
            restartGame()
        }
    }
    
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            logoImg.hidden = true
            howManyTapsTxt.hidden = true
            playBtn.hidden = true
            
            coinBtn.hidden = false
            tapLbl.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLbl()
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        howManyTapsTxt.hidden = false
        playBtn.hidden = false
        
        coinBtn.hidden = true
        tapLbl.hidden = true
    }
    
    func isGameover() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }

    func updateTapsLbl() {
        tapLbl.text = "\(currentTaps) Taps"
    }
}

