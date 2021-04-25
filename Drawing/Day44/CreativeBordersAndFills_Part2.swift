//  CreativeBordersAndFills_Part2.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/creative-borders-and-fills-using-imagepaint
 
 It is worth adding that `ImagePaint` can be used for
 view backgrounds
 and also shape strokes .
 */

import SwiftUI



struct CreativeBordersAndFills_Part2: View {
    
    var body: some View {
        
        ZStack {
            Color
                .yellow
                .edgesIgnoringSafeArea(.all)
            Capsule()
                /**
                 `NOTE`OLIVIER :
                 Use of `.strokeBorder` instead of `.border` ,
                 */
                .strokeBorder(ImagePaint(image : Image("sunIcon") ,
                                         scale : 0.05) ,
                              lineWidth : 50.00)
                // .frame(width : 300 , height : 200)
        }
    }
}





struct CreativeBordersAndFills_Part2_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CreativeBordersAndFills_Part2().previewDevice("iPhone 12 Pro")
    }
}
