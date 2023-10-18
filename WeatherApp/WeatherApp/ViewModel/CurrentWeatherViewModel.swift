//
//  CommonViewModel.swift
//  WeatherApp
//
//  Created by Neosoft on 17/10/23.
//

import Foundation

protocol CurrentWeatherViewModelProtocol {
    func fetchCurrentWeather(completion: @escaping(Result<CurrentWeatherModel,CustomErrors>) -> Void)
}

class CurrentWeatherViewModel: CurrentWeatherViewModelProtocol {
    
    public var weatherQ: String? = "48.8567,2.3508"
    var currentWeatherModel: CurrentWeatherModel?
    var weatherForecastModel: ForecastModel?
    
    func fetchCurrentWeather(completion: @escaping(Result<CurrentWeatherModel,CustomErrors>) -> Void) {
        
        guard let weatherQ = weatherQ else {
            completion(.failure(.genericErr))
            return
        }
        
        WeatherApiService.currentWeather(weatherQ: weatherQ) { result in
            switch result {
            case .success(let value):
                self.currentWeatherModel = value
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    

}
