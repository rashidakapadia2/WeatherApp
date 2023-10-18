//
//  UIImageView+Ext.swift
//  WeatherApp
//
//  Created by Valentine Miranda on 18/10/23.
//

import UIKit

extension UIImageView {
    
    public func downloadImage(url: String?) {
//        Since data is less using this function, In real project asynchronous image downloading should be preferred
        guard let url = url?.generateHTTPURLString(), let downloadURL = URL(string: url) else { return }
        guard let data = try? Data(contentsOf: downloadURL) else { return }
        DispatchQueue.main.async {
            self.image = UIImage(data: data)
        }
    }
    
    public func discardImage() {
        DispatchQueue.main.async {
            self.image = nil
        }
    }
    
}
