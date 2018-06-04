//
//  Page ViewController.swift
//  GiveBloodApp
//
//  Created by Terretino on 04/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit

class Page_ViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    lazy var orderedViewController: [UIViewController] = {
        return [self.newVC(viewController: "pg1"),
        self.newVC(viewController: "pg2"),
        self.newVC(viewController: "pg3")]()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func newVC(viewController: String) -> UIViewController{
        return UIStoryboard(name: "main", bundle: nil).instantiateInitialViewController(withIddentifier: ViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        guard let viewControllerIndex = orderedViewController.index(of: viewController) {
            else return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        guard let previousIndex >= 0 {
            else return orderedViewController.last
        }
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
