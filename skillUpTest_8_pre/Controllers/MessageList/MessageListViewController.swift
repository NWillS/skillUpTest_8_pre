//
//  MessageListViewController.swift
//  skillUpTest_8_pre
//
//  Created by S N on 2018/01/25.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit

class MessageListViewController: UIViewController {
    @IBOutlet weak private var messageTableView: UITableView!
    @IBOutlet weak private var messageTextView: UITextView!
    @IBOutlet weak private var sendButton: UIButton!
    @IBOutlet weak private var bottom: NSLayoutConstraint!
    
    let dataSource = MessageTableViewProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(MessageListViewController.keyboardWillShow(_:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(MessageListViewController.keyboardWillHide(_:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
        
        messageTableView.dataSource = dataSource
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.separatorStyle = .none
        
        messageTextView.delegate = self

        reloadTableView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(messageTextView.isFirstResponder)
        if messageTextView.isFirstResponder {
            messageTextView.resignFirstResponder()
        }
        self.view.endEditing(true)
    }

    @IBAction func tappedSendButton(_ sender: UIButton) {
        guard let message = messageTextView.text else {
            return
        }
        sendButton.isEnabled = false
        MessageDao.addMessage(text: message)
        reloadTableView()
    }
    
    func reloadTableView() {
        let result = MessageDao.getAllMessages()
        dataSource.set(messageList: result.0, groupList: result.1)
        messageTextView.text = ""
        messageTableView.reloadData()
        scrollToNewMessage()
    }
    func scrollToNewMessage() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            let section = self.messageTableView.numberOfSections
            if section > 0 {
                let row = self.messageTableView
                    .numberOfRows(inSection: section - 1)
                
                let indexPath = IndexPath(row: row - 1, section: section - 1)
                
                self.messageTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        
        if let userInfo = notification.userInfo {
            if let keyboard = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
                let keyBoardRect = keyboard.cgRectValue
                
                self.bottom.constant = keyBoardRect.size.height
                scrollToNewMessage()
            }
        }
        
    }
    @objc func keyboardWillHide(_ notification: Notification) {
        
        self.bottom.constant = 0
        scrollToNewMessage()
    }
}

extension MessageListViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        sendButton.isEnabled = !(textView.text.isEmpty)
    }
}
