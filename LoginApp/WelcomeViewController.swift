//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Mary Jane on 23.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var helloLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        helloLabel.text = "Hello, " + userName
    }
    
    @IBAction func LogOutButtonPressed() {
        dismiss(animated: true)
    }
}
