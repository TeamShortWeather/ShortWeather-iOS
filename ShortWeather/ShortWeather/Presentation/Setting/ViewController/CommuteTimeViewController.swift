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
        navigationItem.title = "외출 / 귀가시간대 설정"
        
        titleLabel.do {
            $0.text = "시간대를 변경해주세요"
        }
    }
    
    // MARK: - Methods

    private func setDelegate() {
        selectCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource

extension CommuteTimeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: SetSelectCollectionViewCell.self, indexPath: indexPath)
        cell.setDataBind(info: info[indexPath.row], pickData: "")
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CommuteTimeViewController {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            halfModal(title: "외출시간 설정")
        case 1:
            halfModal(title: "귀가시간 설정")
        default:
            halfModal(title: "외출시간 설정")
        }
    }
}
