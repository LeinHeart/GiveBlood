//
//  ViewControllerAfterMap.swift
//  GiveBloodApp
//
//  Created by Terretino on 25/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit

class ViewControllerAfterMap: UIViewController {
    
    
    @IBOutlet weak var sudahDonor: UIButton!
    
    var selectedString : String = ""
    @IBOutlet weak var judulEvent: UILabel!
    //@IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var sayaSudahBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        judulEvent.text = selectedString
        eventImage.image = UIImage(named: "buspmi")
        sudahDonor.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
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
