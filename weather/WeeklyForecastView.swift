//
//  WeeklyForecastView.swift
//  weather
//
//  Created by Gennadij Pleshanov on 16.02.2023.
//

import UIKit

class WeeklyForecastView: UIView {
    
    let cellIdentifier = "WeeklyForecastCell"
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 87/255,
                                          green: 84/255,
                                          blue: 86/255,
                                          alpha: 1)
        label.textAlignment = .left
        label.font = UIFont(name: "SpektraFree-CondensedBoldFree", size: 16)
        label.text = "Прогноз на 7 дней"
        
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WeeklyForecastTableViewCell.self,
                           forCellReuseIdentifier: cellIdentifier)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addToView()
        addConstraint()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addToView() {
        addSubview(textLabel)
        addSubview(tableView)
    }
    
    private func addConstraint() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
