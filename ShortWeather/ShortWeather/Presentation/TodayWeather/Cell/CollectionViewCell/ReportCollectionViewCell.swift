//
//  ReportCollectionViewCell.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/06.
//

import UIKit

class ReportCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let reportLabel: UILabel = UILabel()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReportCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.layer.cornerRadius = 13
        contentView.clipsToBounds = true
        reportLabel.font = .fontGuide(.caption1)
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubview(reportLabel)
        
        reportLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(4)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Methods
    
    public func setMainReportCellData(reportType: ReportType, mainReport: String) {
        switch reportType {
        case .none:
            break
        case .hot:
            contentView.backgroundColor = Color.dustBad2
        case .cold:
            contentView.backgroundColor = Color.pointColor
        case .dust:
            contentView.backgroundColor = Color.weatherYellow
        }
        reportLabel.text = mainReport
        reportLabel.textColor = Color.white
    }
    
    public func setDustCellBind(dustType: DustType, dustState: DustStateType) {
        switch dustType {
        case .dust:
            reportLabel.text = Letter.dust
        case .fineDust:
            reportLabel.text = Letter.fineDust
        }
        switch dustState {
        case .good:
            setCellColor(Color.dustGood2)
        case .normal:
            setCellColor(Color.dustNormal2)
        case .bad:
            setCellColor(Color.dustBad2)
        case .worst:
            setCellColor(Color.dustWorst2)
        }
    }
    
    public func adjustCellSize(label: String) -> CGSize {
        self.reportLabel.text = label
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: 26)
        return self.contentView.systemLayoutSizeFitting(targetSize,
                                                        withHorizontalFittingPriority:.fittingSizeLevel,
                                                        verticalFittingPriority: .required)
    }
    
    private func setCellColor(_ color: UIColor) {
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = color.cgColor
        reportLabel.textColor = color
    }
}
