//
//  FirstInfoTestViewController.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/07.
//

import UIKit

import SnapKit
import Then

final class FirstInfoTestViewController: SettingBaseViewController {
    
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
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
    }
}

extension FirstInfoTestViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        checkButton.do {
            $0.addTarget(self, action: #selector(checkButtonDidTap), for: .touchUpInside)
        }
        selectCollectionView.do {
            $0.registerCells(EnterInfoCollectionViewCell.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
    }
    
    // MARK: - Methods

    private func setDelegate() {
        selectCollectionView.delegate = self
        selectCollectionView.dataSource = self
    }
    
    private func pushToSecondVC() {
        let secondVC = SecondInfoViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc private func checkButtonDidTap() {
        pushToSecondVC()
    }
}

// MARK: - UICollectionViewDataSource

extension FirstInfoTestViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return info.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: EnterInfoCollectionViewCell.self, indexPath: indexPath)
        cell.setDataBind(infoText: info[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ListInfoViewController(titleText: <#T##String#>, listDatas: <#T##[String]#>, listType: <#T##FirstInfoType#>)
        presentToHalfModalViewController(vc)
    }
}
