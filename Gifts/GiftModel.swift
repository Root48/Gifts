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
    
//    let giftsName = ["Bike", "Phone", "Ball", "Book", "Laptop"]
//    let giftPrise = [25, 10, 2, 3, 15]
    convenience init(name: String, price: String) {
        self.init()
        self.name = name
        self.price = price
    }
    
}
