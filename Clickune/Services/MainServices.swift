//
//  MainServices.swift
//  Clickune
//
//  Created by Олег Романов on 16.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import Foundation

protocol MainServiceProtocol {
    func getScore(completion: (Int?, Error?) -> Void)
    func updateScore(_ value: Int, completion: (Int?, Error?) -> Void)
}

class MainService: MainServiceProtocol {
    static var shared: MainService = MainService()
    
    private init() {}
    
    func getScore(completion: (Int?, Error?) -> Void) {
        if let score: Int = UserDefaults.standard.value(forKey: "score") as? Int {
            completion(score, nil)
        } else {
            completion(0, nil)
        }
    }
    
    func updateScore(_ value: Int, completion: (Int?, Error?) -> Void) {
        UserDefaults.standard.set(value, forKey: "score")
        completion(value, nil)
    }
}
