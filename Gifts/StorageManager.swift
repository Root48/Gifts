//
//  StorageManager.swift
//  Gifts
//
//  Created by Admin on 31.07.2021.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ name: Gift) {
        
        try! realm.write {
            realm.add(name)
        }
    }
    
    static func deleteObject(_ gift: Gift) {
        
        try! realm.write {
            realm.delete(gift)
        }
    }
}
