//
//  AddAcronymViewController.swift
//  AbbreviationApp
//
//  Created by Papneja, Brajmohan on 22/08/19.
//  Copyright © 2019 Papneja, Brajmohan. All rights reserved.
//

import UIKit

class AddAcronymViewController: UIViewController {
    @IBOutlet weak var shortText: UITextField?
    @IBOutlet weak var longText: UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   //curl -X POST http://localhost:8080/acronyms -H 'content-type: application/json' -d '{"short": "AI", "long": "Artifical Intelligence"}'
   @IBAction func addNewAcronym () {
    let url = String(format: "http://localhost:8080/acronyms")
    guard let serviceUrl = URL(string: url) else { return }
    let parameterDictionary = ["short" : "HO", "long" : "Home Office"]
    var request = URLRequest(url: serviceUrl)
    request.httpMethod = "POST"
    request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
        return
    }
    request.httpBody = httpBody
    
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
        if let response = response {
            print("response = \(response)")
        }
        if let data = data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("json = \(json)")
            } catch {
                print(error)
            }
        }
        }.resume()
    }
    
    
}


