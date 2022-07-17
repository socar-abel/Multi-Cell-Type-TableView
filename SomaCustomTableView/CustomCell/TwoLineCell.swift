import UIKit
import SnapKit

class TwoLineCell: UITableViewCell, CommonCell {
    var label1 = UILabel()
    var label2 = UILabel()
    
    func bind(data: ViewObject) {
        let twoLineData = data as! TwoLineViewObject
        label1.text = twoLineData.text1
        label2.text = twoLineData.text2
    }

    func initCellUI() {
        addSubview(label1)
        addSubview(label2)
        
        label1.textColor = .black
        label1.font = UIFont.boldSystemFont(ofSize: 18)
        label2.textColor = .darkGray
        label2.font = UIFont.boldSystemFont(ofSize: 14)
        
        label1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.snp.centerY)
        }
        
        label2.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-10)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.snp.centerY)
        }
    }
}
