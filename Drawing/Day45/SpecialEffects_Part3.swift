// MARK: SpecialEffects_Part3.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/special-effects-in-swiftui-blurs-blending-and-more
 */

import SwiftUI



struct SpecialEffects_Part3: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var amount: CGFloat = 0.00
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Image("midsommar")
                .resizable()
                .scaledToFill()
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
            Slider(value: $amount)
                .padding()
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct SpecialEffects_Part3_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SpecialEffects_Part3().previewDevice("iPhone 12 Pro")
    }
}
