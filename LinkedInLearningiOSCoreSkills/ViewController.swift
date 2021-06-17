//
//  ViewController.swift
//  LinkedInLearningiOSCoreSkills
//
//  Created by Hu, Tyler on 11/3/20.
//  Copyright © 2020 Hu, Tyler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var textBoxLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tyler::viewDidLoad - executed")
        nameLabel.text = "Hello No Name Person"
        textBox.delegate = self //without this textFieldShouldReturn() will not run after hitting the return key on soft keyboard
        textBox.becomeFirstResponder() //brings up soft keyboard
        textBoxLastName.delegate = self
        textBoxLastName.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    /*
     Link to the button on Main StoryBoard
     */
    @IBAction func buttonPress(_ sender: Any) {
        nameLabel.text = "Hello \(textBox.text!) \(textBoxLastName.text!)"
        showToast(controller: self, message: "Button Tapped", seconds:1)
        textBox.resignFirstResponder() //close soft keyboard
    }
    
    /*
     Notifies the view that it's been touch, so we hide soft keyboard
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true) //same as textBox.resignFirstResponder() but force is true and the view refers to self
    }
    
    
    
    /*
     This function is from our UITextFieldDelegate, essentially
     when the enter key is pressed, this function will return the item that was pressed with, in the
     case below we are hiding our soft keyboard
     In Addition we changed the "return" to say "done" by going to
     attributes of the textfield -> text input trait -> return key -> done
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Tyler::textFieldShouldReturn - executed")
        if textField.tag == 0 {
            textBoxLastName.becomeFirstResponder()
        } else if textField.tag == 1{
            textBoxLastName.resignFirstResponder()//soft keyboard
        }
        
        return false
    }
    
    /*
     Just a way of showing toast messages on iOS Swift
     */
    func showToast(controller: UIViewController, message : String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
                alert.dismiss(animated: true)
        }
    }
        
}

