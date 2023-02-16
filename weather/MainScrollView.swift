//
//  MainScrollView.swift
//  weather
//
//  Created by Gennadij Pleshanov on 12.02.2023.
//

import UIKit

class MainScrollView: UIScrollView {
    
    private let viewHeight: CGFloat = 1500
    private lazy var contentView = UIView()
    
    private lazy var labelWithCity: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 87/255,
                                          green: 84/255,
                                          blue: 86/255,
                                          alpha: 1)

        label.font = UIFont(name: "Spektra-CondensedBold", size: 40)
        label.text = "хабаровск"
        return label
    }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.tintColor = UIColor(red: 87/255,
                                   green: 84/255,
                                   blue: 86/255,
                                   alpha: 1)
        button.setImage(UIImage(systemName: "line.3.horizontal"),
                        for: .normal)
        button.addTarget(self,
                         action: #selector(pushMenuButton),
                         for: .touchUpInside)
        
        return button
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white

        label.font = UIFont(name: "Spektra-CondensedBold", size: 90)
//        label.text = "-15°"
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = 1.2
        
        let attributes = [NSAttributedString.Key.paragraphStyle: style]
        label.attributedText = NSAttributedString(string: "-15°",
                                                  attributes: attributes)
        return label
    }()
    
    private lazy var weatherLabel: UILabel = {

        let label = UILabel()
        label.textColor = .white

        label.font = UIFont(name: "Spektra-CondensedBold", size: 20)
        label.text = "тепло и солнечно"
        return label
    }()
    
    private lazy var labelWithWind: UILabel = {
        let label = UILabel()
        label.textColor = .white

        label.font = UIFont(name: "Spektra-CondensedBold", size: 40)
//        label.text = "ветра нет"
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = 0.8
        
        let attributes = [NSAttributedString.Key.paragraphStyle: style]
        label.attributedText = NSAttributedString(string: "ветра нет",
                                                  attributes: attributes)
        return label
    }()
    
    private lazy var cityAndMenuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.addArrangedSubview(labelWithCity)
        stackView.addArrangedSubview(menuButton)
        return stackView
    }()
    
    private lazy var weatherConditionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.addArrangedSubview(weatherLabel)
        stackView.addArrangedSubview(labelWithWind)
        return stackView
    }()
    
    private lazy var temperatureAndWeatherConditionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(weatherConditionsStackView)
        return stackView
    }()
    
    private lazy var whiteRoundedView: UIView = {
        let view = WhiteRoundedView(frame: CGRect(),
                                    ellipseHeight: viewHeight)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addToScrollView()
        addToContentView()
        addConstraint()

        self.contentSize = contentView.bounds.size
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addToScrollView() {
        addSubview(contentView)
    }
    
    private func addToContentView() {
        contentView.addSubview(cityAndMenuStackView)
        contentView.addSubview(temperatureAndWeatherConditionsStackView)
        contentView.addSubview(whiteRoundedView)
    }
    
    private func addConstraint() {
//        self.safeAreaLayoutGuide.topAnchor

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        cityAndMenuStackView.translatesAutoresizingMaskIntoConstraints = false
        cityAndMenuStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        cityAndMenuStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        cityAndMenuStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        cityAndMenuStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        cityAndMenuStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

        temperatureAndWeatherConditionsStackView.translatesAutoresizingMaskIntoConstraints = false
        temperatureAndWeatherConditionsStackView.topAnchor.constraint(equalTo: cityAndMenuStackView.bottomAnchor, constant: 10).isActive = true
        temperatureAndWeatherConditionsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        temperatureAndWeatherConditionsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        temperatureAndWeatherConditionsStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        temperatureAndWeatherConditionsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

        whiteRoundedView.translatesAutoresizingMaskIntoConstraints = false
        whiteRoundedView.topAnchor.constraint(equalTo: temperatureAndWeatherConditionsStackView.bottomAnchor, constant: 30).isActive = true
        whiteRoundedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        whiteRoundedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        whiteRoundedView.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        whiteRoundedView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        whiteRoundedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
    }
    
    @IBAction func pushMenuButton(_ sender: UIButton) {
        print("push menu button")
    }

}
