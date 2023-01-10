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
    private let backButton: UIButton = UIButton()
    let infoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    let checkButton: CheckButton = CheckButton()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        setAddTarget()
    }
}

extension SettingBaseViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        navigationController?.navigationBar.isHidden = true
        
        view.backgroundColor = .white

        backButton.do {
            $0.setImage(Image.icnExpandLeft, for: .normal)
            $0.isHidden = true
        }
        
        titleLabel.do {
            $0.font = .fontGuide(.headline1)
        }
        
        infoCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.registerCells(EnterInfoCollectionViewCell.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(titleLabel, backButton, infoCollectionView, checkButton)
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(28)
            $0.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(29)
            $0.leading.equalTo(backButton)
        }
        
        infoCollectionView.snp.makeConstraints {
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
        infoCollectionView.delegate = self
    }
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    public func presentToHalfModalViewController(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .pageSheet
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium()] // 반만 고정
//            sheet.detents = [.medium(), .large()] // 반, 전체 다 자유롭게
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
        }
        self.present(viewController, animated: true, completion: nil);
    }
    
    public func addBackButton() {
        backButton.isHidden = false
    }

    // MARK: - @objc Methods
    
    @objc public func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
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
