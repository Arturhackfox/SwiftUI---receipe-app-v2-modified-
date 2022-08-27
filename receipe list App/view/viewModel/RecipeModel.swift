//
//  receipeModel.swift
//  receipe list App
//
//  Created by Arthur Sh on 15.08.2022.
//

import Foundation



class RecipeModel: ObservableObject {
    
    @Published var recipes = [Receipe]()
    
    init() {
        
        
        self.recipes = DataService.getlocalData()
        
        
        
    }
    
}
