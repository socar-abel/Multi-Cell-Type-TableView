import UIKit
import SnapKit

class OneLineCell: UITableViewCell, CommonCell {
    var label = UILabel()
    
    func bind(data: ViewObject) {
        guard let oneLineData = data as? OneLineViewObject else { return }
        label.text = oneLineData.text1
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    func initCellUI() {
        addSubview(label)
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-10)
            $0.centerX.equalToSuperview()
        }
    }
}
