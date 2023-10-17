//
//  APIManager.swift
//  WeatherApp
//
//  Created by Neosoft on 17/10/23.
//

import Foundation

class APIManager {
    
    static let sharedInstance = APIManager()
    
    private init(){}
    
    public func performRequest(serviceType: APIServices, completionHandler: @escaping(Result<Data?,Error>) -> Void){
        
              //  Reachability to check network connected or not
//                        if !Reachability.isConnectedToNetwork(){
//                            completionHandler(.failure(error: CustomErrors.noInternet))
//                            return
//                        }
        
        
        let session = URLSession.shared
        
        var request = URLRequest(url: URL(string: serviceType.Path)!)
        request.httpMethod = serviceType.httpMethod
        
        if let params = serviceType.parameters{
            if serviceType.httpMethod == "POST"{
                var requestBodyComponents = URLComponents()
                requestBodyComponents.queryItems = params.map{
                    (key, value) in
                    URLQueryItem(name: key, value: String(describing: value))
                }
                request.httpBody = requestBodyComponents.query?.data(using: .utf8)
            }
            else{
                var urlComponents = URLComponents(string: serviceType.Path)
                urlComponents?.queryItems = params.map{
                    (key, value) in
                    URLQueryItem(name: key, value: String(describing: value))
                }
                request.url = urlComponents?.url
            }
        }
        
        
        let task = session.dataTask(with: request as URLRequest){
            data, response, error in
            
            // ensure there is no error for this HTTP response
            if let error = error {
                completionHandler(.failure(error))
                print ("error: \(error)")
                return
            }
            
            // ensure there is data returned from this HTTP response
            guard let content = data else {
                completionHandler(.failure(CustomErrors.noData))
                print("No data")
                return
            }
            
            // serialise the data / NSData object into Dictionary [String : Any]
            guard (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? AnyDict != nil else {
                print("Not containing JSON")
                return
            }
            completionHandler(.success(content))
        }
        task.resume()
    }
}
