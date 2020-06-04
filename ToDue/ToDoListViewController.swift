//
//  ToDoListViewController.swift
//  ToDue
//
//  Created by Angela on 02/06/20.
//  Copyright © 2020 Angela. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["Buy Vegatables", "Buy Fresh Pav", "Make Pav Bhaji"]

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data sources

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemArray.count
    }
    //this is the number of rows based on the array count we assign to it

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        //cell has been created using ToDoItemCell identifier

        cell.textLabel?.text = itemArray[indexPath.row]
        //has been populated as the text for the current row

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        //this will make the deselected animation
        
        
       
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    //this we use to make the cell as the itemArray ka array


    
    //add button pressed action
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        //global variable to get the text field info
        
        let alert = UIAlertController(title: "Add New ToDue Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
           
            self.itemArray.append(textField.text!)
            // add the new item from the text field text to the array itemArray
            self.tableView.reloadData()
            //reload the table view to see the new entry
        }
        //these are all alert fields elements
        alert.addTextField { (alertField) in
            alertField.placeholder = "Create a new task!"
           textField = alertField
        }
        //this adds a textfield
        alert.addAction(action)
        
        //this all of the above wont make sense until you present the viewcontroller
        
        present(alert, animated: true, completion: nil)
        
        //this presents the view controller
    }
    

}
