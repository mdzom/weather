//
//  CityName.swift
//  weather
//
//  Created by Gennadij Pleshanov on 17.02.2023.
//

import Foundation

struct CityName: Codable {
    let key: String
    
    init?(_ json: Any) {
        guard let array = json as? [[String: Any]],
              let dictionary = array.first,
              let key = dictionary["Key"] as? String else {
            return nil
        }
        self.key = key
    }
}
