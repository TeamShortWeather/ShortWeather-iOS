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
    
    var wakeUpTime: String?
    var goingOutTime: String?
    var goingHomeTime: String?
    
    private let Info: [String] = [
        "기상시간",
        "외출시간",
        "귀가시간",
    ]
    
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
        
        addBackButtonNavigationBar()
        
        titleLabel.do {
            $0.text = "여러분의 하루를 알려주세요"
        }
        
        checkButton.do {
            $0.setTitle("확인", for: .normal)
        }
        
        addInfoLabel.do {
            $0.text = "* 입력한 시간을 바탕으로 날씨를 알려드려요"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray4
        }
        
        infoCollectionView.do {
            $0.registerCell(EnterInfoCollectionViewCell.self)
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
        infoCollectionView.delegate = self
        infoCollectionView.dataSource = self
    }
}

//extension SecondInfoViewController: UICollectionViewDelegateFlowLayout {
//
//    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = UIScreen.main.bounds.width - 56
//        return CGSize(width: width, height: 64)
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return CGFloat(28)
//    }
//}

extension SecondInfoViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: EnterInfoCollectionViewCell.self, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

//extension SecondInfoViewController: UISheetPresentationControllerDelegate {
//    
////    override func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
////        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
////    }
//}

extension SecondInfoViewController: TimeInfoViewControllerDelegate {
    
    func sendData(pickData: String) {
        infoCollectionView.reloadData()
    }
}
