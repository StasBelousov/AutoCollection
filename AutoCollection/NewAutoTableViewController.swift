//
//  NewAutoTableViewController.swift
//  AutoCollection
//
//  Created by Станислав Белоусов on 20/09/2020.
//  Copyright © 2020 Станислав Белоусов. All rights reserved.
//

import UIKit

class NewAutoTableViewController: UITableViewController {
   
    var auto = Auto(brand: "", model: "", year: "", type: "", typeEmoji: "", isFavorite: false)
    
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    let typeMenuArray = ["Sedan","Coupe","Bus","Truck"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButton()
        updateUI()

    }
    @IBAction func textChanged(_ sender: Any) {
        updateSaveButton()
    }
    
    @IBAction func autoEmojiSelect (_ sender: UISegmentedControl) {
        saveButton.isEnabled = true
        switch typeSegmentedControl.selectedSegmentIndex {
        case 0:
            auto.type = typeMenuArray[0]
            auto.typeEmoji = typeSegmentedControl.titleForSegment(at: 0)!
            
        case 1:
             auto.type = typeMenuArray[1]
             auto.typeEmoji = typeSegmentedControl.titleForSegment(at: 1)!
        case 2:
            auto.type = typeMenuArray[2]
            auto.typeEmoji = typeSegmentedControl.titleForSegment(at: 2)!
        case 3:
            auto.type = typeMenuArray[3]
            auto.typeEmoji = typeSegmentedControl.titleForSegment(at: 3)!
        default:
            break;
        }
    }
    private func updateSaveButton() {
       
        let yearText = yearTextField.text ?? ""
        let brandText = brandTextField.text ?? ""
        let modelText = modelTextField.text ?? ""
        
        saveButton.isEnabled = !yearText.isEmpty && !brandText.isEmpty && !modelText.isEmpty
    }
    private func updateUI() {
       
        yearTextField.text = auto.year
        brandTextField.text = auto.brand
        modelTextField.text = auto.model
    }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            super.prepare(for: segue, sender: sender)
            guard segue.identifier == "saveSegue" else {return}
            
            let autoText = auto.typeEmoji
            let typeText = auto.type
            let yearText = yearTextField.text ?? ""
            let brandText = brandTextField.text ?? ""
            let modelText = modelTextField.text ?? ""
        
        self.auto = Auto(brand: brandText, model: modelText, year: yearText, type:typeText, typeEmoji: autoText, isFavorite: self.auto.isFavorite)
        }
    }
   

