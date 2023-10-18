//
//  String+Ext.swift
//  WeatherApp
//
//  Created by Neosoft on 18/10/23.
//

import Foundation

extension String {
    
    static var unknown = "-"
    static var notApplicable = "N/A"
    
    func generateHTTPURLString() -> String {
        if self.hasPrefix("http:") {
            return self
        } else {
            return "http:" + self
        }
    }
    
}
