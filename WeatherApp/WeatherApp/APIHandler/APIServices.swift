//
//  APIServices.swift
//  WeatherApp
//
//  Created by Neosoft on 17/10/23.
//

import Foundation

typealias AnyDict = [String: Any]
typealias AnyDictString = [String: String]

let DEV_ROOT_POINT = "http://api.weatherapi.com"
let PROD_ROOT_POINT = ""

let contentValue = "application/json"
let contentKey = "Content-Type"

enum NetworkEnvironment: String {
    case development
    case production
}

var networkEnvironment: NetworkEnvironment {
    return .development
}

var BaseURL: String {
    switch networkEnvironment {
    case .development :
        return DEV_ROOT_POINT
    case .production :
        return PROD_ROOT_POINT
    }
}


enum APIServices {
    case current(parameters: AnyDict)
    case forecast(parameters: AnyDict)
}

    extension APIServices {
        var Path: String {
            let version = "/v1/"
            var servicePath: String = ""
            switch self {
            case .current: servicePath = "current.json"
            case .forecast: servicePath = "forecast.json"
            }
            
            return BaseURL + version + servicePath
        }
        var parameters: AnyDict? {
               switch self {
               case .current(parameters: let param), .forecast(let param) :
                   return param
               }
           }
           
           var httpMethod: String {
               switch self {
               default:
                   return "GET"
               }
           }
       }
