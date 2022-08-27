//
//  Receipe detailView.swift
//  receipe list App
//
//  Created by Arthur Sh on 18.08.2022.
//

import SwiftUI

struct Receipe_detailView: View {
    
    var receipe:Receipe
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading){
                // MARK: receipe image
                Image(receipe.image)
                    .resizable()
                    .scaledToFill()
                
                
                // MARK: ingridients
                VStack(alignment: .leading) {
                    Text("These are the ingredients")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    
                    ForEach(receipe.ingredients) { i in
                        Text("•" + i.name)
                        
                    }
                }
                .padding(.horizontal)
                
                Divider()
                // MARK: directions
                VStack(alignment: .leading ){
                    Text("Directions")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    
                    ForEach(0..<receipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + (receipe.directions[index]))
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
                
            }
        } .navigationTitle(receipe.name)
        
        
    }
}

struct Receipe_detailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = receipModel() // Dummy data
        
        Receipe_detailView(receipe: model.recipes[0])
            .preferredColorScheme(.dark)
    }
}
