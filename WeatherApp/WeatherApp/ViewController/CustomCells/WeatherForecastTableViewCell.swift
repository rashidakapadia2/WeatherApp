//
//  WeatherForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Neosoft on 18/10/23.
//

import UIKit

class WeatherForecastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var humidityAndPressureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        weatherImageView.discardImage()
    }
    
    private func setupUI() {
        containerView.layer.cornerRadius = 10
        setupLabels()
    }
    
    private func setupLabels() {
        temperatureLabel.textAlignment = .left
        temperatureLabel.textColor = .white
        temperatureLabel.font = .systemFont(ofSize: 38, weight: .bold)
        temperatureLabel.numberOfLines = 1
        
        locationLabel.textAlignment = .left
        locationLabel.textColor = .white
        locationLabel.font = .systemFont(ofSize: 15, weight: .medium)
        locationLabel.numberOfLines = 1
        
        humidityAndPressureLabel.textAlignment = .left
        humidityAndPressureLabel.textColor = .white
        humidityAndPressureLabel.font = .systemFont(ofSize: 12, weight: .medium)
        humidityAndPressureLabel.numberOfLines = 1
        
        windLabel.textAlignment = .center
        windLabel.textColor = .white
        windLabel.font = .systemFont(ofSize: 12, weight: .medium)
        windLabel.numberOfLines = 1
    }
    
    public func configure(with data: Forecastday?, location: String?) {
        guard let data = data else { return }
        DispatchQueue.main.async {
            self.locationLabel.text = location ?? .notApplicable
            self.windLabel.text = data.day?.condition?.text ?? .notApplicable
            
            self.temperatureLabel.text = "\(data.day?.avgtempC ?? 0.0)°C"
            self.humidityAndPressureLabel.text = "H: \(data.day?.avghumidity ?? 0), L: \(data.day?.totalprecipIn ?? 0)"
            
            self.weatherImageView.downloadImage(url: data.day?.condition?.icon)
        }
    }
    
}
