//
//  Wind.swift
//  weather
//
//  Created by Gennadij Pleshanov on 17.02.2023.
//

import Foundation

struct Wind: Codable {
    let direction: Direction
    let speed: WeatherConditions
    
    init?(_ dict: [String: Any]) {
        guard let directionDict = dict["Direction"] as? [String: Any],
              let direction = Direction(directionDict),
              let speedDict = dict["Speed"] as? [String: Any],
              let speed = WeatherConditions(speedDict)
        else {
            return nil
        }
        self.direction = direction
        self.speed = speed
    }
}
