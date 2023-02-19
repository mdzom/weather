//
//  WeatherForAnHour.swift
//  weather
//
//  Created by Gennadij Pleshanov on 19.02.2023.
//

import Foundation

struct WeatherForAnHour: Codable {
    let dateTime: String
    let temperature: SystemOfMeasures
    
    init?(_ dict: [String: Any]) {
        guard let dateTime = dict["DateTime"] as? String,
              let temperatureDict = dict["Temperature"] as? [String: Any],
              let temperature = SystemOfMeasures(temperatureDict)
        else { return nil }
        self.dateTime = dateTime
        self.temperature = temperature
    }
}
