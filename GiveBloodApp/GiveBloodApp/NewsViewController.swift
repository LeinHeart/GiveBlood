//
//  NewsViewController.swift
//  GiveBloodApp
//
//  Created by Kristopher Chayadi on 05/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let judul:[String] = ["Blood donors network: A simple social innovation that can go a long way"]
    var image: UIImage = UIImage(named: "pmiguy")!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return judul.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! NewsTableViewCell
        
        cell.judulLbl.text = judul[indexPath.row]
        cell.gambarView.image = image
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "selectedNews", sender: nil)
    }
    @IBAction func unwindSegue(_ sender:UIStoryboardSegue)
    {
        
    }
    
    
}
