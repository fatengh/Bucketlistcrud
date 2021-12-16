//
//  ViewController.swift
//  Bucketlistcrud
//
//  Created by admin on 15/12/2021.
//

import UIKit

class BukitListViewController: UITableViewController , AddAndCancelDelegate  {
    
var MyList = ["Go to Mall", "Do Lundery" ,"Tv Show"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // rows number
        return MyList.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // list into table
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
            cell.textLabel?.text = MyList[indexPath.row]
            return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // remove by COMMIT
        MyList.remove(at: indexPath.row)
        tableView.reloadData()
    }
   
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // GO TO NEXT VIEW CONTROLLER BY ACCESSORY
        performSegue(withIdentifier: "EditSegue", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue to add by bar button
        if sender is UIBarButtonItem{ // Change sender.iden to avoid the error
          let navicontroller = segue.destination as! UINavigationController
          let addTbelController = navicontroller.topViewController as! AddViewController
          addTbelController.delegate = self
            // segue to edit by accessory
        } else if sender is IndexPath { // Change sender.iden to avoid the error
            let navicontroller = segue.destination as! UINavigationController
            let addTbelController = navicontroller.topViewController as! AddViewController
            addTbelController.delegate = self
            let indexPath = sender as! NSIndexPath
            let item = MyList[indexPath.row]
            addTbelController.item = item
            // send index to edit same row
            addTbelController.indexPath = indexPath
        }
    }
    func cancelButtonPressed(by controller: UIViewController) {
        // to back to table view
            dismiss(animated: true, completion: nil)
        }
    
    func addItemViewController(_ controller: AddViewController, didFinishAddingItem item: String , at indexPath: NSIndexPath?){
        // edit same row
        if let ip = indexPath {
            MyList[ip.row] = item
        }else {
            MyList.append(item)
        }
       // items.append("\(item)")
        tableView.reloadData()
        // dismiss  view controller 
        dismiss(animated: true, completion: nil)

        
    }

}



