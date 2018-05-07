//
//  Validator.swift
//  task1and4
//
//  Created by Сергей Никулин on 06.05.2018.
//  Copyright © 2018 SNikulin. All rights reserved.
//

import Foundation

struct Validator {
    
    static func validate(login string: String) -> Bool {
        let regex = "^(?=[a-zA-z0-9@.-]{2,32}$)(([A-Za-z][A-Z0-9a-z.-]*@[A-Z0-9a-z-]+\\.[a-zA-Z]{2,})|([A-Za-z][A-Z0-9a-z-.]*))"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: string)
    }
}
