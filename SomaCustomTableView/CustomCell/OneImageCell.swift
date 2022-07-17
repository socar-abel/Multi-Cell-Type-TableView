import UIKit
import SnapKit

class OneImageCell: UITableViewCell, CommonCell {
    var imageView1 = UIImageView()
    
    func bind(data: ViewObject) {
        let oneImageData = data as! OneImageViewObject
        guard let image = getImageFromURL(oneImageData.url) else { return }
        imageView1.image = image
        imageView1.contentMode = .scaleAspectFit
    }
    
    func initCellUI() {
        addSubview(imageView1)
        
        imageView1.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.height.equalTo(120)
            $0.centerX.equalToSuperview()
        }
    }
    
    func getImageFromURL(_ urlString: String?) -> UIImage? {
        guard let urlString = urlString else { return nil }
        guard let url = URL(string: urlString) else { return nil }
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        return nil
    }
}
