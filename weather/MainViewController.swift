//
//  MainViewController.swift
//  weather
//
//  Created by Gennadij Pleshanov on 12.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = MainScrollView()
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToView()
        addConstraint()
    }
    
    private func addToView() {
        view.addSubview(scrollView)
    }
    
    private func addConstraint() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
