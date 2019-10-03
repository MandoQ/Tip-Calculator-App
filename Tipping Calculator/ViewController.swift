//
//  ViewController.swift
//  Tipping Calculator
//
//  Created by Mando Quintana on 8/22/19.
//  Copyright © 2019 Mando Quintana. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet var costTextField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var onePersonTotalText: UILabel!
    @IBOutlet var twoPeopleTotalText: UILabel!
    @IBOutlet var threePeopleTotalText: UILabel!
    @IBOutlet var customTotalText: UILabel!
    @IBOutlet var tipSegment: UISegmentedControl!
    @IBOutlet var guestNumberTextField: UITextField!
    @IBOutlet var oneGuestView: UIView!
    @IBOutlet var twoGuestView: UIView!
    @IBOutlet var customGuestView: UIView!
    var shouldAnimate = false
    @IBOutlet var threeGuestView: UIView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        tipSegment.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "Tip")
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        costTextField.keyboardType = .numberPad
       // costTextField.becomeFirstResponder()
        guestNumberTextField.keyboardType = .numberPad
     
    }
    
    @IBAction func didTapScreen(_ sender: Any) {
        shouldAnimate = false
        totalLabel.isHidden = false
        view.endEditing(true)
        returnAnimation()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipChoices = [0.15, 0.18, 0.25]
        let bill = Double(costTextField.text!) ?? 0
        let tip = bill * tipChoices[tipSegment.selectedSegmentIndex]
        let total = bill + tip
        let customNum = Double(guestNumberTextField.text!) ?? 0
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        onePersonTotalText.text = String(format: "$%.2f", total)
        twoPeopleTotalText.text = String(format: "$%.2f", total/2)
        threePeopleTotalText.text = String(format: "$%.2f", total/3)
        customTotalText.text = String(format: "$%.2f", total/customNum)
        
        if shouldAnimate == false{
            animate()
            shouldAnimate = true
        }
      
    }
    
    func animate(){
        UIView.animate(withDuration: 0.5, animations: {
            self.self.oneGuestView.center.y -= 200
            self.self.twoGuestView.center.y -= 220
            self.self.threeGuestView.center.y -= 240
            self.self.customGuestView.center.y -= 260
            self.totalLabel.isHidden = true
            
        })
    }
    
    func returnAnimation(){
        UIView.animate(withDuration: 0.01, animations: {
                   self.self.oneGuestView.center.y += 200
                   self.self.twoGuestView.center.y += 220
                   self.self.threeGuestView.center.y += 240
                   self.self.customGuestView.center.y += 260
               })
    }
    
    
    @IBAction func guestNumberDidChange(_ sender: Any) {
        let tipChoices = [0.15, 0.18, 0.25]
        let bill = Double(costTextField.text!) ?? 0
        let tip = bill * tipChoices[tipSegment.selectedSegmentIndex]
        let total = bill + tip
        
        let customNum = Double(guestNumberTextField.text!) ?? 0
        let final = total/customNum
        
        customTotalText.text = String(format: "$%.2f", final)
        animate()
    }
    
    
}

