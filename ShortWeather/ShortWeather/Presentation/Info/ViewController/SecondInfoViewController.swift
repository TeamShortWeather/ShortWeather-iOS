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

final class SecondInfoViewController: UIViewController {
    
    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()
    private let checkButton: UIButton = UIButton()
    private let addInfoLabel: UILabel = UILabel()
    
    private lazy var selectCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Properties
    
    // SecondInfo
    var infoModel: [Info] = [
        Info(labelName: "기상시간"),
        Info(labelName: "외출시간"),
        Info(labelName: "귀가시간")
    ]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        register()
        
        // 네비게이션 바 커스텀
        navigationItem.leftBarButtonItem = UIBarButtonItem (
            image: UIImage(named: "icn_expand_left"),
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
}

extension SecondInfoViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
         [titleLabel, selectCollectionView, checkButton, addInfoLabel].forEach {
            view.addSubview($0)
        }
        
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
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
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
    
    private func register() {
        selectCollectionView.registerCell(SelectCollectionViewCell.self)
    }
    
    
    // MARK: - @objc Methods
    
    @objc private func popToPrevious() {
        // our custom stuff
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func halfModal(title: String) { // half modal
        let vc = TimeViewController(titleText: title)
        vc.modalPresentationStyle = .pageSheet
        
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCollectionViewCell.identifier,
                                                            for: indexPath) as? SelectCollectionViewCell else { return UICollectionViewCell() }

        cell.setDataBind(model: infoModel[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch (indexPath.item) {
        case 0:
            halfModal(title: "기상시간 설정")
        case 1:
            halfModal(title: "외출시간 설정")
//            let listVC = TimeViewController(titleText: "외출시간 설정")
//            listVC.modalPresentationStyle = .formSheet
//            self.present(listVC, animated: true, completion: nil);
        case 2:
            halfModal(title: "귀가시간 설정")
//            let listVC = TimeViewController(titleText: "귀가시간 설정")
//            listVC.modalPresentationStyle = .formSheet
//            self.present(listVC, animated: true, completion: nil);
        default:
            print("SecondInfoViewController 오류")
        }
    }
}

extension SecondInfoViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        //크기 변경 됐을 경우
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}
