//
//  del.swift
//  weather
//
//  Created by Gennadij Pleshanov on 14.02.2023.
//

import UIKit
class MyView: UIView {
    
//    var bottomGap: CGFloat = 0 // задайте значение для пропуска точек внизу
//
//    override func draw(_ rect: CGRect) {
//
//        // определяем центр вида и радиус для дуги
//        let center = CGPoint(x: bounds.midX,
//                             y: bounds.midY)
//        let radius: CGFloat = min(bounds.width,
//                                  bounds.height)
//
//        // создаем путь и добавляем дугу слева направо
//        let path = UIBezierPath()
//        path.addArc(withCenter: center,
//                    radius: radius,
//                    startAngle: .pi,
//                    endAngle: 0,
//                    clockwise: true)
//
//
//        let bottomRight = CGPoint(x: center.x + radius,
//                                  y: center.y  + bottomGap)
//        let bottomLeft = CGPoint(x: center.x - radius,
//                                 y: center.y + bottomGap)
//        path.addLine(to: bottomRight)
//        path.addQuadCurve(to: bottomLeft,
//                          controlPoint: CGPoint(x: center.x,
//                                                y: center.y + radius + bottomGap))
//
//        // закрываем путь, соединяя последнюю и первую точки
//        path.close()
//
//        // создаем слой формы и устанавливаем путь
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.cgPath
//
//        //        // устанавливаем цвет заполнения и цвет границы
//        shapeLayer.fillColor = UIColor.systemYellow.cgColor
//        shapeLayer.strokeColor = UIColor.black.cgColor
//
//        // добавляем слой формы в слой вида
//        layer.addSublayer(shapeLayer)
//    }
    
    
    

//---------------------
    
    
    
//    private let topBottomCurveRadius: CGFloat = 20
//    private let ellipseHeight: CGFloat = 1000
//
//    override func draw(_ rect: CGRect) {
//        let ellipseRect = CGRect(x: 0, y: (bounds.height - ellipseHeight) / 2, width: bounds.width, height: ellipseHeight)
//
//        let path = UIBezierPath(roundedRect: ellipseRect, cornerRadius: ellipseRect.height / 2)
//        let topCurveRect = CGRect(x: ellipseRect.midX - topBottomCurveRadius, y: ellipseRect.minY - topBottomCurveRadius, width: topBottomCurveRadius * 2, height: topBottomCurveRadius * 2)
//        let bottomCurveRect = CGRect(x: ellipseRect.midX - topBottomCurveRadius, y: ellipseRect.maxY - topBottomCurveRadius, width: topBottomCurveRadius * 2, height: topBottomCurveRadius * 2)
//
//        let topCurvePath = UIBezierPath(arcCenter: CGPoint(x: topCurveRect.midX, y: topCurveRect.midY), radius: topCurveRect.height / 2, startAngle: .pi, endAngle: 0, clockwise: true)
//
//        let bottomCurvePath = UIBezierPath(arcCenter: CGPoint(x: bottomCurveRect.midX, y: bottomCurveRect.midY), radius: bottomCurveRect.height / 2, startAngle: 0, endAngle: .pi, clockwise: true)
//
//        path.append(topCurvePath)
//        path.append(bottomCurvePath)
//        path.close()
//
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        layer.mask = mask
//    }
//
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: UIView.noIntrinsicMetric, height: ellipseHeight)
//    }



    
    
    
    
    
//    private let topBottomCurveRadius: CGFloat = 0
    private let ellipseHeight: CGFloat = 1000

    override func draw(_ rect: CGRect) {
        let ellipseRect = CGRect(x: -200, y: (bounds.height - ellipseHeight) / 2, width: bounds.width + 400, height: ellipseHeight)

        let path = UIBezierPath(roundedRect: ellipseRect, cornerRadius: ellipseRect.height / 2)
        let topCurveRect = CGRect(x: ellipseRect.midX , y: ellipseRect.minY, width: 2, height: 2)
        let bottomCurveRect = CGRect(x: ellipseRect.midX, y: ellipseRect.maxY, width: 2, height: 2)

        let topCurvePath = UIBezierPath(arcCenter: CGPoint(x: topCurveRect.midX, y: topCurveRect.midY), radius: topCurveRect.height / 2, startAngle: .pi, endAngle: 0, clockwise: true)
        
        let bottomCurvePath = UIBezierPath(arcCenter: CGPoint(x: bottomCurveRect.midX, y: bottomCurveRect.midY), radius: bottomCurveRect.height / 2, startAngle: 0, endAngle: .pi, clockwise: true)

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


}
