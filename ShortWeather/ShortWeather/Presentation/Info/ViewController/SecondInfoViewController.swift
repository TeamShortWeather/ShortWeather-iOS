//
//  SecondInfoViewController.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/04.
//

import UIKit

import Moya
import SnapKit
import Then

enum SecondInfoType {
    case wakeUpTime
    case goingOutTime
    case goingHomeTime
}

final class SecondInfoViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let checkButton: UIButton = UIButton()
    private let addInfoLabel: UILabel = UILabel()
    private lazy var selectCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    // MARK: - Properties
    
    var wakeUpTime: String?
    var goingOutTime: String?
    var goingHomeTime: String?
    
    var info: [String] = [
        "기상시간",
        "외출시간",
        "귀가시간"
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
            $0.font = .fontGuide(.headline1)
            $0.textColor = Color.black
        }
        
        checkButton.do {
            $0.setTitle("확인", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = Color.gray2
            $0.layer.cornerRadius = 15
        }
        
        addInfoLabel.do {
            $0.text = "* 입력한 시간을 바탕으로 날씨를 알려드려요"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray4
        }
        
        selectCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.showsHorizontalScrollIndicator = false
            $0.registerCell(SelectCollectionViewCell.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(titleLabel, selectCollectionView, checkButton, addInfoLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(29) // 네비바 44 (73-44)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(320)
        }
        
        selectCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(320)
            $0.height.equalTo(350)
        }
        
        checkButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(34)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(320)
            $0.height.equalTo(57)
        }
        
        addInfoLabel.snp.makeConstraints {
            $0.bottom.equalTo(checkButton.snp.bottom).inset(71)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(320)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        selectCollectionView.delegate = self
        selectCollectionView.dataSource = self
    }
    
    private func halfModal(title: String, listType: SecondInfoType) {
        let vc = TimeViewController(titleText: title, listType: listType)
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

extension SecondInfoViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 64)
    }
}

extension SecondInfoViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: SelectCollectionViewCell.self, indexPath: indexPath)
        if indexPath.item == 0 {
            cell.setDataBind(info: info[indexPath.item], pickData: wakeUpTime ?? "")
        } else if indexPath.item == 1 {
            cell.setDataBind(info: info[indexPath.item], pickData: goingOutTime ?? "")
        } else {
            cell.setDataBind(info: info[indexPath.item], pickData: goingHomeTime ?? "")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch (indexPath.item) {
        case 0:
            halfModal(title: "기상시간 설정", listType: .wakeUpTime)
        case 1:
            halfModal(title: "외출시간 설정", listType: .goingOutTime)
        case 2:
            halfModal(title: "귀가시간 설정", listType: .goingHomeTime)
        default:
            halfModal(title: "귀가시간 설정", listType: .goingHomeTime)
        }
    }
}

extension SecondInfoViewController: UISheetPresentationControllerDelegate {
    
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}

extension SecondInfoViewController: TimeViewControllerDelegate {
    
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
