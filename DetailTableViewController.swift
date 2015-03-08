//
//  DetailTableViewController.swift
//  Forget Me Not
//
//  Created by Anusha Chillara on 2/17/15.
//  Copyright (c) 2015 Chillara. All rights reserved.
//

import UIKit



class DetailTableViewController: UITableViewController {
    var item:Item!
    
    required init(coder aDecoder:NSCoder){
        println("init DetailTableViewController")
        super.init(coder:aDecoder)
    }
    
    deinit{
        println("deinit DetailTableViewController")
    }
    
    
    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

        override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      textField.becomeFirstResponder()
    }

   
    

        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier=="saveitemdetail"{
                item=Item(name: self.textField.text)
       
    }


}
}
