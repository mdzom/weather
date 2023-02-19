//
//  WeatherForFiveDays.swift
//  weather
//
//  Created by Gennadij Pleshanov on 17.02.2023.
//

import Foundation

//&metric=true требуется указывать для метрической системы!
struct WeatherForFiveDays: Codable {
    let weatherForOneDay: [WeatherForOneDay]
    
    init?(_ json: Any) {
        guard let array = json as? [[String: Any]]
        else { return nil }
        
        var weatherForOneDay = [WeatherForOneDay]()
        for day in array {
            guard let extract = WeatherForOneDay(day)
            else { continue }
            weatherForOneDay.append(extract)
        }
        self.weatherForOneDay = weatherForOneDay
    }
}
