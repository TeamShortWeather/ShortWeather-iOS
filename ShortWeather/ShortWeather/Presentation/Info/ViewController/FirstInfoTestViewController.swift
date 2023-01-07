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
    
    // MARK: - UI Components
    // MARK: - Properties
    
    let info: [String] = [
        "성별을 선택해 주세요",
        "연령대를 선택해 주세요",
        "온도 민감도를 알려주세요"
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
            $0.addTarget(self, action: #selector(touchUpSecondVC), for: .touchUpInside)
        }
        selectCollectionView.do {
            $0.registerCells(SelectCollectionViewCell.self)
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
    
    @objc private func touchUpSecondVC() {
        pushToSecondVC()
    }
}

// MARK: - UICollectionViewDataSource

extension FirstInfoTestViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return info.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: SelectCollectionViewCell.self, indexPath: indexPath)
        cell.setDataBind(info: info[indexPath.row], pickData: "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        halfModal(title: info[indexPath.row])
    }
}
