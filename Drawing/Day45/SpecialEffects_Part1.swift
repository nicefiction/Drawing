// MARK: SpecialEffects_Part1.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/special-effects-in-swiftui-blurs-blending-and-more
 */

import SwiftUI



struct SpecialEffects_Part1: View {
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            ZStack {
                Image("midsommar")
                Rectangle()
                    .fill(Color.yellow)
                    .blendMode(.multiply)
                /**
                 “Multiply” is so named
                 because it multiplies each source pixel color
                 with the destination pixel color .
                 */
            }
            .frame(width : 400 , height : 400)
            .clipped()
            /**
             `multiply` is so common
             that there is a shortcut modifier
             that means we can avoid using a ZStack :
             */
            Image("midsommar")
                .resizable()
                .scaledToFit()
                .colorMultiply(.blue)
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct SpecialEffects_Part1_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SpecialEffects_Part1().previewDevice("iPhone 12 Pro")
    }
}
