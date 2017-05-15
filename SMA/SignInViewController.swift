//
//  SignInViewController.swift
//  SMA
//
//  Created by Sunil Gurung on 5/9/17.
//  Copyright © 2017 Impactit. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var lblusername: UITextField!
    @IBOutlet weak var lblpassword: UITextField!
    @IBOutlet weak var btnsignin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnsignin(_ sender: Any) {
        let username = lblusername.text
        let password = lblpassword.text
        if(username == "" || password == "")
        {
            return
        }
        
        
        
    }
    
//    func DoSignIn(user:String, pass:String)
//    {
//        let url = URL(string: "")
//        let session = URLSession.shared
//        
//        let request = NSMutableURLRequest(url: url!)
//        request.httpMethod = "POST"
//        
//        let paramToSend = "Username=" + user + "&password=" + pass
//        request.httpBody = paramToSend.data(using: String.Encoding.utf8)
//        
//        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
//            guard let _:Data = data else
//            {
//                return
//            }
//            
//            let json:Any?
//            
//            do {
//                json = try JSONSerialization.jsonObject(with: data!, options: [])
//            }
//            catch{
//                return
//            }
//            
//            guard let server_response = json as? NSDictionary else
//            {
//                return
//            }
//            
//            if let data_block = server_response["data"] as? NSDictionary
//            {
//                if let session_data = data_block["session"] as? String
//                
//                {
//                    let preferences = UserDefaults.standard
//                    preferences.set(session_data, forKey: "session")
//                    
//                    DispatchQueue.main.async (
//                        execute:self.SignInDone()
//                    )
//                }
//            }
//            
//        }
//        task.resume()
//        
//    }
//    
//    func SignInDone(){
//        lblusername.isEnabled = false
//        lblpassword.isEnabled = false
//        btnsignin.setTitle("Sign out", for: .normal)
//    }
}
