//
//  ViewController.swift
//  MyMovieDatabase
//
//  Created by macbook pro on 21.12.2021.
//

import UIKit
import Alamofire
import IQKeyboardManagerSwift


class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 
    @IBAction func onClickLogin(_ sender: Any) {
        
           
        AF.request("https://api.themoviedb.org/3/authentication/token/new?api_key=0bb1276cb29f9859fafb3556afb048ce").responseDecodable { (response:AFDataResponse<TokenResponse>) in
            switch response.result{
                case .success(let movieResponse):
                    BaseData.shared.token = movieResponse.requestToken
                self.sendRequest()
                case .failure(let error):
                    print(error)
                break
            }
        }

        
        NotificationCenter.default.addObserver(self, selector: #selector(addNotificationDetail), name: .notificationMovie, object: nil)
            
     
            
            var username = txtUsername.text ?? ""
            var password = txtPassword.text ?? ""
            
         
    }
    
    
    func sendRequest(){

        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        

        
        var login = AuthRequestBody.init(username: txtUsername.text, password: txtPassword.text, request_token: (BaseData.shared.token ?? ""))

        
        AF.request("https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=0bb1276cb29f9859fafb3556afb048ce", method: .post, parameters: login, encoder: .json, headers: headers).responseDecodable { (response:AFDataResponse<TokenResponse>) in
            switch response.result{
                case .success(let response):
                if(response.success ?? false){
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "goToNavigationController") as! UINavigationController;         vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
                case .failure(let error):
                    print(error)
                break
            }
        }
        
    }
    @objc func addNotificationDetail () {
        print("Notification received")
    }
}
