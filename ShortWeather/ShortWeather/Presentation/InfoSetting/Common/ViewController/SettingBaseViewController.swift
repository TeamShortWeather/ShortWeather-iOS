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
    
    public func presentToHalfModalViewController(_ viewController: UIViewController, infoType: InfoType) {
        viewController.modalPresentationStyle = .pageSheet
        
        let genderID = UISheetPresentationController.Detent.Identifier("genderID")
        let ageID = UISheetPresentationController.Detent.Identifier("ageID")
        let tempID = UISheetPresentationController.Detent.Identifier("tempID")
        let timeID = UISheetPresentationController.Detent.Identifier("timeID")
        let genderDetent = UISheetPresentationController.Detent.custom(identifier: genderID) { context in
            return 211
        }
        let ageDetent = UISheetPresentationController.Detent.custom(identifier: ageID) { context in
            return 477
        }
        let tempDetent = UISheetPresentationController.Detent.custom(identifier: tempID) { context in
            return 349
        }
        let timeDetent = UISheetPresentationController.Detent.custom(identifier: timeID) { context in
            return 331
        }
        
        if let sheet = viewController.sheetPresentationController {
            switch infoType {
            case .gender:
                sheet.detents = [genderDetent, .large()]
            case .age:
                sheet.detents = [ageDetent, .large()]
            case .tempResponse:
                sheet.detents = [tempDetent, .large()]
            default:
                sheet.detents = [timeDetent, .large()]
            }
            sheet.preferredCornerRadius = 30
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
        }
        
        if viewController is ListInfoViewController {
            self.present(viewController, animated: true, completion:nil);
        }
        
        if let vc = viewController as? TimeInfoViewController {
            self.present(vc, animated: true) {
                vc.datePicker.reloadAllComponents()
                switch infoType {
                case .wakeUpTime:
                    vc.datePicker.selectRow(6, inComponent: 1, animated: true)
                case .outTime:
                    vc.datePicker.selectRow(7, inComponent: 1, animated: true)
                case .inTime:
                    vc.datePicker.selectRow(1, inComponent: 0, animated: true)
                    vc.datePicker.selectRow(5, inComponent: 1, animated: true)
                default:
                    vc.datePicker.selectRow(0, inComponent: 0, animated: true)
                }
            }
        }
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
