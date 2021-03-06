//
//  ViewController.swift
//  NSTextField
//
//  Created by Harry Ng on 10/3/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField: MyTextField!
    @IBOutlet var textView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.myDelegate = self
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func changeTextField(sender: AnyObject) {
        textField.stringValue = "Placeholder"
    }

}

extension ViewController: NSTextFieldDelegate {
    
    override func controlTextDidBeginEditing(obj: NSNotification) {
        print("did begin")
    }
    
    override func controlTextDidChange(obj: NSNotification) {
        print("did change")
    }
    
    override func controlTextDidEndEditing(obj: NSNotification) {
        print("did end")
    }
    
    func control(control: NSControl, textView: NSTextView, doCommandBySelector commandSelector: Selector) -> Bool {
        print("command selector: \(commandSelector)")
        if commandSelector == "insertNewline:" {
            print("intercept end")
            return true
        }
        return false
    }
    
}

extension ViewController: MyTextFieldDelegate {
    
    func itemDidStartEditing(textField: MyTextField) {
        print("my delegate")
    }
    
    func itemDidEndEditing(textField: MyTextField) {
        print("did end editing")
    }
    
}

extension ViewController: NSTextViewDelegate {
    
    func textViewDidChangeSelection(notification: NSNotification) {
        print("textView: \(textView.string)")
    }
    
}
