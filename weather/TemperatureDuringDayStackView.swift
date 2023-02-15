//
//  TemperatureDuringDayStackView.swift
//  weather
//
//  Created by Gennadij Pleshanov on 15.02.2023.
//

import UIKit

class TemperatureDuringDayStackView: UIStackView {
//    MARK: изменить на модель
    private var model: [Int]
    
    init(frame: CGRect, model: [Int]) {
        self.model = model
        super.init(frame: frame)
        axis = .horizontal
        distribution = .fillEqually
        alignment = .center
        
        for value in model {
            let view = createTemperatureThroughoutDay(timesOfDay: "String",
                                                      temperature: "\(value)°")
            addArrangedSubview(view)
        }
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createTemperatureThroughoutDay(timesOfDay: String, temperature: String) -> UIStackView {
        let timesOfDayLabel = UILabel()
        timesOfDayLabel.textColor = .black
        timesOfDayLabel.font = UIFont(name: "Spektra-CondensedBold", size: 30)
        timesOfDayLabel.text = timesOfDay
        
        let temperatureLabel = UILabel()
        temperatureLabel.textColor = .black
        temperatureLabel.font = UIFont(name: "Spektra-CondensedBold", size: 35)
        temperatureLabel.text = temperature
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        stackView.addArrangedSubview(timesOfDayLabel)
        stackView.addArrangedSubview(temperatureLabel)
        return stackView
    }
    
}
