//
//  highlits.swift
//  receipe list App
//
//  Created by Arthur Sh on 01.09.2022.
//

import SwiftUI

struct highlits: View {
    
    var allHighlights = ""
    
    init(highlight:[String]){
        
        for item in 0..<highlight.count{
            if item == highlight.count - 1 {
                allHighlights += highlight[item]
            }else {
                allHighlights += highlight[item] + ", "
            }
        }
        
    }
    var body: some View {
        Text(allHighlights)
    }
}

struct highlits_Previews: PreviewProvider {
    static var previews: some View {
        highlits(highlight: ["test", "test", "test",])
    }
}
