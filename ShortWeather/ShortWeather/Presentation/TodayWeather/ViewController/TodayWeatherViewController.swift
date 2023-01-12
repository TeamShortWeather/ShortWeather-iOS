//
//  TodayWeatherViewController.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/04.
//

import UIKit

import Moya
import SnapKit
import Then

final class TodayWeatherViewController: BaseLocationViewController {
    
    // MARK: - Properties
    
    private var todayWeather: TodayWeatherResponse = TodayWeatherResponse(location: "", compareTemp: 0, compareMessage: "", breakingNews: "", fineDust: 0, ultrafineDust: 0, day: true, image: "", currentTemp: 0, minTemp: 0, maxTemp: 0, weatherMessage: "")
    private let todayWeatherProvider = MoyaProvider<TodayWeatherService>(plugins: [NetworkLoggerPlugin()])
    
    // MARK: - Initializer
    
    init() {
        super.init(nibName: nil, bundle: nil)
        fetchWeather()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRegister()
        setDelegate()
        fetchWeather()
    }
}

extension TodayWeatherViewController {
    
    // MARK: - Methods
    
    private func setRegister() {
        locationCollectionView.registerCell(TodayWeatherCollectionViewCell.self)
    }
    
    private func setDelegate() {
        locationCollectionView.dataSource = self
    }
    
    private func fetchWeather() {
        print("오늘날씨 서버 통신해보자!")
        todayWeatherProvider.request(.fetchWeather) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                if status >= 200 && status<300 {
                    do{
                        guard let data = try result.map(GeneralResponse<TodayWeatherResponse>.self).data else {
                            return
                        }
                        self.locationView.locationLabel.text = data.location
                        self.todayWeather = data
                        self.locationCollectionView.reloadData()
                    }
                    catch(let error){
                        print("실패!")
                        print(error.localizedDescription)
                    }
                }
                else if status >= 400{
                    print("요청 오류")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension TodayWeatherViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = locationCollectionView.dequeueCell(type: TodayWeatherCollectionViewCell.self, indexPath: indexPath)
        cell.setDataBind(todayWeather: todayWeather)
        return cell
    }
}
