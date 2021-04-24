// MARK: StrokeBorderSupport_Part1.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/adding-strokeborder-support-with-insettableshape
 
 
 */

import SwiftUI



struct StrokeBorderSupport_Part1: View {
    
    var body: some View {
        
        VStack {
            Circle()
                .stroke(Color.blue , lineWidth : 40.00)
            /**
             What you are seeing here is
             a side effect of the way SwiftUI draws borders around shapes .
             If you handed someone a pencil outline of a circle
             and asked them to draw over that circle with a thick pen ,
             they would trace the exact line of the circle
             – about half the pen would be inside the line , and half outside .
             This is what SwiftUI is doing for us ,
             but where our shapes go to the edge of the screen
             it means the outside part of the border ends up beyond our screen edges .
             */
            Circle()
                .strokeBorder(Color.pink , lineWidth : 40.00)
            /**
             All our border is visible ,
             because Swift strokes the inside of the circle
             rather than centering on the line .
             */
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct StrokeBorderSupport_Part1_Previews: PreviewProvider {
    
    static var previews: some View {
        
        StrokeBorderSupport_Part1().previewDevice("iPhone 12 Pro")
    }
}
