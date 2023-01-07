//
//  FirstInfoViewController.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/07.
//

import UIKit

import SnapKit
import Then

final class FirstInfoViewController: SettingBaseViewController {
    
    // MARK: - Properties
    
    private let info: [String] = [
        "성별을 선택해 주세요",
        "연령대를 선택해 주세요",
        "온도 민감도를 알려주세요"
    ]
    private let cellInfo: [[String]] = [
        ["여자", "남자"],
        ["10대", "20대", "30대", "40대", "50대", "60대 이상"],
        ["추위를 잘 타요", "보통이에요", "더위를 잘 타요", "추위, 더위 모두 타요"]
    ]
    
    private var gender: String = ""
    private var age: String = ""
    private var tempResponse: String = ""
    private var isCellTouched: [Bool] = [false, false, false]
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

extension FirstInfoViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        titleLabel.do {
            $0.text = "입력하신 정보를 바탕으로 \n생활에 맞는 날씨를 알려드릴게요"
            $0.numberOfLines = 0
        }
        
        checkButton.do {
            $0.addTarget(self, action: #selector(checkButtonDidTap), for: .touchUpInside)
        }
        
        infoCollectionView.do {
            $0.registerCells(EnterInfoCollectionViewCell.self)
        }
    }
    
    // MARK: - Methods

    private func setDelegate() {
        infoCollectionView.delegate = self
        infoCollectionView.dataSource = self
    }
    
    private func pushToSecondViewController() {
        let secondVC = SecondInfoViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc private func checkButtonDidTap() {
        pushToSecondViewController()
    }
}

// MARK: - UICollectionViewDataSource

extension FirstInfoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return info.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: EnterInfoCollectionViewCell.self, indexPath: indexPath)
        switch indexPath.row {
        case 0:
            cell.setDataBind(infoText: info[indexPath.row], data: gender)
        case 1:
            cell.setDataBind(infoText: info[indexPath.row], data: age)
        case 2:
            cell.setDataBind(infoText: info[indexPath.row], data: tempResponse)
        default:
            break
        }
        if isCellTouched[indexPath.row] {
            switch indexPath.row {
            case 0:
                if gender.isEmpty {
                    cell.unselectCell()
                } else {
                    cell.selectCell()
                }
            case 1:
                cell.setDataBind(infoText: info[indexPath.row], data: age)
                if age.isEmpty {
                    cell.unselectCell()
                } else {
                    cell.selectCell()
                }
            case 2:
                cell.setDataBind(infoText: info[indexPath.row], data: tempResponse)
                if tempResponse.isEmpty {
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isCellTouched[indexPath.row] = true
        switch indexPath.row {
        case 0:let vc = ListInfoViewController(infoText: info[indexPath.row], listData: cellInfo[indexPath.row], infoType: .gender)
            vc.delegate = self
            presentToHalfModalViewController(vc)
        case 1:
            let vc = ListInfoViewController(infoText: info[indexPath.row], listData: cellInfo[indexPath.row], infoType: .age)
            vc.delegate = self
            presentToHalfModalViewController(vc)
        case 2:
            let vc = ListInfoViewController(infoText: info[indexPath.row], listData: cellInfo[indexPath.row], infoType: .tempResponse)
            vc.delegate = self
            presentToHalfModalViewController(vc)
        default:
            break
        }
    }
}

extension FirstInfoViewController: ListInfoViewControllerDelegate {
    func getNullData() {
        infoCollectionView.reloadData()
    }
    
    func getInfoData(userInfoData: UserInfo) {
        switch userInfoData.infoType {
        case .gender:
            self.gender = userInfoData.infoData
        case .age:
            self.age = userInfoData.infoData
        case .tempResponse:
            self.tempResponse = userInfoData.infoData
        }
        infoCollectionView.reloadData()
    }
}
