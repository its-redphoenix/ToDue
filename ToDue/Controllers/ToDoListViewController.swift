//
//  ToDoListViewController.swift
//  ToDue
//
//  Created by Angela on 02/06/20.
//  Copyright © 2020 Angela. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let newItem = Item()
        newItem.title = "Buy Dahi Wada"
        itemArray.append(newItem)
        
        let newItem2 = Item()
           newItem2.title = "Buy Pav Bhaji"
           itemArray.append(newItem2)
        
        let newItem3 = Item()
                  newItem3.title = "Buy Sev Puri"
                  itemArray.append(newItem3)
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
        
        let item = itemArray[indexPath.row]

        cell.textLabel?.text = item.title
        
        
        //Ternary operator
        // value = condition ? valueIfTrue : valueIfFalse
               
        cell.accessoryType = item.done ? .checkmark : .none
        
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        //has been populated as the text for the current row

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        //this will make the deselected animation
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        

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
           
            let newItem = Item()
            newItem.title = textField.text!
            
            
          //  self.itemArray.append(textField.text!)
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