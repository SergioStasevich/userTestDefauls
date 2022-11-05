//
//  Base.swift
//  userTestDefauls
//
//  Created by Siarhei Stasevich on 05/11/2022.
//

import Foundation
class Base {
    
    let defauls = UserDefaults.standard
    static let shared = Base()
    struct UserAdresses: Codable {
        
        var city: String
        var street: String
        var houseNumber: String
        var description: String {
            return "\(city), \(street), \(houseNumber)"
        }
    }
    
    var adresses: [UserAdresses] {
        
        get{
            if let data = defauls.value(forKey: KeyDefauls.keyData) as? Data {
                return try! PropertyListDecoder().decode([UserAdresses].self , from: data)
            }else {
                return [UserAdresses]()
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue) {
                defauls.set(data, forKey: KeyDefauls.keyData)
            }
        }
    }
    
    func saveAress(city: String, street: String, numberHouse: String){
        
        let address = UserAdresses (city: city, street: street, houseNumber: numberHouse)
        adresses.insert(address, at: 0)
        
    }
    
}
