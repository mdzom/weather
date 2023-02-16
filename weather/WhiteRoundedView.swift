//
//  whiteRoundedView.swift
//  weather
//
//  Created by Gennadij Pleshanov on 12.02.2023.
//

import UIKit

class WhiteRoundedView: UIView {
    
//    var ellipseHeight: CGFloat = 0
    private var ellipseHeight: CGFloat
    
    private let degreeOfRoundness: CGFloat = 200
    private lazy var contentView = UIView()
    
    private lazy var width: CGFloat = {
        UIScreen.main.bounds.width
    }()
    
    private lazy var temperatureDuringDayStackView: UIStackView = {
        //    MARK: изменить на модель
        let stackView = TemperatureDuringDayStackView(frame: CGRect(), model: [-20, -15, -18, -25])
        return stackView
    }()
    
    private lazy var detailedInformationStackView: UIStackView = {
        //    MARK: изменить на модель
        let stackView = DetailedInformationStackView(frame: CGRect(), model: [3, 70, 762, 10])
        return stackView
    }()
    
    private lazy var weeklyForecastView: UIView = {
        let view =  WeeklyForecastView()
        
        
        
        return view
    }()
    
    init(frame: CGRect, ellipseHeight: CGFloat) {
        self.ellipseHeight = ellipseHeight
        super.init(frame: frame)
        self.backgroundColor = .white
        addToView()
        addToContentView()
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let ellipseRect = CGRect(x: -degreeOfRoundness,
                                 y: (bounds.height - ellipseHeight) / 2,
                                 width: bounds.width + degreeOfRoundness * 2,
                                 height: ellipseHeight)

        let path = UIBezierPath(roundedRect: ellipseRect,
                                cornerRadius: ellipseRect.height / 2)
        let topCurveRect = CGRect(x: ellipseRect.midX ,
                                  y: ellipseRect.minY, width: 2, height: 2)
        let bottomCurveRect = CGRect(x: ellipseRect.midX,
                                     y: ellipseRect.maxY, width: 2, height: 2)

        let topCurvePath = UIBezierPath(arcCenter: CGPoint(x: topCurveRect.midX,
                                                           y: topCurveRect.midY),
                                        radius: topCurveRect.height / 2,
                                        startAngle: .pi,
                                        endAngle: 0,
                                        clockwise: true)
        
        let bottomCurvePath = UIBezierPath(arcCenter: CGPoint(x: bottomCurveRect.midX,
                                                              y: bottomCurveRect.midY),
                                           radius: bottomCurveRect.height / 2,
                                           startAngle: 0,
                                           endAngle: .pi,
                                           clockwise: true)
        path.append(topCurvePath)
        path.append(bottomCurvePath)
        path.close()

        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: ellipseHeight)
    }
    
    private func addToView() {
        addSubview(contentView)
    }
    
    private func addToContentView() {
        contentView.addSubview(temperatureDuringDayStackView)
        contentView.addSubview(detailedInformationStackView)
        contentView.addSubview(weeklyForecastView)
    }
    
    private func addConstraint() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: width).isActive = true
//        MARK: поправить высоту!!!!!!
        contentView.heightAnchor.constraint(equalToConstant: 1350).isActive = true
        
        
        temperatureDuringDayStackView.translatesAutoresizingMaskIntoConstraints = false
        temperatureDuringDayStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        temperatureDuringDayStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        temperatureDuringDayStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        temperatureDuringDayStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        cityAndMenuStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        
        detailedInformationStackView.translatesAutoresizingMaskIntoConstraints = false
        detailedInformationStackView.topAnchor.constraint(equalTo: temperatureDuringDayStackView.bottomAnchor, constant: 16).isActive = true
        detailedInformationStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        detailedInformationStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        detailedInformationStackView.heightAnchor.constraint(equalTo: detailedInformationStackView.widthAnchor).isActive = true
        
        
        
        weeklyForecastView.translatesAutoresizingMaskIntoConstraints = false
        weeklyForecastView.topAnchor.constraint(equalTo: detailedInformationStackView.bottomAnchor, constant: 30).isActive = true
        weeklyForecastView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        weeklyForecastView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        weeklyForecastView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
    }
}

