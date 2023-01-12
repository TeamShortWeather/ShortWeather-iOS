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
    private var weatherQuestionList: WeatherQuestionModel?
    
    // MARK: - Properties
    
    private let todayWeather: TodayWeatherResponse = TodayWeatherResponse(location: "", compareTemp: 0, compareMessage: "", breakingNews: "", fineDust: 0, ultrafineDust: 0, day: true, image: "", currentTemp: 0, minTemp: 0, maxTemp: 0, weatherMessage: "")
    let todayWeatherQuestionProvider = MoyaProvider<TodayWeatherService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        setUI()
        setLayout()
        setAddTarget()
        setDelegate()
        fetchWeatherQuestion()
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
            $0.textAlignment = .center
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
        
        bottomArrowImageView.do {
            $0.image = Image.icnExpandDown
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(gradationView, compareTempLabel,
                    compareWeatherLabel, reportCollectionView,
                    weatherImageView, weatherLabel,
                    presentTempLabel, lowestTempLabel,
                    highestTempLabel, todayWeatherLabel,
                    showYesterdayWeatherButton, bottomArrowImageView,
                    yesterdayWeatherLabel)
        
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
            $0.width.equalTo(145)
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
            $0.height.equalTo(65)
        }
        
        showYesterdayWeatherButton.snp.makeConstraints {
            $0.centerY.equalTo(yesterdayWeatherLabel)
            $0.leading.equalToSuperview().offset(28)
            $0.width.height.equalTo(24)
        }
        
        bottomArrowImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(CGFloat(44).adjusted)
            $0.width.height.equalTo(24)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    public func setDataBind(todayWeather: TodayWeatherResponse) {
        compareTempLabel.text = todayWeather.compareTemp.makeToCompareTemp()
        compareWeatherLabel.text = todayWeather.compareMessage
        var weatherType = WeatherType(rawValue: todayWeather.image)
        if todayWeather.day == false {
            if weatherType == .clearDay {
                weatherType = .clearNight
            } else if weatherType == .lotCloudDay {
                weatherType = .lotCloudNight
            }
        }
        weatherImageView.image = weatherType?.setTodayWeatherImage()
        weatherLabel.text = todayWeather.image
        gradationView.image = weatherType?.setBackgroundImage()
        presentTempLabel.text = " " + todayWeather.currentTemp.temperature
        lowestTempLabel.text = todayWeather.minTemp.temperature
        highestTempLabel.text = todayWeather.maxTemp.temperature
        todayWeatherLabel.text = todayWeather.weatherMessage
    }
    
    private func setAddTarget() {
        showYesterdayWeatherButton.addTarget(self, action: #selector(showYesterdayButtonDidTap), for: .touchUpInside)
    }
    
    private func setDelegate() {
        reportCollectionView.delegate = self
        reportCollectionView.dataSource = self
    }
    
    func weatherQuestionDataBind(model: WeatherQuestionModel) {
        yesterdayWeatherLabel.text = "어제는 \((model.temp).temperature)로 \n" + model.weatherMessage
        yesterdayWeatherLabel.asFontColor(targetString: "어제는 \((model.temp).temperature)로", font: .fontGuide(.caption1), color: Color.black)
    }
    
    // MARK: - @objc Methods
    
    @objc private func showYesterdayButtonDidTap() {
        yesterdayWeatherLabel.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            DispatchQueue.main.async { [weak self] in
                self?.yesterdayWeatherLabel.isHidden = true
            }
        })
    }
    
    // MARK: - Network
    
    func fetchWeatherQuestion() {
        todayWeatherQuestionProvider.request(.fetchWeatherQuestion) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                if status >= 200 && status < 300 {
                    do {
                        guard let todayWeatherQuestion = try result.map(GeneralResponse<TodayWeatherQuestionResponse>.self).data else { return }
                        self.weatherQuestionList = todayWeatherQuestion.convertToWeatherQuestion()
                        self.weatherQuestionDataBind(model: self.weatherQuestionList!)
                        print(todayWeatherQuestion)
                        print(todayWeatherQuestion.temp)
                    } catch (let error) {
                        print(error.localizedDescription)
                    }
                }
                else if status >= 400 {
                    print(Letter.requestError)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: - UICollectionViewDataSource

extension FirstTodayWeatherView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if todayWeather.breakingNews?.isEmpty == true {
            return 2
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: ReportCollectionViewCell.self, indexPath: indexPath)
        if todayWeather.breakingNews?.isEmpty == true {
            if indexPath.row == 0 {
                cell.setDustCellBind(dustType: .dust, dustState: DustStateType(rawValue: todayWeather.fineDust) ?? .good)
            } else {
                cell.setDustCellBind(dustType: .fineDust, dustState: DustStateType(rawValue: todayWeather.ultrafineDust) ?? .good)
            }
        } else {
            if indexPath.row == 0 {
                cell.setMainReportCellData(reportType: Report(rawValue: todayWeather.breakingNews ?? "폭염특보")!.setReportType(), mainReport: todayWeather.breakingNews ?? "")
            } else if indexPath.row == 1 {
                cell.setDustCellBind(dustType: .dust, dustState: DustStateType(rawValue: todayWeather.fineDust) ?? .good)
            } else {
                cell.setDustCellBind(dustType: .dust, dustState: DustStateType(rawValue: todayWeather.ultrafineDust) ?? .good)
            }
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension FirstTodayWeatherView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueCell(type: ReportCollectionViewCell.self, indexPath: indexPath)
        if todayWeather.breakingNews?.isEmpty == true {
            if indexPath.row == 0 {
                return cell.adjustCellSize(label: Letter.dust)
            } else {
                return cell.adjustCellSize(label: Letter.fineDust)
            }
        } else {
            if indexPath.row == 0 {
                return cell.adjustCellSize(label: todayWeather.breakingNews ?? "폭염특보")
            } else if indexPath.row == 1 {
                return cell.adjustCellSize(label: Letter.dust)
            } else {
                return cell.adjustCellSize(label: Letter.fineDust)
            }
        }
    }
}
