//
//  ViewController.swift
//  MyMovieDatabase
//
//  Created by macbook pro on 21.12.2021.
//

import UIKit
import Alamofire


class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(addNotificationDetail), name: .notificationMovie, object: nil)
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer 5eccd8d25724777ab0e1e55a2e9618310ffc61f4", "Accept": "application/json"
        ]
        
        let login = AuthRequestBody.init(username: "MSA", password: "123")
        
        AF.request("https://api.themoviedb.org/3/authentication/token/new?api_key=0bb1276cb29f9859fafb3556afb048ce", method: .post, parameters: login, encoder: .json, headers: headers).response {
            response in
            debugPrint(response)
        }
        
    }
    
    @IBAction func onClickedLogin(_ sender: Any) {
        
        var username = txtUsername.text ?? ""
        var password = txtPassword.text ?? ""
        
        if username == "MSA" && password == "123" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "goToNavigationController") as! UINavigationController;         vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
        }else {
            print("Your username or password is invalid. Please try again.")
        }
        
}

    @objc func addNotificationDetail () {
        print("Notification received")
    }
}
