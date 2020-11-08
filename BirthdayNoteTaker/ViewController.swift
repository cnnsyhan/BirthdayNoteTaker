//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Can Seyhan on 10/31/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameText:UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting - as? vs as!
        
        if let newName = storedName as? String {
            nameLabel.text = "Name : \(newName)"
        }
        
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday : \(newBirthday)"
        }
        
    }

    
    @IBAction func saveButton(_ sender: Any) {
        
        UserDefaults.standard.set(nameText.text!, forKey: "name")
        UserDefaults.standard.set(birthdayText.text!, forKey: "birthday")
         //UserDefaults.standard.synchronize() kullanilmiyor artik
    
        
        nameLabel.text = "Name : \(nameText.text!)"
        birthdayLabel.text = "Birthday : \(birthdayText.text!)"
        
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "birtday")
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name :"
            
    }
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday :"
            
            
            
            
      }
        
  }
    
}
