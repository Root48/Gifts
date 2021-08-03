//
//  GiftModel.swift
//  Gifts
//
//  Created by Admin on 31.07.2021.
//

import RealmSwift

class Gift: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var price = ""
    
    convenience init(name: String, price: String) {
        self.init()
        self.name = name
        self.price = price
    }
    
}
