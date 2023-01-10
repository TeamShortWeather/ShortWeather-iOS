//
//  SecondInfoViewController.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/04.
//

import UIKit

import SnapKit
import Then

final class SecondInfoViewController: SettingBaseViewController {
    
    // MARK: - UI Components
    
    private let addInfoLabel: UILabel = UILabel()
    
    // MARK: - Properties
    
    private let info: [String] = [
        "기상시간",
        "외출시간",
        "귀가시간",
    ]
    private var wakeUpTime: String = ""
    private var outTime: String = ""
    private var inTime: String = ""
    private var isCellTouched: [Bool] = [false, false, false]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
    }
}

extension SecondInfoViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        addBackButton()
        
        titleLabel.do {
            $0.text = "여러분의 하루를 알려주세요"
        }
        
        infoCollectionView.do {
            $0.registerCell(EnterInfoCollectionViewCell.self)
        }
        
        addInfoLabel.do {
            $0.text = "* 입력한 시간을 바탕으로 날씨를 알려드려요"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray4
        }
        
        checkButton.do {
            $0.setTitle("확인", for: .normal)
            $0.addTarget(self, action: #selector(checkButtonDidTap), for: .touchUpInside)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(addInfoLabel)
        
        addInfoLabel.snp.makeConstraints {
            $0.bottom.equalTo(checkButton.snp.bottom).inset(71)
            $0.leading.equalTo(checkButton)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        infoCollectionView.dataSource = self
    }
    
    private func setCellState(cell: EnterInfoCollectionViewCell, indexPath: IndexPath) {
        if isCellTouched[indexPath.row] {
            switch indexPath.row {
            case 0:
                if wakeUpTime.isEmpty {
                    cell.unselectCell()
                } else {
                    cell.selectCell()
                }
            case 1:
                if outTime.isEmpty {
                    cell.unselectCell()
                } else {
                    cell.selectCell()
                }
            case 2:
                if inTime.isEmpty {
                    cell.unselectCell()
                } else {
                    cell.selectCell()
                }
            default:
                break
            }
        } else {
            cell.untouched()
        }
    }
    
    private func checkButtonState() {
        if !wakeUpTime.isEmpty && !outTime.isEmpty && !inTime.isEmpty {
            checkButton.setState(.allow)
        } else {
            checkButton.setState(.notAllow)
        }
    }
    
    // MARK: - @objc Methods
    
    @objc private func checkButtonDidTap() {
        UIViewController.modifyRootViewController(TodayWeatherViewController())
    }
}

extension SecondInfoViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return info.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: EnterInfoCollectionViewCell.self, indexPath: indexPath)
        switch indexPath.row {
        case 0:
            cell.setDataBind(infoText: info[indexPath.row], data: wakeUpTime)
        case 1:
            cell.setDataBind(infoText: info[indexPath.row], data: outTime)
        case 2:
            cell.setDataBind(infoText: info[indexPath.row], data: inTime)
        default:
            break
        }
        setCellState(cell: cell, indexPath: indexPath)
        checkButtonState()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isCellTouched[indexPath.row] = true
        switch indexPath.row {
        case 0:
            let vc = TimeInfoViewController(infoText: "\(info[indexPath.row]) 설정", infoType: .wakeUpTime)
            vc.delegate = self
            presentToHalfModalViewController(vc)
        case 1:
            let vc = TimeInfoViewController(infoText: "\(info[indexPath.row]) 설정", infoType: .outTime)
            vc.delegate = self
            presentToHalfModalViewController(vc)
        case 2:
            let vc = TimeInfoViewController(infoText: "\(info[indexPath.row]) 설정", infoType: .inTime)
            vc.delegate = self
            presentToHalfModalViewController(vc)
        default:
            break
        }
    }
}

extension SecondInfoViewController: TimeInfoViewControllerDelegate {
    
    func getNullData() {
        infoCollectionView.reloadData()
    }
    
    func getInfoData(userInfoData: UserInfo) {
        let infoType = userInfoData.infoType
        if infoType == .wakeUpTime {
            wakeUpTime = userInfoData.infoData
        } else if infoType == .outTime {
            outTime = userInfoData.infoData
        } else if infoType == .inTime {
            inTime = userInfoData.infoData
        }
        infoCollectionView.reloadData()
    }
}
