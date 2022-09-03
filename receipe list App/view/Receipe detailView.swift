//
//  Receipe detailView.swift
//  receipe list App
//
//  Created by Arthur Sh on 18.08.2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var receipe:Receipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading){
                // MARK: receipe image
                Image(receipe.image)
                    .resizable()
                    .scaledToFill()
                
                
                // MARK: Recipe title
                Text(receipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                
                // MARK: Picker
                VStack(alignment: .leading){
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir", size: 15))
                    
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .font(Font.custom("Avenir", size: 15))
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                    
                }.padding()
                
                // MARK: ingridients
                VStack(alignment: .leading) {
                    Text("These are the ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.top, .bottom], 5)
                    
                    ForEach(receipe.ingredients) { i in
                        Text("• " + RecipeModel.GetPortion(Ingredient: i, RecipeServings: receipe.servings, TargetServings: selectedServingSize) + " " + i.name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                        
                    }
                }
                .padding(.horizontal)
                
                Divider()
                // MARK: directions
                VStack(alignment: .leading ){
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.top, .bottom], 5)
                    
                    ForEach(0..<receipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + (receipe.directions[index]))
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal)
                
            }
        }
        
    }
}

struct Receipe_detailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel() // Dummy data
        
        RecipeDetailView(receipe: model.recipes[0])
            .preferredColorScheme(.light)
    }
}
