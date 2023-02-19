//
//  CurrentWeather.swift
//  weather
//
//  Created by Gennadij Pleshanov on 17.02.2023.
//

import Foundation

struct CurrentWeather: Codable {
    let weatherText: String
    let temperature: WeatherConditions
    let relativeHumidity: Int
    let wind: Wind
    let visibility: WeatherConditions
    let pressure: WeatherConditions
    
    init?(_ json: Any) {
        guard let array = json as? [[String: Any]],
              let dict = array.first,
              let weatherText = dict["WeatherText"] as? String,
              let temperatureDict = dict["Temperature"] as? [String: Any],
              let temperature = WeatherConditions(temperatureDict),
              let relativeHumidity = dict["RelativeHumidity"] as? Int,
              let windDict = dict["Wind"] as? [String: Any],
              let wind = Wind(windDict),
              let visibilityDict = dict["Visibility"] as? [String: Any],
              let visibility = WeatherConditions(visibilityDict),
              let pressureDict = dict["Pressure"] as? [String: Any],
              let pressure = WeatherConditions(pressureDict)
        else {
            return nil
        }
        self.weatherText = weatherText
        self.temperature = temperature
        self.relativeHumidity = relativeHumidity
        self.wind = wind
        self.visibility = visibility
        self.pressure = pressure
    }
}
