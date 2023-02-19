//
//  WeatherForOneDay.swift
//  weather
//
//  Created by Gennadij Pleshanov on 19.02.2023.
//

import Foundation

struct WeatherForOneDay: Codable {
    let date: String
    let temperature: Temperature
    // добавить иконку!!!!!
    
    init?(_ dict: [String: Any]) {
        guard
            let date = dict["Date"] as? String,
            let temperatureDict = dict["Temperature"] as? [String: Any],
            let temperature = Temperature(temperatureDict)
        else { return nil }
        self.date = date
        self.temperature = temperature
    }
}
