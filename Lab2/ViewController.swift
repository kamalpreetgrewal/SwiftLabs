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
    var currentCount = 0

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func start(_ sender: UIButton) {
        run()
        isTimerRunning = true
        sender.isEnabled = false
    }
    
    func run(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateView), userInfo: nil, repeats: true)
    }
    
    func updateView(){
        currentCount += 1
        label.text = String(currentCount)
    }
    
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
    
    @IBAction func reset(_ sender: UIButton) {
        isTimerRunning = false
        currentCount = 0
        label.text = String(currentCount)
        timer.invalidate()
        startButton.isEnabled = true
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

