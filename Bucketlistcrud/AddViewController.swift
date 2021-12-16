//
//  AddTableViewController.swift
//  Bucketlistcrud
//
//  Created by admin on 15/12/2021.
//

import UIKit

class AddViewController: UIViewController {
    weak var delegate: AddAndCancelDelegate?
    var item : String?
    var indexPath : NSIndexPath?
    
    @IBOutlet weak var itemAddTextField: UITextField!
    
    @IBAction func AddPressed(_ sender: UIBarButtonItem) {
        delegate?.addItemViewController( self, didFinishAddingItem: itemAddTextField.text! , at: indexPath)

    }
    @IBAction func cancelPresswd(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        itemAddTextField.text = item

    }

    

}
