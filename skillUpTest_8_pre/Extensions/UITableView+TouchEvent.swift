//
//  UITableView+TouchEvent.swift
//  skillUpTest_8_pre
//
//  Created by S N on 2018/01/29.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
    }
}
