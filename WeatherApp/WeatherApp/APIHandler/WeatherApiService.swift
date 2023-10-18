//
//  WeatherApiService.swift
//  WeatherApp
//
//  Created by Neosoft on 17/10/23.
//

import Foundation

func jSONDecoding<T: Decodable>(jSON: Data) -> Result<T,Error>{
    do {
        let jsonDecoder = JSONDecoder()
        let responseData = try jsonDecoder.decode(T.self, from: jSON)
        return .success(responseData)
    } catch let error {
        debugPrint(error.localizedDescription)
        return .failure(error)
    }
}

class WeatherApiService {
    
    private static var lang = "en"
    
    static func currentWeather(weatherQ: String, completion: @escaping(Result<CurrentWeatherModel,CustomErrors>) -> Void) {
        let params = ["q": weatherQ, "lang": lang]
        APIManager.sharedInstance.performRequest(serviceType: .current(parameters: params)){
            (response) in
            switch response {
            case .success(let value):
                if let content = value {
                    do {
                        let responseData = try JSONDecoder().decode(CurrentWeatherModel.self, from: content)
                        completion(.success(responseData))
                    } catch {
                        print(error)
                    }
                }
                else{
                    print("\(String(describing: CustomErrors.noData.errorDescription))")
                }
            case .failure(let error):
                print("In Failure")
                debugPrint(error.localizedDescription)
                print("Wrong pass")
                completion(.failure(CustomErrors.genericErr))
            }
        }
    }
    
    static func forecast(days: Int = 3, weatherQ: String, completion: @escaping(Result<ForecastModel,CustomErrors>) -> Void) {
        let params: [String:Any] = ["q": weatherQ, "days": days, "lang": lang]
        APIManager.sharedInstance.performRequest(serviceType: .forecast(parameters: params)){
            (response) in
            switch response {
            case .success(let value):
                if let content = value {
                    do {
                        let responseData = try JSONDecoder().decode(ForecastModel.self, from: content)
                        completion(.success(responseData))
                    } catch {
                        print(error)
                    }
                }
                else{
                    print("\(String(describing: CustomErrors.noData.errorDescription))")
                }
            case .failure(let error):
                print("In Failure")
                debugPrint(error.localizedDescription)
                print("Wrong pass")
                completion(.failure(CustomErrors.genericErr))
            }
        }
    }
    
}
