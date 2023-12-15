//
//  StopWatchViewController.swift
//  workoutGenerationApp
//
//  Created by Tanner Vanlangeveld on 12/14/23.
//

import UIKit

class StopWatchViewController: UIViewController {
    
    var elapsedTime: TimeInterval = 0
    var stopWatchTimer: Timer?
    
    var timerLabelText = "00:00"
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startTitle: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = timerLabelText
    }
    
    
    
    @IBAction func timerBtn(_ sender: UIButton) {
        
            if let timer = stopWatchTimer {
                timer.invalidate()
                stopWatchTimer = nil
                elapsedTime = 0
                
                //            timerLabel.text = "0:00:00"
                
                sender.setTitle("Start", for: .normal)
            } else {
                stopWatchTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
                    self?.elapsedTime += timer.timeInterval
                    
                    let minutes = Int(self?.elapsedTime ?? 0) / 60 % 60
                    let seconds = Int(self?.elapsedTime ?? 0) % 60
                    
                    DispatchQueue.main.async {
                        self?.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
                    }
                    
                    
                    
                })
                
                sender.setTitle("Stop", for: .normal)
            }
        }
    
    
    
    @IBAction func resetBtn(_ sender: UIButton) {
        
        stopWatchTimer?.invalidate()
        startTitle.setTitle("Start", for: .normal)
        timerLabel.text = timerLabelText
        
    }
    
    
    
}
