//
//  FirstViewController.swift
//  project
//
//  Created by Michael Wang on 10/26/19.
//  Copyright © 2019 Michael Wang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties
    
    @IBOutlet weak var AppName: UILabel!
    
    @IBOutlet weak var TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TextField.delegate = self
    }
    //MARK: UITextFieldDelegate
    
    //MARK: Actions

    @IBAction func Enter(_ sender: Any) {
        AppName.text = "Default"
    }
    
    
    
}

