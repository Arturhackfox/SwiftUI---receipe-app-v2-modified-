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
    
    static func GetPortion(Ingredient:Ingredient, RecipeServings:Int, TargetServings:Int ) ->String{
        
        var portion = ""
        var numerator = Ingredient.num ?? 1
        var denumarator = Ingredient.denom ?? 1
        var wholePortions = 0
        
        
        
        if Ingredient.num != nil{
            
            denumarator *= RecipeServings
            numerator *= TargetServings
            
            let divisor = Rational.greatestCommonDivisor(numerator, denumarator)
            numerator /= divisor
            denumarator /= divisor
            
            
            if numerator >= denumarator {
                
                wholePortions = numerator / denumarator   // Calculated the whole portions
                
                numerator = numerator % denumarator       // Calculate the remainder
                
                portion += String(wholePortions)          // Assign to portion string
                
                
            }
            
            
            if numerator > 0 { //show remainder as fraction 1 and 1/2 (one AND the half )
                
                portion += wholePortions > 0 ? " " : ""
                
                portion += "\(numerator)/\(denumarator)"
            }
            
        }
        
        
        
        
        if var unit = Ingredient.unit {
            
            if wholePortions > 1 {  // if there is more than 1 whole portion = add suffix
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                        unit = String(unit.dropLast())
                        unit += "ves"
                    } else {
                        unit += "s"
                    }
                }
            portion += Ingredient.num == nil && Ingredient.denom == nil ? "" : " "

            
            return portion + unit
            }
            
            
            
            return portion
        }
}
    
