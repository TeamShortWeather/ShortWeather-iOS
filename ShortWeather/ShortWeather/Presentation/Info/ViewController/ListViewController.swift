//
//  ListViewController.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/04.
//

import UIKit

import Moya
import SnapKit
import Then

protocol ListViewControllerDelegate: AnyObject {
    func sendData(pickData: String, listType: FirstInfoType, status: String)
}

final class ListViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let listTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Properties
    
    public let listType: FirstInfoType
    public weak var delegate: ListViewControllerDelegate?
    private var titleText: String
    private var listDatas: [String]
    private var selectStatus: String
    private let data: String = ""
    
    // MARK: - Initializer
    
    init(titleText: String, listDatas: [String], listType: FirstInfoType, status: String) {
        self.titleText = titleText
        self.listDatas = listDatas
        self.listType = listType
        self.selectStatus = status
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - View Life Cycle
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
    }
}

extension ListViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = titleText
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
        view.addSubviews(titleLabel, listTableView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(41)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(319)
        }
        
        listTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(375)
            $0.height.equalTo(500)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        listTableView.delegate = self
        listTableView.dataSource = self
    }
}

extension ListViewController: UITableViewDelegate {
    
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

extension ListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listDatas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(type: ListTableViewCell.self, indexPath: indexPath)
        cell.setDataBind(model: listDatas[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectStatus = "blue"
        delegate?.sendData(pickData: listDatas[indexPath.section], listType: listType, status: selectStatus)
//        print(selectStatus)
        if navigationController == nil {
            dismiss(animated: true, completion: nil)
        }
    }
}
