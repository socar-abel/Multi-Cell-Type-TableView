import UIKit
import SnapKit

class MainViewController: UIViewController {
    lazy var customTableView = CustomTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        initUI()
    }
    
    func setTableView() {
        let data = Data(jsonData.utf8)
        guard let parsedData = try? JSONDecoder().decode(Entity.self, from: data) else { return }
        
        customTableView = {
            let tableView = CustomTableView(viewController: self, data: parsedData.viewItems)
            return tableView
        }()
    }
    
    func initUI() {
        view.backgroundColor = .white
        view.addSubview(customTableView)
        
        customTableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-100)
        }
    }
}

