//
//  ViewController.swift
//  GoLocal
//
//  Created by Micah Chiang on 1/26/16.
//  Copyright © 2016 Micah Chiang. All rights reserved.
//

import UIKit

protocol getUserRequestor: class {
    func retrieveUserInformation(resultArray: Array<AnyObject>)
    func retrieveFailed(error: NSError)
}

class ViewController: UIViewController, getUserRequestor {
    
    var userArray: [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn");
        
        if(!isUserLoggedIn)
        {
        self.performSegueWithIdentifier("segueToLoginView", sender: self)
        }
        print(userArray)
    }
    
    
    @IBAction func logoutButtonPressed(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn");
        self.performSegueWithIdentifier("segueToLoginView", sender: self)
    }
    
    
    //protocol functions
    func retrieveUserInformation(resultArray: Array<AnyObject>) {
        userArray.append(resultArray)
    }
    
    func retrieveFailed(error: NSError) {
        print(error)
    }

}

