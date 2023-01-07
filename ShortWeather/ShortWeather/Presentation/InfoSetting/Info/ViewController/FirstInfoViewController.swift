//
//  JoinViewController.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/03.
//

import UIKit

import Moya
import SnapKit
import Then

enum FirstInfoType {
    case gender
    case age
    case tempResponse
}

class FirstInfoViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let nextButton: UIButton = UIButton()
    private lazy var selectCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    // MARK: - Properties
    
    var gender: String?
    var age: String?
    var tempResponse: String?
    var infoModel: [String] = [
        "성별을 선택해 주세요",
        "연령대를 선택해 주세요",
        "온도 민감도를 알려주세요"
    ]
    var genderListModel: [String] = ["여자", "남자"]
    var ageListModel: [String] = [
        "10대",
        "20대",
        "30대",
        "40대",
        "50대",
        "60대 이상"
    ]
    var temListModel: [String] = [
        "추위를 잘 타요",
        "보통이에요",
        "더위를 잘 타요",
        "추위, 더위 모두 타요"
    ]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
    }
}

extension FirstInfoViewController {

    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "입력하신 정보를 바탕으로 \n생활에 맞는 날씨를 알려드릴게요"
            $0.font = .fontGuide(.headline1)
            $0.textColor = Color.black
            $0.numberOfLines = 0
        }
        
        selectCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.registerCell(EnterInfoCollectionViewCell.self)
        }
        
        nextButton.do {
            $0.setTitle("다음", for: .normal)
            $0.setTitleColor(Color.black, for: .normal)
            $0.backgroundColor = Color.gray2
            $0.layer.cornerRadius = 15
            $0.addTarget(self, action: #selector(touchUpSecondVC), for: .touchUpInside)
        }
        
        selectCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
//            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.registerCell(EnterInfoCollectionViewCell.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(titleLabel, selectCollectionView, nextButton)

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(28)
        }

        selectCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(46)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-34)
            $0.leading.equalTo(titleLabel)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(57)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        selectCollectionView.delegate = self
        selectCollectionView.dataSource = self
    }
    
    private func pushToSecondVC() {
        let secondVC = SecondInfoViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
//        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    private func halfModal(title: String, listData: [String], listType: FirstInfoType, status: String) {
        let vc = ListInfoViewController(titleText: title, listDatas: listData, listType: listType, status: status)
        vc.modalPresentationStyle = .pageSheet
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.delegate = self
            sheet.prefersGrabberVisible = true
        }
        present(vc, animated: true, completion: nil);
    }
    
    // MARK: - @objc Methods
    
    @objc private func touchUpSecondVC() {
        pushToSecondVC()
    }
}

extension FirstInfoViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 56
        return CGSize(width: width, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(28)
    }
}

extension FirstInfoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: EnterInfoCollectionViewCell.self, indexPath: indexPath)
        if indexPath.item == 0 {
            cell.setDataBind(info: infoModel[indexPath.item], pickData: gender ?? "")
            if let _ = gender {
                cell.selectCell()
            }
        } else if indexPath.item == 1 {
            cell.setDataBind(info: infoModel[indexPath.item], pickData: age ?? "")
//            cell.statusChange(status: selectStatus ?? "")
            if let _ = age {
                cell.selectCell()
                print("2")
//                cell.statusChange(status: selectStatus ?? "")
            }
        } else if indexPath.item == 2 {
            cell.setDataBind(info: infoModel[indexPath.item], pickData: tempResponse ?? "")
//            cell.statusChange(status: selectStatus ?? "")
            if let _ = tempResponse {
                print("3")
                cell.selectCell()
//                cell.statusChange(status: selectStatus ?? "")
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoEnterCollectionViewCell.identifier, for: indexPath)
        let cell = collectionView.dequeueCell(type: EnterInfoCollectionViewCell.self, indexPath: indexPath)
        cell.contentView.backgroundColor = .red
        cell.selectCell()
        collectionView.reloadData()
        view.layoutIfNeeded()
        
//        switch (indexPath.item) {
//        case 0:
//            halfModal(title: "성별을 선택해 주세요", listData: genderListModel, listType: .gender, status: "")
//        case 1:
//            halfModal(title: "연령대를 선택해 주세요", listData: ageListModel, listType: .age, status: "")
//        case 2:
//            halfModal(title: "온도민감도를 알려주세요", listData: temListModel, listType: .tempResponse, status: "")
//        default:
//            print("FirstInfoViewController 오류")
//        }
    }
}

extension FirstInfoViewController: UISheetPresentationControllerDelegate {
    
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}

extension FirstInfoViewController: ListInfoViewControllerDelegate {
    
    func sendData(pickData: String, listType: FirstInfoType) {
        switch listType {
        case .gender:
            self.gender = pickData
        case .age:
            self.age = pickData
        case .tempResponse:
            self.tempResponse = pickData
        }
//        selectCollectionView.reloadData()
    }
}
