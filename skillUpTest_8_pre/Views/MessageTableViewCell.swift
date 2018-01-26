//
//  MessageTableViewCell.swift
//  skillUpTest_8_pre
//
//  Created by S N on 2018/01/25.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    @IBOutlet weak private var message: UITextView!
    @IBOutlet weak private var time: UILabel!
    
    func set(message: String, time: String) {
        setup()
        self.message.text = message
        self.time.text = time
    }
    
    private func setup() {
        let padding: CGFloat = 10
        let container = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        message.textContainerInset = container
        message.sizeToFit()
    }
}
