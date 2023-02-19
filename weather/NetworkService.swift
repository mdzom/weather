//
//  NetworkService.swift
//  weather
//
//  Created by Gennadij Pleshanov on 16.02.2023.
//

import Foundation

struct NetworkService {
    
    func getCityKey(url: String, completion: @escaping(CityName) -> ()) {
        guard let url = encodedString(url) else { return }
        getJSON(url) { json in
            let response = CityName(json)
            guard let unwrapResponse = response else { return }
            completion(unwrapResponse)
        }
    }
    
    func getCurrentWeather(url: String, completion: @escaping(CurrentWeather) -> ()) {
        guard let url = encodedString(url) else { return }
        getJSON(url) { json in
            let response = CurrentWeather(json)
            guard let unwrapResponse = response else { return }
            completion(unwrapResponse)
        }
    }
    
    func getWeatherForDay(url: String, completion: @escaping(WeatherForDay) -> ()) {
        guard let url = encodedString(url) else { return }
        getJSON(url) { json in
            let response = WeatherForDay(json)
            guard let unwrapResponse = response else { return }
            completion(unwrapResponse)
        }
    }
    
//    func getAForecastForFiveDays(url: String, completion: @escaping(WeatherForFiveDays) -> ()) {
//        guard let url = encodedString(url) else { return }
//        getJSON(url) { json in
//            let response = WeatherForFiveDays(json)
//            guard let unwrapResponse = response else { return }
//            completion(unwrapResponse)
//        }
//    }
    
    
    
    
    private func getJSON(_ url: URL, completion: @escaping(Any) -> ()) {
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                completion(json)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    private func encodedString(_ url: String) -> URL? {
        guard let encodedString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedString) else {
            return nil
        }
        return url
    }
    
    
    
//    func loadImage(data: String, complete: @escaping (Data) -> ()) {
//        guard let url = URL(string: data) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, responce, error in
//            guard let data = data else { return }
//            complete(data)
//        }.resume()
//    }
}


//поиск города, возвращает код города:
//https://dataservice.accuweather.com/locations/v1/cities/search?apikey=nZIYZ40GPI0oZb723LjB1GGaQVEugOIn&q=ГОРОДилиЛОКАЦИЯ


//погода на день:
//https://dataservice.accuweather.com/currentconditions/v1/Код_городА?apikey=nZIYZ40GPI0oZb723LjB1GGaQVEugOIn&details=true

//погода на день по часам на 12 час
//https://dataservice.accuweather.com/forecasts/v1/hourly/12hour/Код_городА?apikey=nZIYZ40GPI0oZb723LjB1GGaQVEugOIn&metric=true


//погода на 5 дней:
//https://dataservice.accuweather.com/forecasts/v1/daily/5day/Код_городА?apikey=nZIYZ40GPI0oZb723LjB1GGaQVEugOIn&details=true





// возвращать температуру в градусах Цельсия. это добавить в конце
//&metric=true


//(key: "293149")


//https://dataservice.accuweather.com/forecasts/v1/hourly/12hour/293149?apikey=nZIYZ40GPI0oZb723LjB1GGaQVEugOIn&metric=true





