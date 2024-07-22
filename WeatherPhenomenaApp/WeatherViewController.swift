//
//  WeatherViewController.swift
//  WeatherPhenomenaApp
//
//  Created by Ariuna Banzarkhanova on 20/07/24.
//

import UIKit

class WeatherViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView!
    private var weatherDetailView: UIView!
    private var selectedWeatherIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupCollectionView()
        setupWeatherDetailView()
        
        selectedWeatherIndex = Int.random(in: 0..<Weather.weatherTypes.count)
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            if let index = selectedWeatherIndex {
                selectWeather(at: index)
            }
        }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(WeatherCell.self, forCellWithReuseIdentifier: WeatherCell.identifier)
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupWeatherDetailView() {
        weatherDetailView = UIView()
        weatherDetailView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weatherDetailView)
        
        NSLayoutConstraint.activate([
            weatherDetailView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            weatherDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func selectWeather(at index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        updateWeatherDetailView(for: index)
        scrollToWeather(at: index)
    }
    
    private func scrollToWeather(at index: Int) {
            let indexPath = IndexPath(item: index, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    
    private func updateWeatherDetailView(for index: Int) {
        weatherDetailView.subviews.forEach { $0.removeFromSuperview() }
        
        let weather = Weather.weatherTypes[index]
        
        let iconImageView = UIImageView(image: UIImage(systemName: weather.icon))
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .black
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.text = weather.type
        
        weatherDetailView.addSubview(iconImageView)
        weatherDetailView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: weatherDetailView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: weatherDetailView.centerYAnchor, constant: -50),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: weatherDetailView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: weatherDetailView.trailingAnchor, constant: -20)
        ])
        
        UIView.transition(with: weatherDetailView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.weatherDetailView.addSubview(iconImageView)
            self.weatherDetailView.addSubview(titleLabel)
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Weather.weatherTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCell.identifier, for: indexPath) as! WeatherCell
        let weather = Weather.weatherTypes[indexPath.item]
        cell.configure(with: weather.type, iconName: weather.icon)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateWeatherDetailView(for: indexPath.item)
        scrollToWeather(at: indexPath.item)
    }
    
}
