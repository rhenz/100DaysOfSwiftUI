//
//  UIApplication.swift
//  WeSplit
//
//  Created by Lawrence on 7/26/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
