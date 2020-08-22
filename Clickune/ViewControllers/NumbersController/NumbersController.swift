//
//  NumbersController.swift
//  Clickune
//
//  Created by Олег Романов on 11.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    var costLabel: UILabel = {
        let costLabel = UILabel()
        costLabel.textAlignment = .right
        costLabel.numberOfLines = 0
        return costLabel
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(costLabel)
    }
    
    func makeConstraints() {
        costLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    
    func configure(_ text: String) {
        costLabel.text = text
        
    }
}

class NumbersController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(Cell.self, forCellReuseIdentifier: "CELL")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    } ()
    
    var data: [String: [Int]] = [
        "One" : [4, 5 ,1],
        "Two": [5, 0, 1],
        "Three": [0, 0, 1, 1, 3, 5, 1]
    ]
    
    override func loadView() {
        view = tableView
    }
}

extension NumbersController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let index = data.index(data.startIndex, offsetBy: section)
        let key = data.keys[index]
        return key
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index = data.index(data.startIndex, offsetBy: section)
        let key = data.keys[index]
        return data[key]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as? Cell
        let index = data.index(data.startIndex, offsetBy: indexPath.section)
        let key = data.keys[index]
        cell?.configure("\(data[key]?[indexPath.row] ?? 0)")
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = DateSectionHeader()
        sectionHeader.configure(date: Date())
        return sectionHeader
    }
}

extension NumbersController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
