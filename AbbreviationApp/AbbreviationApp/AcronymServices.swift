//
//  AcronymServices.swift
//  AbbreviationApp
//
//  Created by Papneja, Brajmohan on 22/08/19.
//  Copyright © 2019 Papneja, Brajmohan. All rights reserved.
//

import UIKit

class AcronymServices: NSObject {
    
    static let shared = AcronymServices()
    
    private override init(){}
    
    
    func getAllAcronyms(successBlock: @escaping (Any?) -> Void, failureBlock: @escaping (Error?) -> Void){
    
        
        let session = URLSession.shared
        let url = URL(string: "http://localhost:8080/acronyms")!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            
           var allAcronyms : Any?
            do {
                allAcronyms = try JSONSerialization.jsonObject(with: data!, options: [])
                successBlock(allAcronyms)
            } catch {
                failureBlock(error)
                print("JSON error: \(error.localizedDescription)")
            }

        })
        task.resume()
    }
    

}
