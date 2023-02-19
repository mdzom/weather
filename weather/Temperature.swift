//
//  Temperature.swift
//  weather
//
//  Created by Gennadij Pleshanov on 19.02.2023.
//

import Foundation

struct Temperature: Codable {
    let minimum: SystemOfMeasures
    let maximum: SystemOfMeasures
    
    init?(_ dict: [String: Any]) {
        guard let minimumDict = dict["Minimum"] as? [String: Any],
              let minimum = SystemOfMeasures(minimumDict),
              let maximumDict = dict["Maximum"] as? [String: Any],
              let maximum = SystemOfMeasures(maximumDict)
        else { return nil }
        self.minimum = minimum
        self.maximum = maximum
    }
}
