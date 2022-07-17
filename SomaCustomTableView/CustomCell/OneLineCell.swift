import UIKit
import SnapKit

class OneLineCell: UITableViewCell, CommonCell {
    var label = UILabel()
    
    func bind(data: ViewObject) {
        guard let oneLineData = data as? OneLineViewObject else { return }
        label.text = oneLineData.text1
        label.textColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    func initCellUI() {
        addSubview(label)
        label.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
