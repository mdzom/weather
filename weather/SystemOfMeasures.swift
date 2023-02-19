//
//  SystemOfMeasures.swift
//  weather
//
//  Created by Gennadij Pleshanov on 17.02.2023.
//

import Foundation

//Metric / Imperial
struct SystemOfMeasures: Codable {
    let value: Int
    let unit: String
    
    init?(_ dict: [String: Any]) {
        guard
            let value = dict["Value"] as? Double,
            let unit = dict["Unit"] as? String
        else {
            return nil
        }
        self.value = Int(value)
        self.unit = unit
    }
}
