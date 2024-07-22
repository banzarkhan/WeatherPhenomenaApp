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
    
    static var weatherTypes: [Weather] = [
        Weather(type: NSLocalizedString("Clear", comment: ""), icon: "sun.max.fill"),
        Weather(type: NSLocalizedString("Rain", comment: ""), icon: "cloud.rain.fill"),
        Weather(type: NSLocalizedString("Thunderstorm", comment: ""), icon: "cloud.bolt.rain.fill"),
        Weather(type: NSLocalizedString("Fog", comment: ""), icon: "cloud.fog.fill"),
        Weather(type: NSLocalizedString("Snow", comment: ""), icon: "snow"),
        Weather(type: NSLocalizedString("Cloudy", comment: ""), icon: "cloud.fill"),
        Weather(type: NSLocalizedString("Wind", comment: ""), icon: "wind")
    ]
}
