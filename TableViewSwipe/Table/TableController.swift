//
//  Copyright © 2018 Jose Martinez. All rights reserved.
//

import UIKit

protocol TableControllerDelegate: class {
    func shouldReloadTableView()
}

/// This Controller acts as the real CONTROLLER of the MVC approach.
/// It will send the logic to the VIEW through a delegate.

class TableController: NSObject {
    
    private var model = Model(options: ["F.C. Barcelona", "Real Madrid", "Atlético de Madrid", "Valencia C.F."]) {
        didSet {
            delegate?.shouldReloadTableView()
        }
    }
    
    weak var delegate: TableControllerDelegate?
    
}

extension TableController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: Cell.self),
            for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        
        cell.setup(title: model.options[indexPath.row])
        
        return cell
    }
    
}

extension TableController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextualAction = UIContextualAction(
            style: UIContextualAction.Style.normal,
            title: "Add") {
                [weak self] (action, sourceView, actionPerformed) in
                guard let `self` = self else {
                    actionPerformed(false)
                    return
                }
                
                self.model.append(string: "Córdoba C.F.")
                actionPerformed(true)
        }
        
        contextualAction.backgroundColor = UIColor.purple
        
        return UISwipeActionsConfiguration(actions: [contextualAction])
    }
    
}
