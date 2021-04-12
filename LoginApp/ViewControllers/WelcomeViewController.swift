//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Vladislav on 31.05.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var welcomeUserLabel: UILabel!
    
    // MARK: - Public properties
    var userName: String!
    
    // MARK: - Lyfe Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeUserLabel.text = "Привет, \(userName!)!"
    }

}
