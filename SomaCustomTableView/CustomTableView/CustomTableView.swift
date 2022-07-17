import UIKit

class CustomTableView: UITableView {
    var customDataSource: CustomTableViewDataSource!
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    convenience init(viewController: UIViewController, data: [ViewItem]) {
        self.init(frame: CGRect.zero, style: .plain)
        registerCells(viewController)
        setDatasource(viewController, data)
    }
    
    func registerCells(_ viewController: UIViewController) {
        register(OneLineCell.self, forCellReuseIdentifier: "ONE_LINE_TEXT")
        register(TwoLineCell.self, forCellReuseIdentifier: "TWO_LINE_TEXT")
        register(OneImageCell.self, forCellReuseIdentifier: "ONE_IMAGE")
    }
    
    func setDatasource(_ viewController: UIViewController, _ data: [ViewItem]) {
        customDataSource = CustomTableViewDataSource(data: data)
        self.dataSource = customDataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
