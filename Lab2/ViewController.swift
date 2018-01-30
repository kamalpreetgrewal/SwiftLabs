//
//  ViewController.swift
//  Lab2
//
//  Created by h18 on 2018-01-30.
//  Copyright © 2018 h18. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var isTimerRunning = false
    var time = 120
    var currentSeconds = 0
    var currentMinutes = 0

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBAction func start(_ sender: UIButton) {
        run()
        isTimerRunning = true
        sender.isEnabled = false
    }
    
    // Trigger timer to start/resume
    func run(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateView), userInfo: nil, repeats: true)
    }
    
    // This function updates the label showing the time. It shows minutes and seconds
    // as per the time.
    func updateView(){
        currentSeconds += 1
        
        label.text = String(currentSeconds)
        
        // Seconds are converted to minutes once they are multiple of 60
        while(currentSeconds >= 60 && currentSeconds % 60 == 0){
            currentMinutes += 1
            currentSeconds = 0
        }
        
        if currentMinutes > 0 {
            label.text = String(currentMinutes) + ":" + String(currentSeconds)
        }
    }
    
    // Stop and resume the timer and change button title accordingly.
    @IBAction func pause(_ sender: UIButton) {
        if(isTimerRunning) {
            timer.invalidate()
            sender.setTitle("Resume", for: .normal)
            isTimerRunning = false
        } else{
            sender.setTitle("Pause", for: .normal)
            run()
            isTimerRunning = true
        }
    }
    
    // On reset, stop the timer and reset the current time values. Also enable the
    // "Start" button.
    @IBAction func reset(_ sender: UIButton) {
        timer.invalidate()
        isTimerRunning = false
        currentSeconds = 0
        currentMinutes = 0
        label.text = String(currentSeconds)
        startButton.isEnabled = true
        pauseButton.setTitle("Pause", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

