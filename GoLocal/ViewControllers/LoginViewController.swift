//
//  LoginViewController.swift
//  GoLocal
//
//  Created by Micah Chiang on 1/26/16.
//  Copyright © 2016 Micah Chiang. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    weak var userDelegate: getUserRequestor?

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        let userEmail = userEmailTextField.text!
        let userPassword = userPasswordTextField.text!
        //create dictionary to pass to server side. 
        let parameters = [
            "email": userEmailTextField.text!,
            "password": userPasswordTextField.text!
        ]
        
        if userEmail.isEmpty || userPassword.isEmpty
        {
            displayErrorMessage("fields cannot be blank")
        }
        else //send params to server, search by email address.
        {
            Alamofire.request(.POST, "http://localhost:8000/login", parameters: parameters, encoding: .JSON).responseJSON { response in
                print(response.request) //original URL request
                print(response.response) //URL response
                print(response.data) //server data
                print(response.result) //result of response serialization
                var resultArray: Array<Dictionary<String, AnyObject>> = []
                if let JSON = response.result.value{
                    print("JSON: \(JSON)")
                    resultArray.append(JSON as! Dictionary)
                    print(resultArray)
                self.userDelegate?.retrieveUserInformation(resultArray)
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
                self.dismissViewControllerAnimated(true, completion: nil)
                }
            }
        }
    }
    
    
    //function for error message if fields are blank.
    func displayErrorMessage(errorMessage: String){
        let ac = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: .Alert)
        let alert = UIAlertAction(title: "ok", style: .Default, handler: nil)
        ac.addAction(alert)
        self.presentViewController(ac, animated: true, completion: nil)
    }

}
