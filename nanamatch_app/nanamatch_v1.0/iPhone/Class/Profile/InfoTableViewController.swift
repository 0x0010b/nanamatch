//
//  InfoTableViewController.swift
//  nanamatch_v1.0
//
//  Created by Ernesto Gaspard on 2/07/18.
//  Copyright © 2018 Ernesto Gaspard. All rights reserved.
//

import UIKit

class InfoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Outlet declaration
    @IBOutlet weak var tblUserInfo: UITableView!
    
    var infoUser = [String]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.infoUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "InfoTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! InfoTableViewCell
        
        cell.infoContent = self.infoUser[indexPath.row]
        if indexPath.row == 0 {
            cell.infoTitle = "Address"
        } else if indexPath.row == 1 {
            cell.infoTitle = "Phone"
        } else if indexPath.row == 2 {
            cell.infoTitle = "Cell Phone"
        } else {
            cell.infoTitle = "Email"
        }
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblUserInfo.estimatedRowHeight = 120
        self.tblUserInfo.rowHeight = UITableViewAutomaticDimension
        
        UserBL.dataUser { (objBE) in
            self.infoUser.append(objBE.address)
            self.infoUser.append(objBE.phone)
            self.infoUser.append(objBE.cell_phone)
            self.infoUser.append(objBE.email)
            
            self.tblUserInfo.reloadData()
        }
        
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
