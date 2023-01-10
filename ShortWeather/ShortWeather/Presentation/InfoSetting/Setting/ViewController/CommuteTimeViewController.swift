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
    
    let info: [String] = ["외출시간", "귀가시간"]
    private var outTime: String = ""
    private var inTime: String = ""
    private var isCellTouched: [Bool] = [false, false]
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
    }
}

extension CommuteTimeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        addBackButtonNavigationBar()
        
        navigationItem.title = "외출 / 귀가시간대 설정"
        
        titleLabel.do {
            $0.text = "시간대를 변경해주세요"
        }
        
        infoCollectionView.do {
            $0.registerCells(EnterInfoCollectionViewCell.self)
        }
        
        checkButton.do {
            $0.setTitle("확인", for: .normal)
            $0.addTarget(self, action: #selector(checkButtonDidTap), for: .touchUpInside)
        }
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
            cell.setDataBind(infoText: "\(info[indexPath.row]) 설정", data: outTime)
        case 1:
            cell.setDataBind(infoText: "\(info[indexPath.row]) 설정", data: inTime)
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

extension CommuteTimeViewController: TimeInfoViewControllerDelegate {
    
    func getNullData() {
        infoCollectionView.reloadData()
    }
    
    func getInfoData(userInfoData: UserInfo) {
        let infoType = userInfoData.infoType
        if infoType == .outTime {
            outTime = userInfoData.infoData
        } else if infoType == .inTime {
            inTime = userInfoData.infoData
        }
        infoCollectionView.reloadData()
        checkButton.setState(.allow)
    }
}
