//
//  DetailedInformationStackView.swift
//  weather
//
//  Created by Gennadij Pleshanov on 15.02.2023.
//

import UIKit

class DetailedInformationStackView: UIStackView {
    //    MARK: изменить на модель
    private var model: [Int]
    private let indent: CGFloat = 16
    
    
    
    init(frame: CGRect, model: [Int]) {
        self.model = model
        super.init(frame: frame)
        axis = .vertical
        distribution = .fillEqually
        spacing = indent
        alignment = .fill
        puttingItAllTogether()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addVerticalStackView(value: Int) -> UIStackView {
        let nameLabel = UILabel()
        nameLabel.textColor = .white
        nameLabel.font = UIFont(name: "Spektra-CondensedBold", size: 30)
        
        let valueLabel = UILabel()
        valueLabel.textColor = .white
        valueLabel.font = UIFont(name: "Spektra-CondensedBold", size: 50)
        
        
        switch value {
        case 1:
            //    MARK: добавлять на правление ветра
            nameLabel.text = "ветер"
            //    MARK: добавлять m/c
            valueLabel.text = "\(model[0])"
        case 2:
    
            nameLabel.text = "влажность"
            //    MARK: добавлять %
            valueLabel.text = "\(model[1])"
        case 3:
     
            nameLabel.text = "давление"
            //    MARK: добавлять мм рт. ст.
            valueLabel.text = "\(model[2])"
        case 4:
            nameLabel.text = "видимость"
            //    MARK: добавлять км
            valueLabel.text = "\(model[3])"
        default:
            print("!!@@@!!!")
        }

        let nestedStackView = UIStackView()
        nestedStackView.axis = .vertical
        nestedStackView.distribution = .fillEqually
        nestedStackView.alignment = .center
        nestedStackView.addArrangedSubview(nameLabel)
        nestedStackView.addArrangedSubview(valueLabel)

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.backgroundColor = .black
        stackView.addArrangedSubview(nestedStackView)
        return stackView
    }
    
    private func createAHorizontalViewStack(first: UIView, second: UIView) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = indent

        stackView.addArrangedSubview(first)
        stackView.addArrangedSubview(second)
        return stackView
    }
    
    private func puttingItAllTogether() {
        let wind = addVerticalStackView(value: 1)
        let humidity = addVerticalStackView(value: 2)
        let pressure = addVerticalStackView(value: 3)
        let visibility = addVerticalStackView(value: 4)
        
        let windAndHumidity = createAHorizontalViewStack(first: wind, second: humidity)
        let pressureAndVisibility = createAHorizontalViewStack(first: pressure, second: visibility)
        
        addArrangedSubview(windAndHumidity)
        addArrangedSubview(pressureAndVisibility)
    }
}
