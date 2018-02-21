//
//  Facebook.swift
//  Connections
//
//  Created by Felipe Ballesteros on 2018-02-17.
//  Copyright © 2018 FBApps. All rights reserved.
//

import Foundation
import FacebookCore
import FacebookLogin


struct Facebook {
    func getConnection() -> GraphRequestConnection{
        return GraphRequestConnection()
    }
    
    func getUserProfile(){
        let connection = getConnection()
        let deviceScale = Int(UIScreen.main.scale)
        let width = 100
        let height = 100
        let parameters = ["fields": "first_name, last_name,email,gender,age_range,birthday,picture.width(\(width)).height(\(height))"]
        connection.add(GraphRequest(graphPath: "/me", parameters: parameters)) { httpResponse, result in
        let defaults = UserDefaults.standard
            switch result {
            case .success(let response):
                print("Graph Request Succeeded: \(response)")
                print("1")
                print(response.dictionaryValue?["first_name"])
                guard let firstName = response.dictionaryValue?["first_name"]  else {
                    print("failed name cast")
                    return
                }
                defaults.set(firstName,forKey:"FirstName")
                guard let lastName = response.dictionaryValue?["last_name"] else {
                    print("failed name cast")
                    return
                }
                defaults.set(lastName, forKey:"LastName")
                
            case .failed(let error):
                print("Graph Request Failed: \(error)")
            }
        }
        connection.start()
      
    }
}
