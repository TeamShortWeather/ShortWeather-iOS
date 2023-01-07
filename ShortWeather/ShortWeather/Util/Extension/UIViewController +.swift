//
//  UIViewController +.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/01.
//

import UIKit

extension UIViewController {

    public static func modifyRootViewController (_ viewController: UIViewController) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let navigationViewController = UINavigationController(rootViewController: viewController)
        sceneDelegate?.window?.rootViewController = navigationViewController
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    public func addBackButtonNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: Image.icnExpandLeft,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backButtonDidTap))
        navigationItem.leftBarButtonItem?.tintColor = Color.black
    }
    
    @objc private func backButtonDidTap() {
        popToSettingViewController()
    }
    
    private func popToSettingViewController() {
        navigationController?.popViewController(animated: true)
    }
}
