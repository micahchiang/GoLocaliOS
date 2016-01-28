//
//  dashboardViewController.swift
//  GoLocal
//
//  Created by Micah Chiang on 1/27/16.
//  Copyright © 2016 Micah Chiang. All rights reserved.
//

import UIKit

class dashboardViewController: UIViewController {
    
    var currentUser: Array<Dictionary<String, AnyObject>> = []
    var firstName: String = ""
    var lastName: String = ""
    var userID: String = ""
    var userEmail: String = ""
    
    @IBOutlet weak var userNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //print(currentUser[0]["firstName"])
        
        print(firstName)
        setUser()
        userNameLabel.text! = "Welcome, " + firstName
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //sets user info
    func setUser(){
        firstName = currentUser[0]["firstName"] as! String
        lastName = currentUser[0]["lastName"] as! String
        userID = currentUser[0]["_id"] as! String
        userEmail = currentUser[0]["emailAddress"] as! String
    }
    

    //logout sets current user to empty array, dismisses vc
    @IBAction func logoutButtonTapped(sender: UIBarButtonItem) {
        
        currentUser.removeAtIndex(0)
        firstName = ""
        lastName = ""
        userID = ""
        userEmail = ""
        print(currentUser)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
