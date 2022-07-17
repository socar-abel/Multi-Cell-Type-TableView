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
        register(OneLineCell.self, forCellReuseIdentifier: ViewType.oneLine.rawValue)
        register(TwoLineCell.self, forCellReuseIdentifier: ViewType.twoLine.rawValue)
        register(OneImageCell.self, forCellReuseIdentifier: ViewType.oneImage.rawValue)
    }
    
    func setDatasource(_ viewController: UIViewController, _ data: [ViewItem]) {
        customDataSource = CustomTableViewDataSource(data: data)
        self.dataSource = customDataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
