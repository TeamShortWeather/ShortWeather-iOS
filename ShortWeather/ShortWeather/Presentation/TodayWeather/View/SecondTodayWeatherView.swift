//
//  SecondTodayWeatherView.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/02.
//

import UIKit

import SnapKit
import Then

final class SecondTodayWeatherView: UIView {
    
    // MARK: - UI Components
    
    private lazy var weatherTableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) { 
        super.init(coder: coder)
    }
}

extension SecondTodayWeatherView {
    
    // MARK: - UI Components
    
    private func setUI() {
        backgroundColor = .blue
        
        weatherTableView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
            $0.registerCell(CommuteTableViewCell.self)
            $0.registerCell(TimeTableViewCell.self)
            $0.registerCell(TodayTableViewCell.self)
        }
    }
     
    // MARK: - Layout Helepr
    
    private func setLayout() {
        addSubviews(weatherTableView)
        
        weatherTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource

extension SecondTodayWeatherView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case WeatherTableViewCellType.commute.rawValue:
            let cell = tableView.dequeueCell(type: CommuteTableViewCell.self, indexPath: indexPath)
            return cell
        case WeatherTableViewCellType.time.rawValue:
            let cell = tableView.dequeueCell(type: TimeTableViewCell.self, indexPath: indexPath)
            return cell
        case WeatherTableViewCellType.today.rawValue:
            let cell = tableView.dequeueCell(type: TodayTableViewCell.self, indexPath: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension SecondTodayWeatherView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case WeatherTableViewCellType.commute.rawValue:
            return 225
        case WeatherTableViewCellType.time.rawValue:
            return 199
        case WeatherTableViewCellType.today.rawValue:
            return 450
        default:
            return CGFloat()
        }
    }
}
