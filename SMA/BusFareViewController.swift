//
//  BusFareViewController.swift
//  SMA
//
//  Created by Sunil Gurung on 5/9/17.
//  Copyright © 2017 Impactit. All rights reserved.
//

import UIKit

class BusFareViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var busView: UITableView!
    
    var bus = ["Bus Route","Bus Time","Driver Name","Drive Number","Bus Number"]
    var busdetails = ["C","9.30 am","John Doe","9840061291","2351"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bus.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellBus = tableView.dequeueReusableCell(withIdentifier: "busCell", for: indexPath) as! BusFareTableViewCell
        
        
        cellBus.lblbus.text = bus[indexPath.row]
        cellBus.lblbusdetail.text = busdetails[indexPath.row]
        
        
        return (cellBus)
        
    }

}
