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
    
    static func currentWeather(weatherQ: String, completion: @escaping(Result<CurrentWeatherModel,CustomErrors>) -> Void) {
        let params = ["q": weatherQ, "lang": "en"]
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
    
    static func forecast(weatherQ: String, completion: @escaping(Result<ForecastModel,CustomErrors>) -> Void) {
        let params: [String:Any] = ["q": weatherQ, "days": 7, "lang": "en"]
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
