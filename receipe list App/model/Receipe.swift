//
//  Receipe.swift
//  receipe list App
//
//  Created by Arthur Sh on 15.08.2022.
//

import Foundation


class Receipe: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]
    
    
}
