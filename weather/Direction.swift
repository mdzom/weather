//
//  Direction.swift
//  weather
//
//  Created by Gennadij Pleshanov on 17.02.2023.
//

import Foundation

struct Direction: Codable {
    // не все будет нужно:
    let degrees: Int
    let localized: String
    let english: String
    
    init?(_ dict: [String: Any]) {
        guard let degrees = dict["Degrees"] as? Int,
              let localized = dict["Localized"] as? String,
              let english = dict["English"] as? String else {
            return nil
        }
        self.degrees = degrees
        self.localized = localized
        self.english = english
    }
}
