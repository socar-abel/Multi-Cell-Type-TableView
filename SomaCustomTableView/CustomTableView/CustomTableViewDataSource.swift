//
//  CustomTableViewDataSource.swift
//  SomaCustomTableView
//
//  Created by 김상우 on 2022/07/17.
//

import UIKit

class CustomTableViewDataSource: NSObject, UITableViewDataSource {
    var data = [ViewItem]()
    
    init(data: [ViewItem]) {
        super.init()
        self.data = data
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = CommonCellFactory.makeCell(tableView: tableView, indexPath: indexPath, viewItem: data[indexPath.row]) else { return UITableViewCell() }
        return cell
    }
}
