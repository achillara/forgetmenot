//
//  DetailViewController.swift
//  Forget Me Not
//
//  Created by Anusha Chillara on 1/27/15.
//  Copyright (c) 2015 Chillara. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var toDoData:NSDictionary=NSDictionary()
    
    @IBOutlet var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        titleTextField.userInteractionEnabled=false
        titleTextField.text=toDoData.objectForKey("itemTitle")as NSString
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
