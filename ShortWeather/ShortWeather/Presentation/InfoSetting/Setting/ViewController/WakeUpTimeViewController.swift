//
//  WakeUpTimeViewController.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

final class WakeUpTimeViewController: SettingBaseViewController {
    
    // MARK: - Properties

    let info: String = Letter.secondWakeUpTime
    private var wakeUpTime: String = ""
    private var wakeUpNumTime: String = ""
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
    }
}

extension WakeUpTimeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        addBackButton()
        
        navigationItem.title = "\(Letter.wakeUpTime) 설정"
        
        titleLabel.do {
            $0.text = Letter.changeWakeUpTime
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

extension WakeUpTimeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: EnterInfoCollectionViewCell.self, indexPath: indexPath)
        cell.setDataBind(infoText: info, data: wakeUpTime)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TimeInfoViewController(infoText: "\(info) 설정", infoType: .outTime)
        vc.delegate = self
        presentToHalfModalViewController(vc, infoType: .outTime)
    }
}

//MARK: - TimeInfoViewControllerDelegate

extension WakeUpTimeViewController: TimeInfoViewControllerDelegate {
    
    func getNullData() {
        infoCollectionView.reloadData()
    }
    
    func getInfoData(userInfoData: UserInfo, numTime: String) {
        wakeUpTime = userInfoData.infoData
        wakeUpNumTime = numTime
        infoCollectionView.reloadData()
        checkButton.setState(.allow)
    }
}
