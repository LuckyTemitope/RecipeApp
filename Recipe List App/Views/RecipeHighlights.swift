//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Lucky Osunbiyi on 2021-06-26.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights: [String]) {
        // Loop through the highlights and build the string
        for index in 0..<highlights.count {
            
            //if this is the last item, don't add a comma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Georgia", size: 16))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test1", "test2", "test 3"])
    }
}
