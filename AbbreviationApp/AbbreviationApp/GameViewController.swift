//
//  GameViewController.swift
//  AbbreviationApp
//
//  Created by Papneja, Brajmohan on 22/08/19.
//  Copyright © 2019 Papneja, Brajmohan. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var shortAcronym: UILabel!
    @IBOutlet weak var resultLabel : UILabel!
    @IBOutlet weak var scoreLabel :UILabel!
    @IBOutlet weak var attemptsLabel: UILabel!
    @IBOutlet weak var nextButton : UIButton!
    
    
    @IBOutlet weak var resultImage : UIImageView!
    @IBOutlet weak var acronymTextField: UITextField!
    
    
    
    var countAcronyms : Int = 0
    var score : Int = 0
    var attempts : Int = 1
    var responseAcronyms : Array<Any>?
    var randomGeneratedAcronym : Dictionary<String,String>?
    var shortForm : String?
    var longFrom : String?
    
    var timer: Timer?
    var totalTime = 60
    
    private func startTimer() {
        self.totalTime = 60
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        print(self.totalTime)
        self.lblTimer?.text = self.timeFormatted(self.totalTime) // will show timer
        
        if totalTime != 0 {
            totalTime -= 1  // decrease counter timer
        }
        else {
            if let timer = self.timer {
                timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds
        return String(format: "%02d", seconds)
    }

    
    fileprivate func setNewGame() {
        self.resultImage.isHidden = true
        self.resultLabel.isHidden = true
        
        AcronymServices.shared.getAllAcronyms(successBlock: { [weak self] response in
            print("response=\(String(describing: response))")
            self?.countAcronyms = (response as! Array<Any>).count as Int
            self?.responseAcronyms = (response as! Array<Any>)
            
            let randomInt:Int = Int.random(in: 1..<(self?.countAcronyms ?? 7))
            
            
            self?.randomGeneratedAcronym = self?.responseAcronyms?[randomInt] as? Dictionary<String,String>
            self?.shortForm = (self?.randomGeneratedAcronym?["short"] ?? "")
            self?.longFrom = (self?.randomGeneratedAcronym?["long"] ?? "")
            
            
            
            DispatchQueue.main.async {
                self?.shortAcronym?.text =   self?.shortForm
                self?.startTimer()
            }
            
            
            
        }) { error in
            print("error=\(String(describing: error))")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Acronym Game"
        setNewGame()
        
        
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        stopTimer()
    }
    
    func stopTimer(){
        self.timer?.invalidate()
        self.timer = nil
    }
    
    
    @IBAction func checkResult () {
        let text: String = acronymTextField?.text! ?? ""
        
        var result = false
        for dict in responseAcronyms!
            {
                let localDict : Dictionary = dict as! Dictionary<String,String>
                print(localDict)
                
                if let val = localDict["short"] {
                    // now val is not nil and the Optional has been unwrapped, so use it
                    if let short = self.shortForm, let long = self.longFrom {
                        if (val.caseInsensitiveCompare(short) == ComparisonResult.orderedSame) && (text.caseInsensitiveCompare(long) == ComparisonResult.orderedSame) {
                            result = true
                            score += 1
                    }
                }
                
            }
        }
        
        
        self.resultImage.isHidden = false
        self.resultLabel.isHidden = false
        
                if result {
                    self.resultImage.image = UIImage(named: "correct")
                    self.resultLabel.text = "correct"
                    
                } else {
                    self.resultImage.image = UIImage(named: "wrong")
                    self.resultLabel.text = "correct"
                }
         self.scoreLabel.text = "\(score)"
        
            }
            
            
      @IBAction func nextAttempt () {
        stopTimer()
        self.acronymTextField.text = ""
        attempts += 1
        self.attemptsLabel.text = "\(attempts)/3"
        setNewGame()
        if(attempts == 3){
           self.nextButton.isHidden = true
        }
        
        
        
    }
      
        
        
    
        
        
        
        
        
        
    
    
    
}

