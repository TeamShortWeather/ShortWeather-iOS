//
//  CommuteSettingViewController.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

final class CommuteTimeViewController: SettingBaseViewController {
    
    // MARK: - Properties
    
    let info: [String] = [Letter.secondOutTime, Letter.secondInTime]
    private var outTime: String = ""
    private var inTime: String = ""
    private var outNumTime: String = ""
    private var inNumTime: String = ""
    private var isCellTouched: [Bool] = [false, false]
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
    }
}

extension CommuteTimeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        addBackButton()
        
        titleLabel.do {
            $0.text = Letter.changeHour
        }
        
        navigationTitleLabel.text = "외출 / 귀가시간대 설정"
        
        infoCollectionView.do {
            $0.registerCells(EnterInfoCollectionViewCell.self)
        }
        
        checkButton.do {
            $0.setTitle("확인", for: .normal)
            $0.addTarget(self, action: #selector(checkButtonDidTap), for: .touchUpInside)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods

    private func setDelegate() {
        infoCollectionView.dataSource = self
    }
    
    // MARK: - @objc Methods
    
    @objc private func checkButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension CommuteTimeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return info.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: EnterInfoCollectionViewCell.self, indexPath: indexPath)
        switch indexPath.row {
        case 0:
            if outTime.isEmpty == true {
                cell.untouched()
                cell.setDataBind(infoText: info[indexPath.row], data: outTime)
            } else {
                cell.setDataBind(infoText: info[indexPath.row], data: outTime)
            }
        case 1:
            if inTime.isEmpty == true {
                cell.untouched()
                cell.setDataBind(infoText: info[indexPath.row], data: inTime)
            } else {
                cell.setDataBind(infoText: info[indexPath.row], data: inTime)
            }
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isCellTouched[indexPath.row] = true
        switch indexPath.row {
        case 0:
            let vc = TimeInfoViewController(infoText: "\(info[indexPath.row]) 설정", infoType: .outTime)
            vc.delegate = self
            presentToHalfModalViewController(vc, infoType: .outTime)
        case 1:
            let vc = TimeInfoViewController(infoText: "\(info[indexPath.row]) 설정", infoType: .inTime)
            vc.delegate = self
            presentToHalfModalViewController(vc, infoType: .inTime)
        default:
            break
        }
    }
}

//MARK: - TimeInfoViewControllerDelegate

extension CommuteTimeViewController: TimeInfoViewControllerDelegate {
    
    func getNullData() {
        infoCollectionView.reloadData()
    }
    
    func getInfoData(userInfoData: UserInfo, numTime: String) {
        let infoType = userInfoData.infoType
        if infoType == .outTime {
            outTime = userInfoData.infoData
            outNumTime = numTime
        } else if infoType == .inTime {
            inTime = userInfoData.infoData
            inNumTime = numTime
        }
        infoCollectionView.reloadData()
        checkButton.setState(.allow)
    }
}
