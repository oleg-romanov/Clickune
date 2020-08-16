//
//  ShopView.swift
//  Clickune
//
//  Created by Олег Романов on 14.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

class ShopView: UIView {

// MARK: - Init
    init() {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        return tableView
    } ()
    
    lazy var backFromShopButton: UIBarButtonItem = UIBarButtonItem(
        title: "Back",
        style: .plain,
        target: nil,
        action: nil
    )
    
    lazy var dataSource: ShopViewDataSourse = ShopViewDataSourse()
    
    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }
    
    private func setupStyle() {
        backgroundColor = .green
        dataSource.setTableView(tableView: tableView)
    }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints( { make in
            make.edges.equalToSuperview()
        })
    }
    
    func updateData(_ data: [Boost]) {
        dataSource.updateData(data)
    }
}
