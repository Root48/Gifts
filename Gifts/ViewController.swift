//
//  ViewController.swift
//  Gifts
//
//  Created by Admin on 31.07.2021.
//

import UIKit
import RealmSwift

class ViewController: UITableViewController {
    
    var gifts: Results<Gift>!
    var coin = 0
    
    var priceArray = [Int]()
    var sum = 0
    var indexArray = [Int]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsMultipleSelection = true
        gifts = realm.objects(Gift.self)
        self.navigationItem.title = "\(coin)/100"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifts.isEmpty ? 0 : gifts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
      
        let gift = gifts[indexPath.row]
        
        cell.nameOfGiftLabel.text = gift.name
        cell.priceGiftLabel.text = gift.price
        
        cell.selectionStyle = .none
            if
                let selectedRows = tableView.indexPathsForSelectedRows,
                selectedRows.contains(indexPath)
            {
                cell.accessoryType = .checkmark

            } else {
                cell.accessoryType = .none
            }
        
        if indexArray.contains(indexPath.row) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
            return cell
        }
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let gift = gifts[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
            
            StorageManager.deleteObject(gift)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [deleteAction]
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let cell = self.tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark

            let gift = gifts[indexPath.row]
        
            coin = coin + Int(gift.price)!

            priceArray.append(Int(gift.price)!)
            print(priceArray)
            indexArray.append(indexPath.row)
            print(indexArray)
            sum = priceArray.reduce(0, +)
            self.navigationItem.title = "\(sum)/100"
        
            if sum > 100 {
                
                while sum > 100 {
                    priceArray.removeFirst()
                    print(priceArray)
                    sum = priceArray.reduce(0, +)
                    tableView.reloadData()
                    indexArray.removeFirst()
                    print(indexArray)
                    self.navigationItem.title = "\(sum)/100"

                }
            }
        }
        
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            let cell = self.tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .none
        
        let gift = gifts[indexPath.row]
        
        
        
            coin = coin - Int(gift.price)!
        self.navigationItem.title = "\(coin)/100"
        
        
        
        }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newGiftVC = segue.source as? NewGiftViewController else { return }
        
        newGiftVC.saveNewGift()
        tableView.reloadData()
        
    }

}

