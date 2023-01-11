//
//  FirstTodayWeatherView.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/04.
//

import UIKit

import Moya
import SnapKit
import Then

final class FirstTodayWeatherView: UIView {

    // MARK: - UI Components
    
    private let compareTempLabel: UILabel = UILabel()
    private let compareWeatherLabel: UILabel = UILabel()
    private let reportCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private let weatherImageView: UIImageView = UIImageView()
    private let weatherLabel: UILabel = UILabel()
    private let gradationView: UIImageView = UIImageView()
    private let lowestTempLabel: UILabel = UILabel()
    private let presentTempLabel: UILabel = UILabel()
    private let highestTempLabel: UILabel = UILabel()
    private let todayWeatherLabel: PaddingLabel = PaddingLabel(topInset: 8, bottomInset: 8, leftInset: 22, rightInset: 22)
    private let yesterdayWeatherLabel: PaddingLabel = PaddingLabel(topInset: 12, bottomInset: 12, leftInset: 20, rightInset: 20)
    private let showYesterdayWeatherButton: UIButton = UIButton()
    private let bottomArrowImageView: UIImageView = UIImageView()
    
    
    // MARK: - Properties
    
    private let firstTodayWeather: FirstTodayWeatherData
    var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI1LCJpYXQiOjE2NzM0MjQxMzEsImV4cCI6MTY3MzUxMDUzMX0.funiySHoTL1xpPBaUcUBn80eNMnKSwqXCpwsANwYCEc"
    let todayWeatherProvider = MoyaProvider<TodayWeatherService>(
        plugins: [NetworkLoggerPlugin(verbose: true)]
    )
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        self.firstTodayWeather = FirstTodayWeatherData.dumyData()
        super.init(frame: frame)
        setUI()
        setLayout()
        setDataBind()
        setAddTarget()
        setDelegate()
        fetchWeather()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirstTodayWeatherView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        compareTempLabel.do {
            $0.textColor = Color.gray7
            $0.font = .fontGuide(.subhead2)
        }
        
        compareWeatherLabel.do {
            $0.textColor = Color.black
            $0.font = .fontGuide(.display1)
        }
        
        reportCollectionView.do {
            $0.registerCell(ReportCollectionViewCell.self)
        }
        
        gradationView.do {
            $0.contentMode = .scaleToFill
        }
        
        weatherImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        weatherLabel.do {
            $0.textColor = Color.gray5
            $0.font = .fontGuide(.caption1)
        }
        
        presentTempLabel.do {
            $0.textColor = Color.black
            $0.font = .fontGuide(.weather1)
        }
        
        lowestTempLabel.do {
            $0.textColor = Color.pointColor
            $0.font = .fontGuide(.weather2)
        }
        highestTempLabel.do {
            $0.textColor = .red
            $0.font = .fontGuide(.weather2)
        }
        
