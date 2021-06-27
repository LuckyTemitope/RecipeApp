//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2;
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                   // .frame(width: 420, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fit)
                    
                    .clipped()
                
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(recipe
                                .name)
                            .font(Font.custom("Georgia Bold", size: 30))
                            .bold()
                            .padding(.top, 20)
                        
                        Text("Choose your serving size")
                            .font(.caption)
                        
                        
                        // MARK: Serving Size Picker
                        Picker("", selection: $selectedServingSize) {
                            Text("2").tag(2)
                            Text("4").tag(4)
                            Text("6").tag(6)
                            Text("8").tag(8) 
                        } .font(Font.custom("Georgia", size: 16))
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 160)
                        
                    }
                    
                    
                    Divider()
                    
                    // MARK: Ingredients
                    VStack(alignment: .leading) {
                        Text("Ingredients")
                            .font(Font.custom("Georgia Bold", size: 16))
                            .padding([.bottom, .top], 5)
                        
                        ForEach (recipe.ingredients) { item in
                            Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name)
                                .font(Font.custom("Georgia", size: 16))
                        }
                    }
                    
                    
                    // MARK: Divider
                    Divider()
                    
                
                    // MARK: Directions
                    VStack(alignment: .leading) {
                        Text("Directions")
                            .font(Font.custom("Georgia Bold", size: 16))
                            .padding([.bottom, .top], 5)
                        
                        ForEach(0..<recipe.directions.count, id: \.self) { index in
                            
                            Text(String(index+1) + ". " + recipe.directions[index])
                                .padding(.bottom, 5)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(Font.custom("Georgia", size: 16))
                        }
                    }
                } .padding(.horizontal)
                
            }
            
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[2])
    }
}
