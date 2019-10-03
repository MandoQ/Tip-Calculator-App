//
//  SettingViewController.swift
//  Tipping Calculator
//
//  Created by Mando Quintana on 9/24/19.
//  Copyright © 2019 Mando Quintana. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var tipSegement: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tipSegement.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "Tip")
    }
    
  
    @IBAction func selectedTip(_ sender: Any) {
        let tipChoices = [0, 1, 2]
        let selectedTip = tipChoices[tipSegement.selectedSegmentIndex]

        UserDefaults.standard.set(selectedTip, forKey: "Tip")
          
           
           print(selectedTip)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
