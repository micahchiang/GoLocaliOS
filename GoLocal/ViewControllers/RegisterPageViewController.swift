//
//  RegisterPageViewController.swift
//  GoLocal
//
//  Created by Micah Chiang on 1/26/16.
//  Copyright © 2016 Micah Chiang. All rights reserved.
//

import UIKit
import Alamofire

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBAction func registerButtonPressed(sender: UIButton) {
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let emailAddress = emailAddressTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordTextField.text!
        
        let parameters = [
            "firstName": firstNameTextField.text!,
            "lastName": lastNameTextField.text!,
            "emailAddress": emailAddressTextField.text!,
            "password": passwordTextField.text!
        ]
        
        //check for empty fields
        if firstName.isEmpty || lastName.isEmpty || emailAddress.isEmpty || password.isEmpty || confirmPassword.isEmpty
        {
            //dipslay alert message
            displayAlertMessage("No fields can be left empty")
        }
        //check if password and confirmPassword match
        if password != confirmPassword
        {
            displayAlertMessage("Passwords do not match")
        }
        //store data to db
        Alamofire.request(.POST, "http://localhost:8000/users", parameters: parameters, encoding: .JSON)
        //display alert message with confirmation.
        var successfulRegistration = UIAlertController(title: "Success!", message: "User Successfully Registered", preferredStyle: .Alert)
        let successAction = UIAlertAction(title: "Ok", style: .Default){
            action in self.dismissViewControllerAnimated(true, completion: nil)
        }
        successfulRegistration.addAction(successAction)
        self.presentViewController(successfulRegistration, animated: true, completion: nil)
    }
    
    //function for displaying alert message
    
    func displayAlertMessage(alert: String){
        var myAlert = UIAlertController(title: "Alert", message: alert, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
