//
//  AddDelegate.swift
//  Bucketlistcrud
//
//  Created by admin on 15/12/2021.
//

import Foundation
import UIKit
protocol AddAndCancelDelegate: class {
    func addItemViewController(_ controller: AddViewController, didFinishAddingItem item: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: UIViewController)

}
