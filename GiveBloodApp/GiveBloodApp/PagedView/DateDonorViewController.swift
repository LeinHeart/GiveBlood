//
//  DateDonorViewController.swift
//  GiveBloodApp
//
//  Created by Kristopher Chayadi on 26/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit
import CoreData

class DateDonorViewController: UIViewController {

    @IBOutlet weak var selesaiButton: UIButton!
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
        
        selesaiButton.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    
        @objc func dateDonePressed() {
            let fetchRequest: NSFetchRequest<Profile> = Profile.fetchRequest()
            
            do {
                let profile = try PersistenceService.context.fetch(fetchRequest)
                
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                formatter.timeStyle = .none
                dateString = formatter.string(from: picker.date)
                lastDonor.text = dateString
                
                profile[0].terakhirDonor = dateString
                PersistenceService.saveContext()
                
            } catch {}
            
            self.view.endEditing(true)
            
            self.performSegue(withIdentifier: "toHomeID", sender: self)
            
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
