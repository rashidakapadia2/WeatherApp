//
//  WeatherDetailViewmodel.swift
//  WeatherApp
//
//  Created by Valentine Miranda on 18/10/23.
//

import Foundation

protocol WeatherDetailViewmodelProtocol {
    var weatherLocation: String? { get }
    var forecastCount: Int? { get }
    
    func fetchWeatherForecast(completion: @escaping(Result<ForecastModel,CustomErrors>) -> Void)
    func getForecastItem(at index: Int) -> Forecastday?
}

class WeatherDetailViewmodel: WeatherDetailViewmodelProtocol {
    
    private var weatherQ: String?
    private var days: Int = 3
    
    private var weatherForecastModel: ForecastModel?
    
    public var weatherLocation: String? {
        return weatherForecastModel?.location?.name
    }
    
    public var forecastCount: Int? {
        return weatherForecastModel?.forecast?.forecastday?.count
    }
    
    init(weatherQ: String?) {
        self.weatherQ = weatherQ
    }
    
    func fetchWeatherForecast(completion: @escaping(Result<ForecastModel, CustomErrors>) -> Void)  {
        
        guard let weatherQ = weatherQ else {
            completion(.failure(.genericErr))
            return
        }
        
        WeatherApiService.forecast(days: days, weatherQ: weatherQ) { result in
            switch result {
            case .success(let value):
                self.weatherForecastModel = value
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getForecastItem(at index: Int) -> Forecastday? {
        return weatherForecastModel?.forecast?.forecastday?[index]
    }
    
}
