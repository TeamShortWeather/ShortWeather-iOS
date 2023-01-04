//
//  BaseLocationViewController.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/04.
//

import UIKit

import Moya
import SnapKit
import Then

class BaseLocationViewController: BaseViewController {
    
    // MARK: - UI Components
    
    public let locationView: LocationView = LocationView()
    public let locationCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-62)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private let pageController: UIPageControl = UIPageControl()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension BaseLocationViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        locationView.do {
            $0.setDataBind(Letter.tempLocation)
        }
        pageController.do {
            $0.pageIndicatorTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            $0.currentPageIndicatorTintColor = Color.pointColor
            $0.numberOfPages = 3
        }
        locationCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isPagingEnabled = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(locationView, locationCollectionView)
        locationView.addSubview(pageController)
        view.bringSubviewToFront(super.backgroundView)
        view.bringSubviewToFront(super.sideMenuView)
        locationView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(62)
        }
        pageController.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(6)
            $0.width.equalTo(30)
        }
        locationCollectionView.snp.makeConstraints {
            $0.top.equalTo(locationView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
}
