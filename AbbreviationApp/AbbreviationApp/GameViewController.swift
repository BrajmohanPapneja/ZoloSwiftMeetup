//
//  GameViewController.swift
//  AbbreviationApp
//
//  Created by Papneja, Brajmohan on 22/08/19.
//  Copyright © 2019 Papneja, Brajmohan. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
     @IBOutlet weak var lblTimer: UILabel?
    @IBOutlet weak var searchResult: UILabel?
    @IBOutlet weak var searchTextField: UITextField?
    
    var timer: Timer?
    var totalTime = 120
    
    private func startTimer() {
        self.totalTime = 120
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
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startTimer()
        
    }
    
    
    
    @IBAction func getVal () {
        let text: String = searchTextField?.text! ?? ""
        
        var result = false
        let session = URLSession.shared
        let url = URL(string: "http://localhost:8080/acronyms")!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            
            // Do something...
            //print(data)
            //print(response)
            //print(error)
            var json : Any?
            do {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
            for dict in json as! Array<Any>
            {
                let localDict : Dictionary = dict as! Dictionary<String,String>
                print(localDict)
                
                if let val = localDict["short"] {
                    // now val is not nil and the Optional has been unwrapped, so use it
                    if val == text{
                        DispatchQueue.main.async {
                            result = true
                            self.searchResult?.text = localDict["long"]
                        }
                        
                    }
                }
                
                
                
                
            }
            
            DispatchQueue.main.async {
                if result == false
                {
                    self.searchResult?.text = "not present"
                }
            }
            
            
            
        })
        
        
        task.resume()
        
        
        
        
        
        
        
    }
    
    
}

