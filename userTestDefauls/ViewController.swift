//
//  ViewController.swift
//  userTestDefauls
//
//  Created by Siarhei Stasevich on 05/11/2022.
//

import UIKit

struct KeyDefauls {
    static let keySity = "city"
    static let keyStreet = "street"
    static let keyHousNumber = "housNumber"
    static let keyData = "adresses"
}

class ViewController: UIViewController {

    
    let defauls = UserDefaults.standard
    
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var streetField: UITextField!
    @IBOutlet weak var housNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        loadAdres()
    }

    
    func saveAdres(){
        guard let city = cityField.text else {return}
        guard let street = streetField.text else {return}
        guard let housNum = housNumber.text else {return}
        
        Base.shared.saveAress(city: city, street: street, numberHouse: housNum)

    }
    
    func loadAdres(){
        cityField.text = defauls.string(forKey: KeyDefauls.keySity)
        streetField.text = defauls.string(forKey: KeyDefauls.keyStreet)
        housNumber.text = defauls.string(forKey: KeyDefauls.keyHousNumber)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        saveAdres()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loadButton(_ sender: Any) {
        loadAdres()
    }
    
}

