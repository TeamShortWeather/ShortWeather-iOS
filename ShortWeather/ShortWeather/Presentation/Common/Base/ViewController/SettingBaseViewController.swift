//
//  SettingBaseViewController.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/07.
//

import UIKit

import Moya
import SnapKit
import Then

class SettingBaseViewController: UIViewController {
    
    // MARK: - UI Components
    
    let titleLabel: UILabel = UILabel()
    let selectCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    let checkButton: UIButton = UIButton()
    
    // MARK: - Properties
    
    var wakeUpTime: String?
    var goingOutTime: String?
    var goingHomeTime: String?
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
    }
}

extension SettingBaseViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white

        titleLabel.do {
            $0.font = .fontGuide(.headline1)
        }
        
        selectCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
//            $0.registerCells(SetSelectCollectionViewCell.self)
        }
        
        checkButton.do {
            $0.setTitle("확인", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = Color.gray2
            $0.layer.cornerRadius = 15
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(titleLabel, selectCollectionView, checkButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(29)
            $0.leading.equalToSuperview().offset(28)
        }
        
        selectCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-34)
            $0.leading.equalTo(28)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(57)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        selectCollectionView.delegate = self
    }
    
    // MARK: - @objc Methods
    
    @objc func halfModal(title: String) {
        let vc = TimeViewController(titleText: title, listType: .goingHomeTime)
        vc.modalPresentationStyle = .pageSheet
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()] // 반만 고정
//            sheet.detents = [.medium(), .large()] // 반, 전체 다 자유롭게
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
        }
        self.present(vc, animated: true, completion: nil);
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension SettingBaseViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 56
        return CGSize(width: width, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(28)
    }
}

// MARK: - UISheetPresentationControllerDelegate

extension SettingBaseViewController: UISheetPresentationControllerDelegate {
    
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}

// MARK: - TimeViewControllerDelegate

extension SettingBaseViewController: TimeViewControllerDelegate {
    
    func sendData(pickData: String, listType: SecondInfoType) {
        switch listType {
        case .wakeUpTime:
            self.wakeUpTime = pickData
        case .goingOutTime:
            self.goingOutTime = pickData
        case .goingHomeTime:
            self.goingHomeTime = pickData
        }
        selectCollectionView.reloadData()
    }
}
