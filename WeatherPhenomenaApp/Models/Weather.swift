//
//  Weather.swift
//  WeatherPhenomenaApp
//
//  Created by Ariuna Banzarkhanova on 22/07/24.
//

import Foundation

struct Weather {
    var type: String
    var icon: String
    var imageName: String
    
    static var weatherTypes: [Weather] = [
        Weather(type: NSLocalizedString("Clear", comment: ""), icon: "sun.max.fill", imageName: "clear"),
        Weather(type: NSLocalizedString("Rain", comment: ""), icon: "cloud.rain.fill", imageName: "rain"),
        Weather(type: NSLocalizedString("Thunderstorm", comment: ""), icon: "cloud.bolt.rain.fill", imageName: "thunderstorm"),
        Weather(type: NSLocalizedString("Snow", comment: ""), icon: "snow", imageName: "snow"),
        Weather(type: NSLocalizedString("Cloudy", comment: ""), icon: "cloud.fill", imageName: "cloudy"),
        Weather(type: NSLocalizedString("Wind", comment: ""), icon: "wind", imageName: "wind")
    ]
}
