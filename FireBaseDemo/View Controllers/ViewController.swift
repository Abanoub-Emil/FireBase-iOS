//
//  ViewController.swift
//  FireBaseDemo
//
//  Created by Champion on 5/18/18.
//  Copyright © 2018 ITI. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController,UITextFieldDelegate {
    var fireData:FirebaseLogic!
    var dic:NSMutableDictionary?
    var user:User!
    
    @IBOutlet weak var companyField: UITextField!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.companyField.delegate=self
        self.textField.delegate=self
        fireData = FirebaseLogic()
        user = User()
    }

    @IBAction func saveData(_ sender: Any) {
        user.name = textField.text
        user.company = companyField.text
        fireData.savetoFire(obj: user)
        
    }
    
    
    @IBAction func showData(_ sender: Any) {
        
         fireData.showFromFire(subChild: "Info")
    }
    
    @IBAction func removeData(_ sender: Any) {
        fireData.deleteFromFire(subChild: "Info")
    }
    
//    func completion(dics:NSMutableDictionary){
//        dic = dics
//        print(dic!)
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let companyName:String = dic?.object(forKey: "Company Name") as! String
//        let userName = dic?.object(forKey: "My Name") as! String
//        let detailsVC = storyBoard.instantiateViewController(withIdentifier: "detailsView") as! DetailsViewController
//        detailsVC.company=companyName
//        detailsVC.name=userName
//        self.navigationController?.pushViewController(detailsVC, animated: true)
//    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.companyField.resignFirstResponder()
        self.textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    

}

