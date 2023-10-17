//
//  CommonViewModel.swift
//  WeatherApp
//
//  Created by Neosoft on 17/10/23.
//

import Foundation

protocol CommonViewModelProtocol {
    
}

class CommonViewModel {
    
    var currentWeatherModel: CurrentWeatherModel?
    var weatherForecastModel: ForecastModel?
    
    func fetchCurrentWeather(completion: @escaping(Result<CurrentWeatherModel,CustomErrors>) -> Void)  {
        WeatherApiService.currentWeather(weatherQ: "48.8567,2.3508") { result in
            switch result {
            case .success(let value):
                self.currentWeatherModel = value
                completion(.success(value))
            case .failure(_): break
            }
        }
    }
    
    func fetchWeatherForecast(completion: @escaping(Result<ForecastModel,CustomErrors>) -> Void)  {
        WeatherApiService.forecast(weatherQ: "48.8567,2.3508") { result in
            switch result {
            case .success(let value):
                self.weatherForecastModel = value
                completion(.success(value))
            case .failure(_):
                break
            }
        }
    }
}
