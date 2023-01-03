//
//  SecondTodayWeatherView.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/02.
//

import UIKit

import SnapKit
import Then

class SecondTodayWeatherView: UIView {
    
    // MARK: - UI Components
    
    private lazy var weatherTableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        registerCell()
    }
    
    required init?(coder: NSCoder) { 
        super.init(coder: coder)
    }
}

extension SecondTodayWeatherView {
    
    // MARK: - UI Components
    
    private func setUI() {
        self.backgroundColor = .white
        
        weatherTableView.do {
            $0.backgroundColor = .yellow
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            
            $0.delegate = self
            $0.dataSource = self
        }
    }
     
    // MARK: - Layout Helepr
    
    private func setLayout() {
        self.addSubviews(weatherTableView)
        
        weatherTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func registerCell() {
        weatherTableView.register(CommuteTableViewCell.self, forCellReuseIdentifier: CommuteTableViewCell.identifier)
    }
}

// MARK: - UITableViewDataSource

extension SecondTodayWeatherView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case CellType.commute.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CommuteTableViewCell.identifier, for: indexPath) as? CommuteTableViewCell else { return UITableViewCell() }
            return cell
        case CellType.time.rawValue:
            return UITableViewCell()
        case CellType.today.rawValue:
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension SecondTodayWeatherView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case CellType.commute.rawValue:
            return 236
        case CellType.time.rawValue:
            return 400
        case CellType.today.rawValue:
            return 400
        default:
            return 400
        }
    }
}