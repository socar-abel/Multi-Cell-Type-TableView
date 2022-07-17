import UIKit

// CommonCell -> OneLineCell, TwoLineCell, OneImageCell
protocol CommonCell: UITableViewCell {
    func bind(data: ViewObject)
    func initCellUI()
}

enum ViewType: String {
    case oneLine = "ONE_LINE_TEXT"
    case twoLine = "TWO_LINE_TEXT"
    case oneImage = "ONE_IMAGE"
}
