//
//  ViewController.swift
//  testNSDatePicker
//
//  Created by Kristopher Chayadi on 11/07/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var myDateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - TextField Delegate Methods
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if textField == self.myDateTextField {
            textField.resignFirstResponder()
            
            //show SMDatePicker
            var picker: SMDatePicker = SMDatePicker()
            picker.pickerMode = UIDatePickerMode.date
            picker.showPickerInView(view, animated: true)
            picker.delegate = self as! SMDatePickerDelegate
            
            return false
        }
        return true
    }
    
    // MARK: SMDatePickerDelegate
    func datePicker(picker: SMDatePicker, didPickDate date: NSDate) {
        let dateFormater:DateFormatter = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy"
        let formatedDate:NSString = dateFormater.string(from: date as Date) as NSString
        self.myDateTextField.text = formatedDate as String
    }
    
    func datePickerDidCancel(picker: SMDatePicker) {
        print("Date Picker Cancel")
    }
}

