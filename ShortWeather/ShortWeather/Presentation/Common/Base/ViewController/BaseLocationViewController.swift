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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private let pageController: UIPageControl = UIPageControl()
    private let addLocationButton: UIButton = UIButton()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
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
        
        addLocationButton.do {
            $0.setImage(Image.icnAdd, for: .normal)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(locationView, locationCollectionView, addLocationButton)
        locationView.addSubview(pageController)
        
        locationView.snp.makeConstraints {
            $0.top.equalTo(hamburgerButton.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(62)
        }
        
        pageController.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(6)
            $0.width.equalTo(30)
        }
        
        locationCollectionView.snp.makeConstraints {
            $0.height.equalTo(CGFloat(667).adjusted)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
//            $0.top.equalTo(locationView.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        
        hamburgerButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(18)
            $0.width.height.equalTo(44)
        }
        
        addLocationButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-18)
            $0.width.height.equalTo(44)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        locationCollectionView.delegate = self
    }
}

extension BaseLocationViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: CGFloat(666).adjusted)
    }
}
