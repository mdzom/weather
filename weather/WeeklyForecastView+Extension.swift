//
//  WeeklyForecastView+Extension.swift
//  weather
//
//  Created by Gennadij Pleshanov on 16.02.2023.
//

import UIKit

extension WeeklyForecastView: UITableViewDelegate {}

extension WeeklyForecastView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? WeeklyForecastTableViewCell else {
            return UITableViewCell()
        }
//        let cellViewModel = viewModel?.createCellViewModel(for: indexPath)
//        cell.viewModel = cellViewModel
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let controller = NewsDetailsViewController()
//        controller.viewModel = viewModel?.createNewsDetailsViewModel(for: indexPath)
//        viewModel?.increaseViewCount(for: indexPath)
//        tableView.reloadData()
//        navigationController?.pushViewController(controller, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
