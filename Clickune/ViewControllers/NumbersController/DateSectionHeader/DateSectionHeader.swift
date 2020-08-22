//
//  DateSectionHeader.swift
//  Clickune
//
//  Created by Олег Романов on 18.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

final class DateSectionHeader: UIView {
    // MARK: - Properties
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter
    } ()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubviews()
        makeConstraints()
        setupStyle()
    }
    
    private func setupStyle() {
        
    }
    
    private func addSubviews() {
        addSubview(label)
    }
    
    private func makeConstraints() {
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Internal methods
    
    func configure(date: Date) {
        label.text = dateFormatter.string(from: date)
        
    }
}
