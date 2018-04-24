//
//  Copyright © 2018 Jose Martinez. All rights reserved.
//

import UIKit

/// This ViewController acts as a dummy VIEW. It doesn't handle any logic,
/// which will be performed by TableController, considered the CONTROLLER
/// of this MVC approach.

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private var tableController: TableController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableController()
    }
    
    private func configureTableController() {
        tableController = TableController()
        tableController?.delegate = self
        tableView.dataSource = tableController
        tableView.delegate = tableController
    }

}

extension ViewController: TableControllerDelegate {
    
    func shouldReloadTableView() {
        tableView.reloadData()
    }
    
}

