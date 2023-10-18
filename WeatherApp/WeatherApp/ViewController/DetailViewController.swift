//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Neosoft on 17/10/23.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var detailTableView: UITableView!
    
    //MARK: Variables
    var viewModel: WeatherDetailViewmodel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupServices()
    }

    private func setupUI() {
        self.view.backgroundColor = UIColor.white
        setupTableview()
    }
    
    func setupTableview() {
        detailTableView.backgroundColor = .clear
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.allowsSelection = false
        detailTableView.separatorStyle = .none
        
        let weatherForecastTableViewCell = UINib(nibName: "WeatherForecastTableViewCell", bundle: nil)
        detailTableView.register(weatherForecastTableViewCell, forCellReuseIdentifier: "WeatherForecastTableViewCell")
    }
    
    func setupServices() {
        viewModel?.fetchWeatherForecast { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.detailTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.forecastCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherForecastTableViewCell", for: indexPath) as? WeatherForecastTableViewCell else { return UITableViewCell() }
        let forecastData = viewModel?.getForecastItem(at: indexPath.row)
        cell.configure(with: forecastData, location: viewModel?.weatherLocation)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
