//
//  API.swift
//  getppl
//
//  Created by admin on 27/12/2021.
//

import Foundation

struct Parser {
    
    func parser(comp : @escaping ([People])->()) {
        let api = URL(string: "https://swapi.dev/api/people/?format=json")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do{
                let result = try JSONDecoder().decode(People.self, from: data!)
                comp(result.contacts)
            } catch {
                
            }
        }.resume()
        
    }
}
