//
//  Model.swift
//  WeatherApp
//
//  Created by Neosoft on 17/10/23.
//

import Foundation

// MARK: - CurrentWeatherModel
struct CurrentWeatherModel: Codable {
    let location: Location?
    let current: Current?
}

