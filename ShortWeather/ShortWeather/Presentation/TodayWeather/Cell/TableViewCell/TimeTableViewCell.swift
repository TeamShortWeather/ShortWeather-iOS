//
//  TimeTableViewCell.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/03.
//

import UIKit

import SnapKit
import Then

enum HourButton {
    case weather
    case precipitation
}

final class TimeTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let weatherButton: UIButton = UIButton()
    private let precipitationButton: UIButton = UIButton()
    private lazy var buttonStackView: UIStackView = UIStackView()
    private let hourCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    // MARK: - Properties
    
    var hourButtonState: HourButton = .weather
    
    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
        setAddTarget()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TimeTableViewCell {
    
    // MARK: - UI Components property
    
    private func setUI() {
        contentView.backgroundColor = .white
        
        selectionStyle = .none
        
        weatherButton.isSelected = true
        
        setHourButton(weatherButton, precipitationButton)
        
        titleLabel.do {
            $0.text = "시간대별 날씨"
            $0.font = .fontGuide(.subhead4)
        }
        
        hourCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.registerCell(HourCollectionViewCell.self)
        }
        
        weatherButton.do {
            $0.setTitle("날씨", for: .normal)
        }
        
        precipitationButton.do {
            $0.setTitle("강수", for: .normal)
        }
        
        buttonStackView.do {
            $0.distribution = .fillEqually
            $0.spacing = 5
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(titleLabel, buttonStackView, hourCollectionView)
        
        buttonStackView.addArrangedSubviews(weatherButton, precipitationButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalToSuperview().offset(32)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(28)
            $0.trailing.equalToSuperview().offset(-28)
            $0.height.equalTo(32)
        }
        
        hourCollectionView.snp.makeConstraints {
            $0.top.equalTo(buttonStackView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-25)
            $0.bottom.equalToSuperview().offset(-15)
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        weatherButton.addTarget(self, action: #selector(weatherButtonDidTap), for: .touchUpInside)
        precipitationButton.addTarget(self, action: #selector(precipitationButtonDidTap), for: .touchUpInside)
    }
    
    private func checkHourButton() {
        switch hourButtonState {
        case .weather:
            weatherButton.isSelected = true
            precipitationButton.isSelected = false
        case .precipitation:
            precipitationButton.isSelected = true
            weatherButton.isSelected = false
        }
    }
    
    private func setDelegate() {
        hourCollectionView.delegate = self
        hourCollectionView.dataSource = self
    }
    
    private func setHourButton(_ buttons: UIButton...) {
        buttons.forEach {
            $0.titleLabel?.font = .fontGuide(.subhead3)
            $0.setTitleColor(Color.gray7, for: .normal)
            $0.setBackgroundColor(Color.gray0, for: .normal)
            $0.setTitleColor(Color.white, for: .selected)
            $0.setBackgroundColor(Color.pointColor, for: .selected)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 16
        }
    }
    
    // MARK: - @objc Methods
    
    @objc private func weatherButtonDidTap() {
        hourButtonState = .weather
        checkHourButton()
        print("날씨 버튼 눌림")
    }
    
    @objc private func precipitationButtonDidTap() {
        hourButtonState = .precipitation
        checkHourButton()
        print("강수 버튼 눌림")
    }
}

// MARK: - UICollectionViewDataSource

extension TimeTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: HourCollectionViewCell.self, indexPath: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension TimeTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 82)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}
