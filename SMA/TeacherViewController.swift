//
//  TeacherViewController.swift
//  SMA
//
//  Created by Sunil Gurung on 5/9/17.
//  Copyright © 2017 Impactit. All rights reserved.
//

import UIKit

class TeacherViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UITableViewDataSource,UITableViewDelegate {

    
    
    @IBOutlet weak var btnmenu: UIBarButtonItem!
    @IBOutlet weak var informationtableview: UITableView!
    @IBOutlet weak var staffcollectionview: UICollectionView!
   
     var teacher = ["nepal1","nepal2","nepal3"]
    var staffname = ["Principal","BOD","Vice Principal"]
    
     var informationicon = ["name-Icon-Small","address-Icon-Small","message-Icon-Small","phone2-Icon-Small","subject-Icon-Small"]
    var detailinformation = ["Name","Address","Email","Phone","Subject"]
    //Collection Identifieder
    let  teachercollectionviewIdentifier = "staffCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        staffcollectionview.delegate = self
        staffcollectionview.dataSource = self
//        
//        informationtableview.delegate = self
//        informationtableview.dataSource = self
        
        btnmenu.target = self.revealViewController()
        btnmenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
      
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return informationicon.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellInformation = tableView.dequeueReusableCell(withIdentifier: "informationCell", for: indexPath) as! TecherTableViewCell
        
        cellInformation.informationicon.image=UIImage(named: informationicon[indexPath.row])
        cellInformation.lblinformation.text = detailinformation[indexPath.row]
        

        return (cellInformation)
        
    }
    

    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return video.count
        
        return teacher.count // Replace with count of your data for collectionViewB
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cellStaff = collectionView.dequeueReusableCell(withReuseIdentifier: "staffCell", for: indexPath) as! TeacherCollectionViewCell
        
        cellStaff.layer.cornerRadius = 5
        cellStaff.layer.borderColor = UIColor.white.cgColor
        cellStaff.layer.borderWidth = 1
        cellStaff.staffimage.image = UIImage(named: teacher[indexPath.row])
        cellStaff.lblstaff.text = staffname[indexPath.row]
        
        return cellStaff
    }
    
    
    

}



