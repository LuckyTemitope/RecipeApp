//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Lucky Osunbiyi on 2021-06-17.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Featured Recipes")
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 50)
                .padding(.bottom, -30)
                .font(.largeTitle)
            
                
            
            GeometryReader { geo in
            TabView {
                ForEach (0..<model.recipes.count) { index in
                    
                    if model.recipes[index].featured == true {
                        
                        //Recipe Card
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                
                            VStack(spacing: 0.0){
                                Image(model.recipes[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .clipped()
                                
                                Text(model.recipes[index].name)
                                    .font(.headline)
                                    .padding(10)
                            }
                        }
                        .frame(width: (geo.size.width - 40), height: (geo.size.height - 100), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.2), radius: 10, x: -5, y: 10)
                    
                        
                    }
                    
                    
                    
                }
            } .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            }
            
            
            VStack(alignment: .leading, spacing: 10.0) {
                Text("Preparation Time")
                    .font(.headline)
                Text("1 Hour")
                
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            } .padding(.leading)
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}

