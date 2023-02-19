//
//  WeatherForDay.swift
//  weather
//
//  Created by Gennadij Pleshanov on 17.02.2023.
//

import Foundation

//&metric=true требуется указывать для метрической системы!
struct WeatherForDay: Codable {
    let weather: [WeatherForAnHour]
    
    init?(_ json: Any) {
        guard let array = json as? [[String: Any]]
        else { return nil }
        
        var weather = [WeatherForAnHour]()
        for hour in array {
            guard let extract = WeatherForAnHour(hour)
            else { continue }
            weather.append(extract)
        }
        self.weather = weather
    }
}
