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
    
    let lokasi:[String : String] = ["Donor Darah United" : "1 Januari 2018","Yuk Donor Darah" : "24 Maret 2018","PMI cabang Tangerang" : "14 Mei 2018"]
    let keyLokasi:[String] = ["Donor Darah United","Yuk Donor Darah","PMI cabang Tangerang"]
    let gambar: UIImage = UIImage(named: "buspmi")!
    
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
        
        cell.gambarView.image = gambar
        cell.gambarView.layer.cornerRadius = 20
        
        return cell
    }

}
