//
//  NewGiftViewController.swift
//  Gifts
//
//  Created by Admin on 31.07.2021.
//

import UIKit

class NewGiftViewController: UITableViewController {
    

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var giftName: UITextField!
    @IBOutlet weak var giftPrice: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        saveButton.isEnabled = false
        giftName.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    func saveNewGift() {
        
        let newGift = Gift(name: giftName.text!, price: giftPrice.text!)
        
        StorageManager.saveObject(newGift)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    @objc private func textFieldChange() {
        if giftName.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
}


    
