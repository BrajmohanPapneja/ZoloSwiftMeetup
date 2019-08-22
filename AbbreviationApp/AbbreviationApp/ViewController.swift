//
//  ViewController.swift
//  AbbreviationApp
//
//  Created by Papneja, Brajmohan on 07/08/19.
//  Copyright © 2019 Papneja, Brajmohan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
 

}
//curl -X POST http://localhost:8080/acronyms -H 'content-type: application/json' -d '{"short": "AI", "long": "Artifical Intelligence"}'