        todayWeatherLabel.do {
            $0.textColor = Color.black
            $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.45)
            $0.layer.cornerRadius = 20
            $0.clipsToBounds = true
            $0.layer.borderWidth = 1.5
            $0.layer.borderColor = Color.white.cgColor
        }
        
        showYesterdayWeatherButton.do {
            $0.contentMode = .scaleAspectFit
            $0.setImage(Image.icnDrawer, for: .normal)
        }
        
        yesterdayWeatherLabel.do {
            $0.textColor = Color.pointColor
            $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)
            $0.layer.cornerRadius = 30
            $0.font = .fontGuide(.subhead2)
            $0.numberOfLines = 2
            $0.clipsToBounds = true
            $0.isHidden = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(gradationView, compareTempLabel,
                    compareWeatherLabel, reportCollectionView,
                    weatherImageView, weatherLabel,
                    presentTempLabel, lowestTempLabel,
                    highestTempLabel, todayWeatherLabel,
                    showYesterdayWeatherButton, yesterdayWeatherLabel,
                    bottomArrowImageView)
        
        compareTempLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
            $0.height.equalTo(22)
        }
        
        compareWeatherLabel.snp.makeConstraints {
            $0.top.equalTo(compareTempLabel.snp.bottom)
            $0.leading.equalTo(compareTempLabel)
            $0.height.equalTo(41)
        }
        
        reportCollectionView.snp.makeConstraints {
            $0.top.equalTo(compareWeatherLabel.snp.bottom).offset(8)
            $0.leading.equalTo(compareWeatherLabel)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(26)
        }
        
        weatherImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(CGFloat(-100).adjusted)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(CGFloat(208).adjusted)
        }
        
        weatherLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(2)
            $0.centerX.equalToSuperview()
        }
        
        gradationView.snp.makeConstraints {
            $0.top.equalTo(weatherImageView).offset(27)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        presentTempLabel.snp.makeConstraints {
            $0.top.equalTo(weatherLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        lowestTempLabel.snp.makeConstraints {
            $0.centerY.equalTo(presentTempLabel)
            $0.trailing.equalTo(presentTempLabel.snp.leading).offset(-5)
        }
        
        highestTempLabel.snp.makeConstraints {
            $0.centerY.equalTo(presentTempLabel)
            $0.leading.equalTo(presentTempLabel.snp.trailing).offset(5)
        }
        
        todayWeatherLabel.snp.makeConstraints {
            $0.top.equalTo(presentTempLabel.snp.bottom).offset(CGFloat(18).adjusted)
            $0.centerX.equalToSuperview()
        }
        
        yesterdayWeatherLabel.snp.makeConstraints {
            $0.top.equalTo(todayWeatherLabel.snp.bottom).offset(10)
            $0.leading.equalTo(showYesterdayWeatherButton.snp.trailing).offset(10)
            $0.height.equalTo(60)
        }
        
        showYesterdayWeatherButton.snp.makeConstraints {
            $0.centerY.equalTo(yesterdayWeatherLabel)
            $0.leading.equalToSuperview().offset(28)
            $0.width.height.equalTo(24)
        }
        
        bottomArrowImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(CGFloat(44).adjusted)
            $0.width.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    public func setDataBind() {
        compareTempLabel.text = firstTodayWeather.compareTemp
        compareWeatherLabel.text = firstTodayWeather.compareWeather
        weatherImageView.image = firstTodayWeather.weatherImage
        weatherLabel.text = firstTodayWeather.weathehr
        gradationView.image = Image.backViewDay
        presentTempLabel.text = firstTodayWeather.presentTemp
        lowestTempLabel.text = firstTodayWeather.lowestTemp
        highestTempLabel.text = firstTodayWeather.highestTemp
        todayWeatherLabel.text = firstTodayWeather.todayWeather
        yesterdayWeatherLabel.text = firstTodayWeather.yesterdayWeather
        yesterdayWeatherLabel.asFontColor(targetString: "어제 \((-19).temperature)로", font: .fontGuide(.caption1), color: Color.black)
    }
    
    private func setAddTarget() {
        showYesterdayWeatherButton.addTarget(self, action: #selector(showYesterdayButtonDidTap), for: .touchUpInside)
    }
    
    private func setDelegate() {
        reportCollectionView.delegate = self
        reportCollectionView.dataSource = self
    }
    // MARK: - @objc Methods
    
    @objc private func showYesterdayButtonDidTap(){
        yesterdayWeatherLabel.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            DispatchQueue.main.async { [weak self] in
                self?.yesterdayWeatherLabel.isHidden = true
            }
        })
    }
}

extension FirstTodayWeatherView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if firstTodayWeather.mainReportType == .none {
            return 2
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: ReportCollectionViewCell.self, indexPath: indexPath)
        if firstTodayWeather.mainReportType == .none {
            if indexPath.row == 0 {
                cell.setDustCellBind(dustType: .dust, dustState: firstTodayWeather.dustReport)
            } else {
                cell.setDustCellBind(dustType: .fineDust, dustState: firstTodayWeather.fineDustReport)
            }
        } else {
            if indexPath.row == 0 {
                cell.setMainReportCellData(reportType: firstTodayWeather.mainReportType, mainReport: firstTodayWeather.mainReport)
            } else if indexPath.row == 1 {
                cell.setDustCellBind(dustType: .dust, dustState: firstTodayWeather.dustReport)
            } else {
                cell.setDustCellBind(dustType: .fineDust, dustState: firstTodayWeather.fineDustReport)
            }
        }
        return cell
    }
}

extension FirstTodayWeatherView: UICollectionViewDelegate {
}

extension FirstTodayWeatherView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueCell(type: ReportCollectionViewCell.self, indexPath: indexPath)
        if firstTodayWeather.mainReportType == .none {
            if indexPath.row == 0 {
                return cell.adjustCellSize(label: Letter.dust)
            } else {
                return cell.adjustCellSize(label: Letter.fineDust)
            }
        } else {
            if indexPath.row == 0 {
                return cell.adjustCellSize(label: firstTodayWeather.mainReport)
            } else if indexPath.row == 1 {
                return cell.adjustCellSize(label: Letter.dust)
            } else {
                return cell.adjustCellSize(label: Letter.fineDust)
            }
        }
    }
}

extension FirstTodayWeatherView {
    
    func fetchWeather() {
        todayWeatherProvider.request(.fetchWeather) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                if status >= 200 && status < 300 {
                    do {
                        let todayWeather = try result.map(GeneralResponse<TodayWeatherResponse>.self).data!
                        print(todayWeather)
                    } catch (let error){
                        print(error.localizedDescription)
                    }
                }
                if status >= 400 {
                    print("error")
                }
            case .failure(let error):
                print("\n server 안대는 즁~~~")
                print(error.localizedDescription)
            }
        }
    }
}
