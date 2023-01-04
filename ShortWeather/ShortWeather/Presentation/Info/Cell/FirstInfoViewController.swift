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


class FirstInfoViewController: UIViewController  {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let nextButton: UIButton = UIButton()

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
    
    var infoModel: [Info] = [
        Info(labelName: "성별을 선택해 주세요"),
        Info(labelName: "연령대를 선택해 주세요"),
        Info(labelName: "온도 민감도를 알려주세요")
    ]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        register()
    }
}

extension FirstInfoViewController {

    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
         [titleLabel, selectCollectionView, nextButton].forEach {
            view.addSubview($0)
        }
        
        titleLabel.do {
            $0.text = "입력하신 정보를 바탕으로 \n생활에 맞는 날씨를 알려드릴게요"
            $0.font = UIFont.fontGuide(.headline1)
            $0.textColor = .black
            $0.numberOfLines = 0
        }
        
        nextButton.do {
            $0.setTitle("다음", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = Color.gray2
            $0.layer.cornerRadius = 15
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(44)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        selectCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(46)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(320)
            $0.height.equalTo(350)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(34)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(320)
            $0.height.equalTo(57)
        }
    }
    
    // MARK: - Methods
    
    private func register() {
        selectCollectionView.register(SelectCollectionViewCell.self,
                                         forCellWithReuseIdentifier: SelectCollectionViewCell.identifier)
    }
    
    // MARK: - @objc Methods
    
}

extension FirstInfoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 64)
    }
}

extension FirstInfoViewController: UICollectionViewDataSource {
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
        if(indexPath.item == 0){
            let listVC = GenderViewController()
            listVC.modalPresentationStyle = .formSheet
            self.present(listVC, animated: true, completion: nil)
        }
    }
}
