//
//  WeatherConditions.swift
//  weather
//
//  Created by Gennadij Pleshanov on 17.02.2023.
//

import Foundation

//Temperature / Visibility / Pressure / Speed
struct WeatherConditions: Codable {
    let metric: SystemOfMeasures
    let imperial: SystemOfMeasures
    
    init?(_ dict: [String: Any]) {
        guard let metricDict = dict["Metric"] as? [String: Any],
              let metric = SystemOfMeasures(metricDict),
              let imperialDict = dict["Imperial"] as? [String: Any],
              let imperial = SystemOfMeasures(imperialDict)
        else {
            return nil
        }
        self.metric = metric
        self.imperial = imperial
    }
}
