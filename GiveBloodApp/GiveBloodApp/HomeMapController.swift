//
//  HomeMapController.swift
//  GiveBloodApp
//
//  Created by Terretino on 06/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit
import CoreData


class HomeMapController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tesNama: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let keyLokasi: [String] = ["Mall @ alam sutera", "Binus University"]
    let namaUDDLagi: [String] = ["Donor United", "Ayo Kita Donor"]
    
    var profile = [Profile]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let fetchRequest: NSFetchRequest<Profile> = Profile.fetchRequest()
        do {
            let profile = try PersistenceService.context.fetch(fetchRequest)
            self.profile = profile
            tesNama.text = profile[0].name
        } catch {}
        
        

        // Do any additional setup after loading the view.
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection Section: Int) -> Int {
        return namaUDDLagi.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! HomeMap
        
        cell.alamatUDD.text = keyLokasi[indexPath.row]
        
        cell.namaUDD.text = namaUDDLagi[indexPath.row]
        return cell
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
