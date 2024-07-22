//
//  WeatherCollectionView.swift
//  WeatherPhenomenaApp
//
//  Created by Ariuna Banzarkhanova on 23/07/24.
//

import UIKit

class WeatherCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var weatherData: [Weather] = Weather.weatherTypes
    var didSelectWeather: ((Int) -> Void)?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.dataSource = self
        self.delegate = self
        self.showsHorizontalScrollIndicator = false
        self.register(WeatherCellView.self, forCellWithReuseIdentifier: WeatherCellView.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCellView.identifier, for: indexPath) as! WeatherCellView
        let weather = weatherData[indexPath.item]
        cell.configure(with: weather.type, iconName: weather.icon)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectWeather?(indexPath.item)
    }
    
    func scrollToWeather(at index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        self.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
