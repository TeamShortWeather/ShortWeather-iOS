//
//  WeekTestViewController.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/09.
//

import UIKit

import SnapKit
import Then

class WeekTestViewController: BaseLocationViewController {
    
    private let weekWeatherUIView: UIView = WeekWeatherUIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setting()

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WeekTestViewController {

    private func setting() {
        view.backgroundColor = .white
        view.addSubview(weekWeatherUIView)
        weekWeatherUIView.snp.makeConstraints {
            $0.top.equalTo(locationView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
