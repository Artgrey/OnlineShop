//
//  ItemsTableViewController.swift
//  SampleProject
//
//  Created by iRent No. 3 on 2022-03-11.
//

import UIKit

class ItemsTableViewController: UITableViewController {

    // MARK: Vars
    var category: Category?
    
    var itemArray: [Item] = []
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.tableFooterView = UIView()
        self.title = category?.name
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if category != nil {
            loadItems()
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell

        cell.generateCell(itemArray[indexPath.row])
        
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemToAddItemSeg" {
            
            let vc = segue.destination as! AddItemViewController
            vc.category = category!
        }
    }

    // MARK: Load Items
    private func loadItems () {
        downloadItemsFromFirebase(withCategoryId: category!.id) { allItems in
            self.itemArray = allItems
            self.tableView.reloadData()
        }
    }
}
