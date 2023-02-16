//
//  WeeklyForecastTableViewCell.swift
//  weather
//
//  Created by Gennadij Pleshanov on 16.02.2023.
//

import UIKit

class WeeklyForecastTableViewCell: UITableViewCell {
    
    private lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var dayOfWeekLabel: UILabel = {
        let label = UILabel()
        label.text = "ДЕНЬ"
        label.font = UIFont(name: "Spektra-CondensedBold", size: 30)
        label.textColor = .white
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "15 февраля"
        label.font = UIFont(name: "SpektraFree-CondensedBoldFree", size: 14)
        label.textColor = UIColor(red: 87/255,
                                          green: 84/255,
                                          blue: 86/255,
                                          alpha: 1)
        return label
    }()
    
    private lazy var dayOfWeekAndDateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.addArrangedSubview(dayOfWeekLabel)
        stackView.addArrangedSubview(dateLabel)
        return stackView
    }()
    
    private lazy var weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 40.0)

        imageView.image = UIImage(systemName: "cloud", withConfiguration: imageConfiguration)?.withTintColor(UIColor(red: 87/255,
                                                                                                                     green: 84/255,
                                                                                                                     blue: 86/255,
                                                                                                                     alpha: 1), renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    private lazy var maximumTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Макс"
        label.font = UIFont(name: "SpektraFree-CondensedBoldFree", size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var maximumTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        return label
    }()
    
    private lazy var minimumTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Мин"
        label.font = UIFont(name: "SpektraFree-CondensedBoldFree", size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var minimumTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "-5"
        label.textColor = .white
        return label
    }()
    
    private lazy var maximumStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.addArrangedSubview(maximumTextLabel)
        stackView.addArrangedSubview(maximumTemperatureLabel)
        return stackView
    }()
    
    private lazy var minimumStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.addArrangedSubview(minimumTextLabel)
        stackView.addArrangedSubview(minimumTemperatureLabel)
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 30
        stackView.addArrangedSubview(weatherIconImageView)
        stackView.addArrangedSubview(maximumStackView)
        stackView.addArrangedSubview(minimumStackView)
        return stackView
    }()
    
override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addToView()
        addToBlackView()
        addConstraint()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addToView() {
        addSubview(blackView)
    }
    
    private func addToBlackView() {
        blackView.addSubview(dayOfWeekAndDateStackView)
        blackView.addSubview(mainStackView)
    }
    
    private func addConstraint() {
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        blackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        blackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        
        dayOfWeekAndDateStackView.translatesAutoresizingMaskIntoConstraints = false
        dayOfWeekAndDateStackView.leadingAnchor.constraint(equalTo: blackView.leadingAnchor, constant: 16).isActive = true
        dayOfWeekAndDateStackView.centerYAnchor.constraint(equalTo: blackView.centerYAnchor).isActive = true
        
        
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.trailingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: -16).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: blackView.centerYAnchor).isActive = true
    }
}
