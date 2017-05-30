//
//  TeacherViewController.swift
//  SMA
//
//  Created by Sunil Gurung on 5/9/17.
//  Copyright © 2017 Impactit. All rights reserved.
//

import UIKit

struct teacherinfo {
    let teacherName: String
    let teacherAddress: String
    let teacherEmail: String
    let teacherPhone: String
    let teacherSubject: String
}


class TeacherViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UITableViewDataSource,UITableViewDelegate {

    var teacherinfos = [teacherinfo]()
    
    @IBOutlet weak var btnmenu: UIBarButtonItem!
    @IBOutlet weak var informationtableview: UITableView!
    @IBOutlet weak var staffcollectionview: UICollectionView!
   
    var teacher = ["nepal1","nepal2","nepal3"]
    var staffname = ["Principal","BOD","Vice Principal"]
    
     //var informationicon = ["name-Icon-Small","address-Icon-Small","message-Icon-Small","phone2-Icon-Small","subject-Icon-Small"]
    //var detailinformation = ["Name","Address","Email","Phone","Subject"]
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
        
        getTeacherInfo()
        
        
    }
    
    func getTeacherInfo(){
        guard let path = Bundle.main.path(forResource: "teacher", ofType: "json") else {return}
        let url = URL(fileURLWithPath: path)
        
        do{
            let data = try  Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            //print(json)
            
            guard let array = json as?[Any] else {return}
            for stdinfo in array{
                guard let stdDict = stdinfo as?[String: Any] else {return}
                guard let teacherNames = stdDict["fullname"] as? String else{return }
                guard let teacherAddresss = stdDict["address"] as? String else {return}
                guard let teacherEmails = stdDict["email"] as? String else {return}
                guard let teacherPhones = stdDict["contact"] as? String else {return}
                guard let teacherSubject = stdDict["subject"] as? String else {return}
                
                print (teacherNames)
                print (teacherAddresss)
                print (teacherEmails)
                print (teacherPhones)
                print(teacherSubject)
                
                let teacher = teacherinfo(teacherName: teacherNames, teacherAddress: teacherAddresss, teacherEmail: teacherEmails, teacherPhone: teacherPhones, teacherSubject: teacherSubject)
                
                teacherinfos.append(teacher)
            }
        }
        catch{
            print("Error")
        }
        self.informationtableview.reloadData()
        //print(path)
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teacherinfos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellInformation = tableView.dequeueReusableCell(withIdentifier: "informationCell", for: indexPath) as! TecherTableViewCell
        
        //cellInformation.informationicon.image=UIImage(named: informationicon[indexPath.row])
        //cellInformation.lblinformation.text = detailinformation[indexPath.row]
        
        let teacher = teacherinfos[indexPath.row]
        cellInformation.lblname.text = teacher.teacherName
        cellInformation.lbladdress.text = teacher.teacherAddress
        cellInformation.lblemail.text = teacher.teacherEmail
        cellInformation.lblphone.text = teacher.teacherPhone
        cellInformation.lblsubject.text = teacher.teacherSubject

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



