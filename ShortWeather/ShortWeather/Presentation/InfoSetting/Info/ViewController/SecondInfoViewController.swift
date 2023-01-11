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

final class SecondInfoViewController: SettingBaseViewController {
    
    // MARK: - UI Components
    
    private let addInfoLabel: UILabel = UILabel()
    
    // MARK: - Properties
    
    private var user: User
    private let info: [String] = [
        "기상시간",
        "외출시간",
        "귀가시간",
    ]
    private var isCellTouched: [Bool] = [false, false, false]
    private let userProvider = MoyaProvider<UserService>(plugins:[NetworkLoggerPlugin()])
    private let defaults = UserDefaults.standard
    
    
    // MARK: - Initializer
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
    }
}

extension SecondInfoViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        addBackButton()
        
        titleLabel.do {
            $0.text = "여러분의 하루를 알려주세요"
        }
        
        infoCollectionView.do {
            $0.registerCell(EnterInfoCollectionViewCell.self)
        }
        
        addInfoLabel.do {
            $0.text = Letter.explainPurposeInfo
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray4
        }
        
        checkButton.do {
            $0.setTitle("확인", for: .normal)
            $0.addTarget(self, action: #selector(checkButtonDidTap), for: .touchUpInside)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(addInfoLabel)
        
        addInfoLabel.snp.makeConstraints {
            $0.bottom.equalTo(checkButton.snp.bottom).inset(71)
            $0.leading.equalTo(checkButton)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        infoCollectionView.dataSource = self
    }
    
    private func setCellState(cell: EnterInfoCollectionViewCell, indexPath: IndexPath) {
        if isCellTouched[indexPath.row] {
            switch indexPath.row {
            case 0:
                if user.wakeUpTime.isEmpty {
                    cell.unselectCell()
                } else {
                    cell.selectCell()
                }
            case 1:
                if user.goOutTime.isEmpty {
                    cell.unselectCell()
                } else {
                    cell.selectCell()
                }
            case 2:
                if user.goHomeTime.isEmpty {
                    cell.unselectCell()
                } else {
                    cell.selectCell()
                }
            default:
                break
            }
        } else {
            cell.untouched()
        }
    }
    
    private func checkButtonState() {
        if !user.wakeUpTime.isEmpty && !user.goOutTime.isEmpty && !user.goHomeTime.isEmpty {
            checkButton.setState(.allow)
        } else {
            checkButton.setState(.notAllow)
        }
    }
    
    // MARK: - @objc Methods
    
    @objc private func checkButtonDidTap() {
        user.deviceToken = String.createDeviceToken()
        userProvider.request(.postUser(param: user.makePostUserRequest())) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                if status >= 200 && status<300 {
                    do{
                        let data = try result.map(GeneralResponse<PostUserResponse>.self).data!
                        self.defaults.set(self.user.deviceToken, forKey: DataKey.deviceToken)
                        APIConstants.deviceToken = self.user.deviceToken
                        APIConstants.jwtToken = data.accessToken
                        UIViewController.modifyRootViewController(TodayWeatherViewController())
                    }
                    catch(let error){
                        print("실패!")
                        print(error.localizedDescription)
                    }
                }
                else if status >= 400{
                    print("요청 오류")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        UIViewController.modifyRootViewController(FirstInfoViewController())
    }
}

extension SecondInfoViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return info.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: EnterInfoCollectionViewCell.self, indexPath: indexPath)
        switch indexPath.row {
        case 0:
            cell.setDataBind(infoText: info[indexPath.row], data: user.wakeUpTime)
        case 1:
            cell.setDataBind(infoText: info[indexPath.row], data: user.goOutTime)
        case 2:
            cell.setDataBind(infoText: info[indexPath.row], data: user.goHomeTime)
        default:
            break
        }
        setCellState(cell: cell, indexPath: indexPath)
        checkButtonState()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isCellTouched[indexPath.row] = true
        switch indexPath.row {
        case 0:
            let vc = TimeInfoViewController(infoText: "\(info[indexPath.row]) 설정", infoType: .wakeUpTime)
            vc.delegate = self
            presentToHalfModalViewController(vc, infoType: .wakeUpTime)
        case 1:
            let vc = TimeInfoViewController(infoText: "\(info[indexPath.row]) 설정", infoType: .outTime)
            vc.delegate = self
            presentToHalfModalViewController(vc, infoType: .outTime)
        case 2:
            let vc = TimeInfoViewController(infoText: "\(info[indexPath.row]) 설정", infoType: .inTime)
            vc.delegate = self
            presentToHalfModalViewController(vc, infoType: .inTime)
        default:
            break
        }
    }
}

extension SecondInfoViewController: TimeInfoViewControllerDelegate {
    
    func getNullData() {
        infoCollectionView.reloadData()
    }
    
    func getInfoData(userInfoData: UserInfo) {
        let infoType = userInfoData.infoType
        if infoType == .wakeUpTime {
            user.wakeUpTime = userInfoData.infoData
        } else if infoType == .outTime {
            user.goOutTime = userInfoData.infoData
        } else if infoType == .inTime {
            user.goHomeTime = userInfoData.infoData
        }
        infoCollectionView.reloadData()
    }
}
