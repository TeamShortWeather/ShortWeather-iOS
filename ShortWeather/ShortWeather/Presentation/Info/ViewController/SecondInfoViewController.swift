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
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(73)
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
}
