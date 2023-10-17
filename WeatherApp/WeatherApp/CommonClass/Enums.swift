//
//  Enums.swift
//  WeatherApp
//
//  Created by Neosoft on 17/10/23.
//

import Foundation
import UIKit

enum WeatherImages: String {
    case sunny
    case rainy
    case cloudy
    case thunderstorm
    case humidity
    case light_precipitation
    case sun_rain_cloudy
    case partly_cloudy
    case wind
    
    var text: String {
        switch self {
        case .sunny:
            return "sun.max.fill"
        case .light_precipitation:
            return "sun.rain.fill"
        case .rainy:
            return "cloud.rain.fill"
        case .cloudy:
            return "cloud.fill"
        case .thunderstorm:
            return "cloud.bolt.rain.fill"
        case .humidity:
            return "humidity.fill"
        case .sun_rain_cloudy:
            return "cloud.sun.rain.fill"
        case .partly_cloudy:
            return "cloud.sun.fill"
        case .wind:
            return "wind"
        }
        
        func createImageWithText() -> UIImage {
            let largeConfiguration = UIImage.SymbolConfiguration(scale: .large)
            return UIImage(systemName: text, withConfiguration: largeConfiguration)!
        }
    }
    
    
}
