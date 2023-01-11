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
    private var user: User
    private var isCellTouched: [Bool] = [false, false, false]
    
    // MARK: - Initializer
    
    init() {
        user = User(gender: "", age: "", tempSens: "", wakeUpTime: "", goOutTime: "", goHomeTime: "", deviceToken: "")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        infoCollectionView.do {
            $0.registerCells(EnterInfoCollectionViewCell.self)
        }
        
        checkButton.do {
            $0.setTitle("다음", for: .normal)
            $0.addTarget(self, action: #selector(checkButtonDidTap), for: .touchUpInside)
        }
    }
    
    // MARK: - Methods

    private func setDelegate() {
        infoCollectionView.delegate = self
        infoCollectionView.dataSource = self
    }
    
    private func pushToSecondViewController() {
        let secondVC = SecondInfoViewController(user: user)
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    private func setCellState(cell: EnterInfoCollectionViewCell, indexPath: IndexPath) {
        if isCellTouched[indexPath.row] {
            switch indexPath.row {
            case 0:
                if user.gender.isEmpty {
                    cell.unselectCell()
                } else {
                    cell.selectCell()
                }
            case 1:
                if user.age.isEmpty {
                    cell.unselectCell()
                } else {
                    cell.selectCell()
                }
            case 2:
                if user.tempSens.isEmpty {
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
    
    private func presentToListViewController(indexPath: IndexPath, infoType: InfoType) {
        let vc = ListInfoViewController(infoText: info[indexPath.row], listData: cellInfo[indexPath.row], infoType: infoType)
        vc.delegate = self
        presentToHalfModalViewController(vc, infoType: infoType)
    }
    
    private func checkButtonState() {
        if !user.gender.isEmpty && !user.age.isEmpty && !user.tempSens.isEmpty {
            checkButton.setState(.allow)
        } else {
            checkButton.setState(.notAllow)
        }
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
            cell.setDataBind(infoText: info[indexPath.row], data: user.gender)
        case 1:
            cell.setDataBind(infoText: info[indexPath.row], data: user.age)
        case 2:
            cell.setDataBind(infoText: info[indexPath.row], data: user.tempSens)
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
            presentToListViewController(indexPath: indexPath, infoType: .gender)
        case 1:
            presentToListViewController(indexPath: indexPath, infoType: .age)
        case 2:
            presentToListViewController(indexPath: indexPath, infoType: .tempResponse)
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
        let infoType = userInfoData.infoType
        if infoType == .gender {
            self.user.gender = userInfoData.infoData
        } else if infoType == .age {
            self.user.age = userInfoData.infoData
        } else if infoType == .tempResponse {
            self.user.tempSens = userInfoData.infoData
        }
        infoCollectionView.reloadData()
    }
}
