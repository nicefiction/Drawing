// MARK: SpecialEffects_Part2.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/special-effects-in-swiftui-blurs-blending-and-more
 
 Another popular effect is called `screen` ,
 which does the opposite of `multiply` :
 it inverts the colors ,
 performs a multiply ,
 then inverts them again ,
 resulting in a brighter image
 rather than a darker image .
 */

import SwiftUI



struct SpecialEffects_Part2: View {
    
     // /////////////////////////
    //  MARK: PROPERTY OBSERVERS
    
    @State private var amount: CGFloat = 0.00
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            ZStack {
                Circle()
                    /**
                     If you are particularly observant ,
                     you might notice that the fully blended color in the center isn’t quite white
                     – it is a very pale lilac color .
                     The reason for this is that
                     Color.red , Color.green , and Color.blue aren’t fully those colors ;
                     you’re not seeing pure red when you use Color.red .
                     Instead , you are seeing SwiftUI’s adaptive colors
                     that are designed to look good in both dark mode and light mode ,
                     so they are a custom blend of red , green , and blue
                     rather than pure shades .
                     If you want to see the full effect of blending red , green , and blue ,
                     you should use custom colors like these three :
                     `.fill(Color(red : 1.00 , green : 0.00 , blue : 0.00))`
                     */
                    // .fill(Color.red)
                    .fill(Color(red : 1.00 , green : 0.00 , blue : 0.00))
                    .frame(width : 200 * amount)
                    .offset(x : -60 , y : -100)
                    .blendMode(.screen) // PAUL HUDSON
                Circle()
                    // .fill(Color.blue)
                    .fill(Color(red : 0.00 , green : 0.00 , blue : 1.00))
                    .frame(width : 200 * amount)
                    .offset(x: 60 , y : -100)
                    .blendMode(.screen) // PAUL HUDSON
                Circle()
                    // .fill(Color.green)
                    .fill(Color(red : 0.00 , green : 1.00 , blue : 0.00))
                    .frame(width : 200 * amount)
                    .blendMode(.screen) // PAUL HUDSON
            }
            .frame(width : 300 , height : 300)
            // .blendMode(.screen) // OLIVIER
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth : .infinity , maxHeight : .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct SpecialEffects_Part2_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SpecialEffects_Part2().previewDevice("iPhone 12 Pro")
    }
}
