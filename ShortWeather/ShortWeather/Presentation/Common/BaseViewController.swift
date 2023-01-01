//
//  ViewController.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2022/12/23.
//

import UIKit

import Moya
import SnapKit
import Then

class BaseViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let sideMenuView: UIView = UIView()
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDataBind()
    }
}

extension BaseViewController {
    
    // MARK: - Properties
    
    private func setUI() {
        view.backgroundColor = Color.white
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
    
    private func setDataBind() {
        
    }
    
    // MARK: - @objc Methods
}

