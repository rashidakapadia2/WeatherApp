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
    var viewModel = CommonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        let foodMenuTableViewCell = UINib(nibName: "FoodMenuTableViewCell", bundle: nil)
        detailTableView.register(foodMenuTableViewCell, forCellReuseIdentifier: "FoodMenuTableViewCell")
        viewModel.fetchWeatherForecast { result in
            switch result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodMenuTableViewCell", for: indexPath) as? DetailTableViewCell
        cell?.setupData()
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
}
