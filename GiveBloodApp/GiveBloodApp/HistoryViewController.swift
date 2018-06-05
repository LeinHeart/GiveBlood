//
//  HistoryViewController.swift
//  GiveBloodApp
//
//  Created by Kristopher Chayadi on 05/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let lokasi:[String : String] = ["Living World" : "AlamSutra","MOAS" : "Alam Sutra","SMS" : "Gading Serpong"]
    let keyLokasi:[String] = ["Living World","MOAS","SMS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lokasi.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! HistoryTableViewCell
        
        cell.lokasiLbl.text = keyLokasi[indexPath.row]
        
        
        cell.alamatLbl.text = lokasi[keyLokasi[indexPath.row]]
        
        
        return cell
    }

}
