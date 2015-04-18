//
//  ViewController.swift
//  BMInputBox
//
//  Created by Adam Eri on 10/02/2015.
//  Copyright (c) 2015 blackmirror media. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.showInputBox(.PlainTextInput)
    }

    func showInputBox (type: BMInputBoxStyle) {
        var inputBox = BMInputBox.boxWithStyle(type)

        // Customization
        //  inputBox.blurEffectStyle = .Light
        //  inputBox.numberOfDecimals = 2

        inputBox.title = "This is the title"
        inputBox.message = "This is a longer messages that can be wrapped into multiple lines but maximum three."

        inputBox.customiseInputElement = {(element: UITextField) in
            element.placeholder = "Custom placeholder"
            if element.secureTextEntry == true {
                element.placeholder = "Secure placeholder"
            }
            return element
        }

        inputBox.onSubmit = {(value: AnyObject...) in
            for text in value {
                if text is String {
                    NSLog("%@", text as! String)
                }
                else if text is NSDate {
                    NSLog("%@", text as! NSDate)
                }
                else if text is Int {
                    NSLog("%i", text as! Int)
                }
            }
        }

        inputBox.onCancel = {
            NSLog("Cancelled")
        }
        
        inputBox.show()
    }


//    lainTextInput         // Simple text field
//    case NumberInput            // Text field accepting numbers only - numeric keyboard
//    case PhoneNumberInput       // Text field accepting numbers only - phone keyboard
//    case EmailInput             // Text field accepting email addresses -  email keyboard
//    case SecureTextInput        // Secure text field for passwords
//    case LoginAndPasswordInput\

    // MARK: Button actions

    @IBAction func plainTextButton () {
        self.showInputBox(.PlainTextInput)
    }

    @IBAction func numberButton () {
        self.showInputBox(.NumberInput)
    }

    @IBAction func phoneNumberButton () {
        self.showInputBox(.PhoneNumberInput)
    }

    @IBAction func emailButton () {
        self.showInputBox(.EmailInput)
    }

    @IBAction func secureTextButton () {
        self.showInputBox(.SecureTextInput)
    }

    @IBAction func credentialsButton () {
        self.showInputBox(.LoginAndPasswordInput)
    }
}

