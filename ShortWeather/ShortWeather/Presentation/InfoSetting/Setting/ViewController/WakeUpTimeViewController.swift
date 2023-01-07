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
        addBackButtonNavigationBar()
        
        navigationItem.title = "기상시간 설정"
        
        titleLabel.do {
            $0.text = "기상시간을 변경해주세요"
        }
        selectCollectionView.do {
            $0.registerCells(SetSelectCollectionViewCell.self)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        selectCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource

extension WakeUpTimeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: SetSelectCollectionViewCell.self, indexPath: indexPath)
        cell.setDataBind(info: "기상시간", pickData: "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch indexPath.row {
//        case 0:
//            halfModal(title: "기상시간 설정")
//        default:
//            halfModal(title: "기상시간 설정")
//        }
    }
}

