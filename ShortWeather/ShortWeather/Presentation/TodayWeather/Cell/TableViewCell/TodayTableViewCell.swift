//
//  TodayTableViewCell.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/04.
//

import UIKit

import Moya
import SnapKit
import Then

final class TodayTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let humidityView: UIView = UIView()
    private let humidityTitleLabel: UILabel = UILabel()
    private let humidityImageView: UIImageView = UIImageView()
    private let humidityLabel: UILabel = UILabel()
    private let humidityStateView: UIView = UIView()
    private let sunView: UIView = UIView()
    private let sunTitleLabel: UILabel = UILabel()
    private let sunriseImageView: UIImageView = UIImageView()
    private let sunriseTimeLabel: UILabel = UILabel()
    private lazy var sunriseStackView: UIStackView = UIStackView()
    private let sunsetImageView: UIImageView = UIImageView()
    private let sunsetTimeLabel: UILabel = UILabel()
    private lazy var sunsetStackView: UIStackView = UIStackView()
    private lazy var sunStackView: UIStackView = UIStackView()
    private let dustView: UIView = UIView()
    private let dustTitleLabel: UILabel = UILabel()
    private let dustImageView: UIImageView = UIImageView()
    private let dustStateLabel: UILabel = UILabel()
    private let dustStateView: UIView = UIView()
    private let fineDustView: UIView = UIView()
    private let fineDustTitleLabel: UILabel = UILabel()
    private let fineDustImageView: UIImageView = UIImageView()
    private let fineDustStateLabel: UILabel = UILabel()
    private let fineDustStateView: UIView = UIView()
    private lazy var todayStackView: UIStackView = UIStackView()
    
    // MARK: - Properties
    
    var secondWeatherData: SecondTodayWeather = SecondTodayWeather.dummyData()
    let weatherDetailProvider = MoyaProvider<TodayWeatherDetailService>(
        plugins: [NetworkLoggerPlugin()])

    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
        fetchWeatherDetail()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TodayTableViewCell {
    
    // MARK: - UI Components property
    
    private func setUI() {
        contentView.backgroundColor = .clear
        
        selectionStyle = .none
        
        setTodayView(humidityView, sunView, dustView, fineDustView)
        
        titleLabel.do {
            $0.text = Letter.todayWeatherInfo
            $0.font = .fontGuide(.subhead4)
        }

        humidityView.do {
            $0.backgroundColor = .white
        }
        
        humidityTitleLabel.do {
            $0.text = Letter.humidityInfo
            $0.font = .fontGuide(.subhead2)
        }
        
        humidityImageView.do {
            $0.image = UIImage(named: "icn_humidity")
        }
        
        humidityLabel.do {
            $0.font = .fontGuide(.subhead2)
        }
        
        sunView.do {
            $0.backgroundColor = .white
        }
        
        sunTitleLabel.do {
            $0.text = Letter.sunInfo
            $0.font = .fontGuide(.subhead2)
        }
        
        sunriseImageView.do {
            $0.image = UIImage(named: "icn_sunrise")
        }
        
        sunriseTimeLabel.do {
            $0.text = secondWeatherData.todayWeather.sunrise
            $0.font = .fontGuide(.caption2)
        }
        
        sunsetImageView.do {
            $0.image = UIImage(named: "icn_sunset")
        }
        
        sunsetTimeLabel.do {
            $0.text = secondWeatherData.todayWeather.sunset
            $0.font = .fontGuide(.caption2)
        }
        
        sunriseStackView.do {
            $0.axis = .vertical
            $0.spacing = 6
            $0.alignment = .center
        }
        
        sunsetStackView.do {
            $0.axis = .vertical
            $0.spacing = 6
            $0.alignment = .center
        }
        
        sunStackView.do {
            $0.alignment = .center
            $0.distribution = .fillEqually
            $0.spacing = 14
        }
        
        dustView.do {
            $0.backgroundColor = .white
        }
        
        dustTitleLabel.do {
            $0.text = Letter.dustInfo
            $0.font = .fontGuide(.subhead2)
        }
        
        dustStateLabel.do {
            $0.font = .fontGuide(.subhead2)
        }

        fineDustView.do {
            $0.backgroundColor = .white
        }
        
        fineDustTitleLabel.do {
            $0.text = Letter.fineDustInfo
            $0.font = .fontGuide(.subhead2)
        }
        
        fineDustStateLabel.do {
            $0.font = .fontGuide(.subhead2)
        }
        
        todayStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.spacing = 16
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(titleLabel, todayStackView)
        humidityStateView.addSubviews(humidityImageView, humidityLabel)
        humidityView.addSubviews(humidityTitleLabel, humidityStateView)
        sunView.addSubviews(sunTitleLabel, sunStackView)
        sunriseStackView.addArrangedSubviews(sunriseImageView, sunriseTimeLabel)
        sunsetStackView.addArrangedSubviews(sunsetImageView, sunsetTimeLabel)
        sunStackView.addArrangedSubviews(sunriseStackView, sunsetStackView)
        dustStateView.addSubviews(dustImageView, dustStateLabel)
        dustView.addSubviews(dustTitleLabel, dustStateView)
        fineDustStateView.addSubviews(fineDustImageView, fineDustStateLabel)
        fineDustView.addSubviews(fineDustTitleLabel, fineDustStateView)
        todayStackView.addArrangedSubviews(humidityView, sunView, dustView, fineDustView)
         
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28)
            $0.leading.equalToSuperview().offset(32)
        }
        
        todayStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.bottom.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(28)
            $0.trailing.equalToSuperview().offset(-28)
        }
        
        humidityTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
        
        humidityLabel.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
        }
        
        humidityImageView.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.width.equalTo(humidityImageView.snp.height)
        }
        
        humidityStateView.snp.makeConstraints {
            $0.width.equalTo(82)
            $0.height.equalTo(30)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        sunTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
        
        sunriseImageView.snp.makeConstraints {
            $0.width.height.equalTo(30)
        }
        
        sunsetImageView.snp.makeConstraints {
            $0.width.height.equalTo(30)
        }
        
        sunStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(90)
            $0.height.equalTo(49)
            $0.trailing.equalToSuperview().offset(-26)
        }
        
        dustTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
        
        dustStateLabel.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
        }

        dustImageView.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.width.equalTo(dustImageView.snp.height)
        }
        
        dustStateView.snp.makeConstraints {
            $0.width.equalTo(82)
            $0.height.equalTo(30)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        fineDustTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
        
        fineDustStateLabel.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
        }
        
        fineDustImageView.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.width.equalTo(fineDustImageView.snp.height)
        }
        
        fineDustStateView.snp.makeConstraints {
            $0.width.equalTo(82)
            $0.height.equalTo(30)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30)
        }
    }
    
    // MARK: - Methods
    
    private func setTodayView(_ views: UIView...) {
        views.forEach {
            $0.layer.cornerRadius = 6
            $0.layer.shadowOpacity = 0.1
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowRadius = 6
            $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        }
    }
    
    private func fetchWeatherDetail() {
        weatherDetailProvider.request(.fetchWeatherDetail) { response in
            switch response {
            case .success(let result):
                do {
                    let status = result.statusCode
                    
                    if status >= 200 && status < 300 {
                        guard let data = try result.map(GeneralResponse<DetailWeatherResponse>.self).data else {return}
                        print("💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚")
                        print(data.convertToDetailWeather())
                        self.setDataBind(data.convertToDetailWeather())
                    }
                } catch(let error) {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setDataBind(_ model: SecondTodayWeather) {
        humidityLabel.text = "\(model.todayWeather.humidity)%"
        sunsetTimeLabel.text = model.todayWeather.sunset
        sunriseTimeLabel.text = model.todayWeather.sunrise
        sunsetTimeLabel.text = model.todayWeather.sunset
        dustStateLabel.text = "\(model.todayWeather.fineDust)"
        dustImageView.image = UIImage(named: DustState(rawValue: model.todayWeather.fineDust)?.setDustIcon() ?? "")
        fineDustImageView.image = UIImage(named: DustState(rawValue: model.todayWeather.ultraFineDust)?.setDustIcon() ?? "")
        fineDustStateLabel.text = "\(model.todayWeather.ultraFineDust)"
    }
}
