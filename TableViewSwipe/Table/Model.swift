//
//  Copyright © 2018 Jose Martinez. All rights reserved.
//

import Foundation

/// This model acts as the MODEL of the MVC approach.

struct Model {
    
    var options: [String]
    
    mutating func append(string: String) {
        options.append(string)
    }
}
