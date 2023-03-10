//
//  ListInfoView.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/10.
//

import UIKit

import Moya
import SnapKit
import Then

protocol ListInfoViewDelegate: AnyObject {
    func getInfoData(userInfoData: UserInfo)
    func getNullData()
}

final class ListInfoView: UIView {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let listTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Properties
    
    public weak var delegate: ListInfoViewControllerDelegate?
    private var infoText: String
    private var listData: [String]
    private let infoType: InfoType
    
    init(infoText: String, listData: [String], infoType: InfoType) {
        super.init(frame: .zero)
        self.infoText = infoText
        self.listData = listData
        self.infoType = infoType
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListInfoView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        titleLabel.do {
            $0.text = infoText
            $0.font = .fontGuide(.headline1)
            $0.textColor = .black
        }
        
        listTableView.do {
            $0.backgroundColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            $0.registerCell(ListTableViewCell.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(titleLabel, listTableView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(41)
            $0.leading.equalToSuperview().offset(28)
        }
        
        listTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        listTableView.delegate = self
        listTableView.dataSource = self
    }
}

extension ListInfoView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}

extension ListInfoView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: ListTableViewCell.self, indexPath: indexPath)
        cell.setDataBind(model: listData[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.getInfoData(userInfoData: UserInfo(infoData: listData[indexPath.section], infoType: infoType))
//        dismiss(animated: true)
    }
}
