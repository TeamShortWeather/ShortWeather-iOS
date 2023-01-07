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

protocol ListInfoViewControllerDelegate: AnyObject {
    func getInfoData(selectData: String)
}

final class ListInfoViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let listTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Properties
    
    public weak var delegate: ListInfoViewControllerDelegate?
    private var infoText: String
    private var listData: [String]
    
    // MARK: - Initializer
    
    
    init(infoText: String, listData: [String]) {
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

extension ListInfoViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
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
        view.addSubviews(titleLabel, listTableView)
        
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

extension ListInfoViewController: UITableViewDelegate {
    
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

extension ListInfoViewController: UITableViewDataSource {
    
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
        delegate?.getInfoData(selectData: listData[indexPath.section])
        dismiss(animated: true)
    }
}
