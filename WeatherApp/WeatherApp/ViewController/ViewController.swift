//
//  ViewController.swift
//  WeatherApp
//
//  Created by Neosoft on 17/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var windPressureLbl: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    //MARK: Variables
    var viewModel: CurrentWeatherViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupServices()
        addRedirectionGesture()
    }
    
    func setupServices() {
        viewModel?.fetchCurrentWeather { result in
            switch result {
            case .success(let value):
                self.configure(with: value)
            case .failure(let error):
                print("Failure: \(error.localizedDescription)")
            }
        }
    }
    
    private func addRedirectionGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(weatherViewTapped))
        tapGesture.numberOfTapsRequired = 1
        weatherImageView.isUserInteractionEnabled = true
        weatherImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func weatherViewTapped(_ sender: UITapGestureRecognizer) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController : DetailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let detailsViewmodel = WeatherDetailViewmodel(weatherQ: viewModel?.weatherQ)
        detailsViewController.viewModel = detailsViewmodel
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    private func configure(with data: CurrentWeatherModel?) {
        guard let data = data else { return }
        DispatchQueue.main.async {
            
            self.cityLbl.text = data.location?.country ?? ""
            self.tempLbl.text = "\(data.current?.tempC ?? 0)"
            self.humidityLbl.text = "Humidity Level: \(data.current?.humidity ?? 0)"
            self.windPressureLbl.text = "Wind Pressure: \(data.current?.windMph ?? 0)"
            self.weatherImageView.downloadImage(url: data.current?.condition?.icon)
        }
    }
    
    @IBAction func viewDetailsBtnTapped(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController : DetailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let detailsViewmodel = WeatherDetailViewmodel(weatherQ: viewModel?.weatherQ)
        detailsViewController.viewModel = detailsViewmodel
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}

