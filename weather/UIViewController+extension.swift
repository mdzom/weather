//
//  UIViewController+extension.swift
//  weather
//
//  Created by Gennadij Pleshanov on 12.02.2023.
//

import UIKit

extension UIViewController {
    func createLabel(text: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
//        label.font = UIFont(name: "ArialHebrew", size: fontSize)
        label.font = UIFont(name: "Spektra-CondensedBold", size: fontSize)
        
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = 0.7
        
        let attributes = [NSAttributedString.Key.paragraphStyle: style]
        label.attributedText = NSAttributedString(string: text,
                                                  attributes: attributes)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
