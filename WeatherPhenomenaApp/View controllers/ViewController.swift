//
//  ViewController.swift
//  WeatherPhenomenaApp
//
//  Created by Ariuna Banzarkhanova on 19/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addWeatherViewController()
    }
    
    private func addWeatherViewController() {
        let weatherViewController = WeatherViewController()
        
        addChild(weatherViewController)
        view.addSubview(weatherViewController.view)
        weatherViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        weatherViewController.didMove(toParent: self)
    }
    
}

