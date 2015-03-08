//
//  FirstViewController.swift
//  Forget Me Not
//
//  Created by Anusha Chillara on 12/29/14.
//  Copyright (c) 2014 Chillara. All rights reserved.
//

import UIKit
import CoreLocation

var items:[String]=[]

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,CLLocationManagerDelegate,UITextFieldDelegate
{

    @IBOutlet var tasksTable: UITableView!
    
    @IBOutlet var toDoItems: UITextField!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addItem(sender: AnyObject) {
        // Add Item Button
        items.append(toDoItems.text)
        let fixedtoDoItems=items
        println(items)
        NSUserDefaults.standardUserDefaults().setObject(fixedtoDoItems, forKey: "items")
        NSUserDefaults.standardUserDefaults().synchronize()
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func  touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel.text=items[indexPath.row]
        return cell
        
    }
    override func viewWillAppear(animated: Bool) {
        if var storedtoDoItems: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("items")
        {
            items=[]
            for var i=0; i<storedtoDoItems.count; ++i{
                items.append(storedtoDoItems[i] as NSString)
            }
        }
        
        tasksTable!.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if(editingStyle == UITableViewCellEditingStyle.Delete) {
            let fixedtoDoItems=items
            
            items.removeAtIndex(indexPath.row)
            tableView .deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            NSUserDefaults.standardUserDefaults().setObject(fixedtoDoItems, forKey: "items")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            tasksTable!.reloadData()
            
        }

    
   

    
    
    
    /*override func awakeFromNib() {
        super.awakeFromNib()
        
        //Core Location
        manager.delegate = self
        manager.desiredAccuracy=kCLLocationAccuracyHundredMeters
        manager.requestAlwaysAuthorization()
        manager.distanceFilter=kCLDistanceFilterNone
        manager.startUpdatingLocation()*/
        
    }
    

        
        
        
        /*func application(application:UIApplication, didFinishLaunchingWithOptions launchOptions:NSDictionary)-> Bool{
        
        
        if NSUserDefaults.standardUserDefaults().boolForKey("hasAlreadyLaunched"){
        NSUserDefaults.standardUserDefaults().setBool(false,forKey:"hasAlreadyLaunched")
        }
        else{
        var alert = UIAlertController(title: "Verify Location", message: "Save current location as home?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default,  handler: {action in}))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default,  handler: {action in}))
        self.dismissViewControllerAnimated(true, completion: nil )
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "hasAlreadyLaunched")
        }
        return true
        }*/
       }
