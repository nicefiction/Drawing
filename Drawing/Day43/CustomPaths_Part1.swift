//  CustomPaths_Part1.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/creating-custom-paths-with-swiftui
 */

import SwiftUI



struct CustomPaths_Part1: View {
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        Path { path in
            path.move(to : CGPoint(x : 200.00 , y : 100.00))
            path.addLine(to : CGPoint(x : 100.00 , y : 300.00))
            path.addLine(to : CGPoint(x : 300.00 , y : 300.00))
            path.addLine(to : CGPoint(x : 200.00 , y : 100.00))
        }
        .fill(Color.blue)
    }
}





struct CustomPaths_Part1_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustomPaths_Part1().previewDevice("iPhone 12 Pro")
    }
}
