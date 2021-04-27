//  CustomPaths_Part3.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/creating-custom-paths-with-swiftui
 
 An alternative is to use SwiftUI’s dedicated `StrokeStyle` struct ,
 which gives us control over
 how every line should be connected to the line after it ( _line join_ )
 and how every line should be drawn
 when it ends without a connection after it ( _line cap_ ) .
 */

import SwiftUI



struct CustomPaths_Part3: View {
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        Path { path in
            
            path.move(to : CGPoint(x : 100.00 , y : 300.00))
            path.addLine(to : CGPoint(x : 300.00 , y : 300.00))
            path.addLine(to : CGPoint(x : 200.00 , y : 100.00))
            path.addLine(to : CGPoint(x : 100.00 , y : 300.00))
            path.addLine(to : CGPoint(x : 200.00 , y : 300.00))
        }
        .stroke(Color.blue ,
                style : StrokeStyle(lineWidth : 20.00 ,
                                    lineCap : .round ,
                                    lineJoin : .round))
    }
}





struct CustomPaths_Part3_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustomPaths_Part3().previewDevice("iPhone 12 Pro")
    }
}
