//
//  MenuViewController.swift
//  SMA
//
//  Created by Sunil Gurung on 5/9/17.
//  Copyright © 2017 Impactit. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var menuNameArray: Array = [String()]
    var imageiconArray: Array = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuNameArray = ["Home","Teacher Dashboard","Calendar"]
        //imageiconArray = [UIImage(named)]
        
               

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuviewCell", for: indexPath) as! MenuTableViewCell
        cell.menuname.text! = menuNameArray[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController:SWRevealViewController = self.revealViewController()
        let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if cell.menuname.text! == "Home"
        {
            let mainstory:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainstory.instantiateViewController(withIdentifier: "viewController") as! ViewController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }

        if cell.menuname.text! == "Teacher Dashboard"
        {
            let mainstory:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainstory.instantiateViewController(withIdentifier: "teacherdashboardView") as! TeacherDashViewController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        
        if cell.menuname.text! == "Calendar"
        {
            let mainstory:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainstory.instantiateViewController(withIdentifier: "calendarVC") as! CalendarViewController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
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
}
