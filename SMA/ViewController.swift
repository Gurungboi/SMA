//
//  ViewController.swift
//  SMA
//
//  Created by Sunil Gurung on 5/9/17.
//  Copyright © 2017 Impactit. All rights reserved.
//

import UIKit
import PageMenu


class ViewController: UIViewController, CAPSPageMenuDelegate {

     var pageMenu : CAPSPageMenu?
    @IBOutlet weak var btnmenu: UIBarButtonItem!
    
    @IBOutlet weak var InformationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //SWRevealVC
        
        btnmenu.target = self.revealViewController()
        btnmenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        
        //PageMenu
        
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        
        var basicinfocontroller: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "basicinfoview"))!
        basicinfocontroller.title = "Basic Info"
        controllerArray.append(basicinfocontroller)
        
        var gradecontroller: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "gradeview"))!
        gradecontroller.title = "Grade"
        controllerArray.append(gradecontroller)
        
        
        var testcontroller: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "testview"))!
        testcontroller.title = "Test"
        controllerArray.append(testcontroller)
        
        var teachernotecontroller: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "teachernoteview"))!
        teachernotecontroller.title = "Teacher Note"
        controllerArray.append(teachernotecontroller)
        
        
        var feedetailcontroller: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "feedetailview"))!
        feedetailcontroller.title = "Fee Details"
        controllerArray.append(feedetailcontroller)
        
        var busfarecontroller: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "busfareview"))!
        feedetailcontroller.title = "Bus Fares"
        controllerArray.append(busfarecontroller)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        var parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(4.3),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorPercentageHeight(0.1)
        ]
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: self.view.frame, pageMenuOptions: parameters)
        
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.InformationView.addSubview(pageMenu!.view)
        
        // Optional delegate
        pageMenu!.delegate = self as? CAPSPageMenuDelegate
        
        
        func willMoveToPage(controller: UIViewController, index: Int){}
        
        func didMoveToPage(controller: UIViewController, index: Int){}

    }

}

