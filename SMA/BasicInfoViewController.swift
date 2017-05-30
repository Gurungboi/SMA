//
//  BasicInfoViewController.swift
//  SMA
//
//  Created by Sunil Gurung on 5/9/17.
//  Copyright © 2017 Impactit. All rights reserved.
//

import UIKit

struct parentInfo {
    let parentName: String
    let parenetRelation: String
    let pastSchool: String
    let specialNeeds: String
}

class BasicInfoViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var parentinfos = [parentInfo]()
    
    @IBOutlet weak var basicinfoView: UITableView!
   // var info = ["Parents","Sibilings","Past School","Special Need"]
    //var infodetails = ["Bikram & Srijala","Archana, Aakash & Arun","Sanskriti Sadan Secondary School","i don't know what it is"]
    
//    var parentsnamearray:[String] = []
//    var sibilingsarray: [String] = []
//    var PastSchoolarray: [String] = []
//    var SpecialNeedarray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getStudentsInfo()
        // Do any additional setup after loading the view.
    }
    
    func getStudentsInfo(){
        guard let path = Bundle.main.path(forResource: "student", ofType: "json") else {return}
        let url = URL(fileURLWithPath: path)
        
        do{
            let data = try  Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            //print(json)
            
            guard let array = json as?[Any] else {return}
            for stdinfo in array{
                guard let stdDict = stdinfo as?[String: Any] else {return}
                guard let parentsName = stdDict["parent_name"] as? String else{return }
                guard let siblings = stdDict["parent_relation"] as? String else {return}
                guard let pastschool = stdDict["past_school"] as? String else {return}
                guard let specialneed = stdDict["special_need"] as? String else {return}
                
                print (parentsName)
                print (siblings)
                print (pastschool)
                print (specialneed)
                
                //let student = parentInfo(parentName: parentsName, parenetRelation: siblings)
                let student = parentInfo(parentName: parentsName, parenetRelation: siblings, pastSchool: pastschool , specialNeeds: specialneed)
                parentinfos.append(student)
            }
        }
        catch{
            print("Error")
        }
        self.basicinfoView.reloadData()
        //print(path)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return parentinfos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellBasicInfo = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! BasicInfoTableViewCell
        
        //cellBasicInfo.lblinfo.text = info[indexPath.row]
        //cellBasicInfo.lblinfodetails.text = infodetails[indexPath.row]
      
        let student = parentinfos[indexPath.row]
        cellBasicInfo.lblparentnameetails.text = student.parentName
        cellBasicInfo.lblsibilingdetails.text = student.parenetRelation
        cellBasicInfo.lblpastschooldetails.text = student.pastSchool
        cellBasicInfo.lblspecialneeddetails.text = student.specialNeeds
        
        return cellBasicInfo
        
    }
   
}
