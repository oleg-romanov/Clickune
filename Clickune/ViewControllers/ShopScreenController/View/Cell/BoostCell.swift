//
//  Cell.swift
//  Clickune
//
//  Created by Олег Романов on 14.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

class BoostCell: UITableViewCell {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.snp.contentHuggingHorizontalPriority = 100
        label.snp.contentHuggingVerticalPriority = 100
        return label
    } ()
    
    var boostLabel: UILabel = {
        let label = UILabel()
        label.snp.contentHuggingVerticalPriority = 200
        return label
    } ()
    
    var costLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.snp.contentHuggingHorizontalPriority = 200
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commontInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commontInit()
    }
    
    private func commontInit() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(boostLabel)
        addSubview(costLabel)
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(16)
        }
        boostLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.equalTo(titleLabel)
            make.bottom.equalToSuperview().offset(-12)
        }
        costLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel)
            make.leading.equalTo(titleLabel.snp.trailing).offset(4)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    func configure(boost: Boost) {
        titleLabel.text = boost.title
        boostLabel.text = "\(boost.boost)"
        costLabel.text = "\(boost.cost)"
    }
}
