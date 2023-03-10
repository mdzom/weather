//
//  StartViewController.swift
//  weather
//
//  Created by Gennadij Pleshanov on 11.02.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    private lazy var nowOnStreetLabel: UILabel = {
        createLabel(text: "сейчас на улице",
                    fontSize: 100)
    }()
    
    private lazy var temperatureLabel: UILabel = {
        createLabel(text: "-15°",
                    fontSize: 130)
    }()
    
    private lazy var weatherLabel: UILabel = {
        createLabel(text: "тепло и солнечно",
                    fontSize: 100)
    }()
    
    private lazy var labelWithWind: UILabel = {
        createLabel(text: "ветра нет",
                    fontSize: 40)
    }()
    
    private lazy var labelWithRecommendations: UILabel = {
        createLabel(text: "идеальная погода для прогулок",
                    fontSize: 60)
    }()
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer(target: self,
                               action: #selector(goToMainScreenByTap))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addToView()
        addConstraint()
        print("@@@")
        
        let net = NetworkService()
//        net.getCityKey(url: "https://dataservice.accuweather.com/locations/v1/cities/search?apikey=nZIYZ40GPI0oZb723LjB1GGaQVEugOIn&q=khabarovsk") { value in
//            DispatchQueue.main.async {
//                print(value)
//                print("here")
//            }
//            
//        }
//        net.getCurrentWeather(url: "https://dataservice.accuweather.com/currentconditions/v1/293149?apikey=nZIYZ40GPI0oZb723LjB1GGaQVEugOIn&details=true") { value in
//            DispatchQueue.main.async {
//                            print(value)
//                            print("here")
//                        }
//        }
        
        net.getWeatherForDay(url: "https://dataservice.accuweather.com/forecasts/v1/hourly/12hour/293149?apikey=nZIYZ40GPI0oZb723LjB1GGaQVEugOIn&metric=true") { value in
            DispatchQueue.main.async {
                            print(value)
                            print("here")
                        }
        }
        
        
    }
    
    private func addToView() {
        view.addSubview(nowOnStreetLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(weatherLabel)
        view.addSubview(labelWithWind)
        view.addSubview(labelWithRecommendations)
        
        view.addGestureRecognizer(tapRecognizer)
        
//        for family: String in UIFont.familyNames {
//                    print(family)
//                    for names: String in UIFont.fontNames(forFamilyName: family) {
//                        print("== \(names)")
//                    }
//                }
    }
    
    private func addConstraint() {
        
        nowOnStreetLabel.translatesAutoresizingMaskIntoConstraints = false
        nowOnStreetLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nowOnStreetLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        nowOnStreetLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        nowOnStreetLabel.heightAnchor.constraint(equalToConstant: 210).isActive = true
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.topAnchor.constraint(equalTo: nowOnStreetLabel.bottomAnchor).isActive = true
        temperatureLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 175).isActive = true
        
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor).isActive = true
        weatherLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        weatherLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        weatherLabel.heightAnchor.constraint(equalToConstant: 170).isActive = true
        
        labelWithWind.translatesAutoresizingMaskIntoConstraints = false
        labelWithWind.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        labelWithWind.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        labelWithWind.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: -30).isActive = true
        labelWithWind.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        labelWithRecommendations.translatesAutoresizingMaskIntoConstraints = false
        labelWithRecommendations.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        labelWithRecommendations.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        labelWithRecommendations.topAnchor.constraint(equalTo: labelWithWind.bottomAnchor).isActive = true
        labelWithRecommendations.heightAnchor.constraint(equalToConstant: 155).isActive = true
    }
    
    @IBAction func goToMainScreenByTap(_ sender: UITapGestureRecognizer) {
        let controller = MainViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: false)
    }
}



