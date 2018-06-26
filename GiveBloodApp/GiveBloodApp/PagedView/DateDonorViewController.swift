//
//  DateDonorViewController.swift
//  GiveBloodApp
//
//  Created by Kristopher Chayadi on 26/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit

class DateDonorViewController: UIViewController {

    let picker = UIDatePicker()
    var dateString:String = ""
    
    @IBOutlet weak var lastDonor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let dateToolbar = UIToolbar()
        dateToolbar.sizeToFit()
        let dateDone = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(dateDonePressed))
        dateToolbar.setItems([dateDone], animated: false)
        lastDonor.inputAccessoryView = dateToolbar
        lastDonor.inputView = picker
        picker.datePickerMode = .date
        
        // Do any additional setup after loading the view.
    }
    
        @objc func dateDonePressed() {
        
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            dateString = formatter.string(from: picker.date)
            lastDonor.text = dateString
            self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        let profile = Profile(context: PersistenceService.context)
        profile.terakhirDonor = dateString
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}