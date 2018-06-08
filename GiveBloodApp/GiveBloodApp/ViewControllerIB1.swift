//
//  ViewControllerIB1.swift
//  GiveBloodApp
//
//  Created by Terretino on 04/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit

class ViewControllerIB1: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let golDar = ["AB+", "A+", "B+", "O+", "O-", "B-", "A-", "AB-", "Tidak Tahu"]
    
    
    var tampungGolDar:String = ""
    
    @IBOutlet weak var isiNama: UITextField!
    @IBOutlet weak var buttonTitle: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var belumButton: UIButton!
    @IBOutlet weak var sudahButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true
        buttonTitle.layer.cornerRadius = 10
        belumButton.layer.cornerRadius = 10
        sudahButton.layer.cornerRadius = 10
        

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // returns the # of rows in each component..
    @IBAction func pilihButton(_ sender: Any) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return golDar.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return golDar[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        buttonTitle.setTitle(golDar[row], for: .normal)
        tampungGolDar = golDar[row]
        pickerView.isHidden = true
    }
    
    
    @IBAction func belumBtn(_ sender: Any) {
        let profile = Profile(context: PersistenceService.context)
        profile.name = isiNama.text!
        profile.goldar = tampungGolDar
        PersistenceService.saveContext()
        
        
    }
    
    
    @IBAction func sudahBtn(_ sender: Any) {
        let profile = Profile(context: PersistenceService.context)
        profile.name = isiNama.text!
        profile.goldar = tampungGolDar
        PersistenceService.saveContext()
        
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


