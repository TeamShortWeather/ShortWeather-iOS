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
    }
}

extension SettingBaseViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white

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
        view.addSubviews(titleLabel, infoCollectionView, checkButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(29)
            $0.leading.equalToSuperview().offset(28)
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
    
    public func presentToHalfModalViewController(_ viewController: UIViewController, infoType: InfoType) {
        viewController.modalPresentationStyle = .pageSheet
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium()] // 반만 고정
            //            sheet.detents = [.medium(), .large()] // 반, 전체 다 자유롭게
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
            
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
//        self.present(viewController, animated: true, completion:nil);
//        self.present(vc, animated: true) {
//            vc.datePickerTest.reloadAllComponents()
//        }
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
