//
//  Copyright © 2018 Jose Martinez. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(title: String) {
        titleLabel.text = title
    }

}
