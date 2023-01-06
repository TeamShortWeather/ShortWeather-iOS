//
//  GenderViewController.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/03.
//

import UIKit

import Moya
import SnapKit
import Then

final class GenderViewController: UIViewController {
    
    // MARK: - UI Components
    private let titleLabel: UILabel = UILabel()
    private lazy var listCollectionView: UICollectionView = {
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
    
    var listModel: [List] = [
        List(listName: "여자"),
        List(listName: "남자")
    ]
    
    var completionHandler: ((String) -> (String))? // 컴플리션 핸들러
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        register()
    }
}

extension GenderViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        [titleLabel, listCollectionView].forEach {
            view.addSubview($0)
        }
        
        titleLabel.do {
            $0.text = "성별을 선택해 주세요"
            $0.font = UIFont.fontGuide(.headline1)
            $0.textColor = .black
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(41)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(319)
        }
        
        listCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(375)
            $0.height.equalTo(500)
        }
    }
    
    // MARK: - Methods
    
    private func register() {
        listCollectionView.register(ListCollectionViewCell.self,
                                    forCellWithReuseIdentifier: ListCollectionViewCell.identifier)
        
    }
    
    // MARK: - @objc Methods
    
}

extension GenderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 44)
    }
}

extension GenderViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier,
                                                            for: indexPath) as? ListCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setDataBind(model: listModel[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(listModel[indexPath.row].listName)
        _ = completionHandler?(self.listModel[indexPath.row].listName ?? "")
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        guard let cell = collectionView.cellForItem(at: indexPath) as?
//                ListCollectionViewCell else { return true }
//        if cell.isSelected {
//            listCollectionView.deselectItem(at: indexPath, animated: true)
//            return false
//        }
//        else { return true }
//    }
}
