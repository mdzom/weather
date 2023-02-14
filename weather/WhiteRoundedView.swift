//
//  whiteRoundedView.swift
//  weather
//
//  Created by Gennadij Pleshanov on 12.02.2023.
//

import UIKit

class WhiteRoundedView: UIView {
    
    var ellipseHeight: CGFloat = 0
    
    private let degreeOfRoundness: CGFloat = 200
    private lazy var contentView = UIView()
    
    private lazy var width: CGFloat = {
        UIScreen.main.bounds.width
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addToView()
        addConstraint()
        
        
        contentView.backgroundColor = .red
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
    
    private func addConstraint() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: width).isActive = true
//        MARK: поправить высоту!!!!!!
        contentView.heightAnchor.constraint(equalToConstant: 900).isActive = true
    }
}

