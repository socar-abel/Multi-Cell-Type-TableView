//
//  CommonCellFactory.swift
//  SomaCustomTableView
//
//  Created by 김상우 on 2022/07/07.
//

import Foundation
import UIKit

class CommonCellFactory {
    public static func makeCell(tableView: UITableView, indexPath: IndexPath, viewItem: ViewItem)
    -> CommonCell?
    {
        guard let viewTypeID = viewItem.viewType else { return nil }
        guard let viewObject = viewItem.viewObject else { return nil }
        
        switch viewTypeID {
        case ViewType.oneLine.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: viewTypeID, for: indexPath) as! OneLineCell
            cell.bind(data: viewObject)
            cell.initCellUI()
            return cell
            
        case ViewType.twoLine.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: viewTypeID, for: indexPath) as! TwoLineCell
            cell.bind(data: viewObject)
            cell.initCellUI()
            return cell
            
        case ViewType.oneImage.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: viewTypeID, for: indexPath) as! OneImageCell
            cell.bind(data: viewObject)
            cell.initCellUI()
            return cell
            
        default:
            return nil
        }
    }
}
