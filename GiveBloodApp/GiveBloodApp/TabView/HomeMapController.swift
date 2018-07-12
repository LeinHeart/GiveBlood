//
//  HomeMapController.swift
//  GiveBloodApp
//
//  Created by Terretino on 06/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit
import CoreData


class HomeMapController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var tesNama: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tesGolDar: UILabel!
    @IBOutlet weak var backGround: UIImageView!
    @IBOutlet weak var buttonTips: UIButton!
    @IBOutlet weak var addPictureBtn: UIButton!
    
    
    let keyLokasi: [String] = ["Mall @ Alam Sutera", "AEON Mall BSD"]
    let namaUDDLagi: [String] = ["Donor United", "Kuy Donor"]
    var profile = [Profile]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicture.layer.cornerRadius = profilePicture.frame.size.width/2
        profilePicture.clipsToBounds = true
        tableView.delegate = self
        tableView.dataSource = self
        backGround.image = (UIImage(named: "atasanHome"))
        buttonTips.layer.cornerRadius = 10
//        self.navigationController?.navigationBar.na
//        self.preferredStatusBarStyle = .lightContent
        
        /*profilePicture.image = self.profilePicture.image
        let imageData:NSData = UIImagePNGRepresentation(profilePicture.image!)! as NSData
        
        UserDefaults.standard.set(imageData, forKey: "savedImage")
        
        let data = UserDefaults.standard.object(forKey: "savedImage") as! NSData
        profilePicture.image = UIImage(data: data as Data)*/
        let fetchRequest: NSFetchRequest<Profile> = Profile.fetchRequest()

        do {
            let profile = try PersistenceService.context.fetch(fetchRequest)
            self.profile = profile
            tesNama.text = "Hi, " + profile[0].name!
            tesGolDar.text = profile[0].goldar
        } catch {}
        
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            profilePicture.image = image
        } else {
            
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addPicture(_ sender: Any) {
        
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(image, animated: true)
            addPictureBtn.isHidden = true
        
}
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue)
    {
        
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
