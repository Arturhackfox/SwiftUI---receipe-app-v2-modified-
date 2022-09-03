//
//  dataService.swift
//  receipe list App
//
//  Created by Arthur Sh on 16.08.2022.
//

import Foundation


class DataService {
    static func getlocalData() -> [Receipe] {
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        guard pathString != nil else {
            return [Receipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do{
                let receipeData = try decoder.decode([Receipe].self, from: data)
                
                for r in receipeData{
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                return receipeData
                
            }
            catch{
                print(error)
            }
            
        }
        catch{
            print(error)
        }
        return [Receipe]()
    }
    
}
