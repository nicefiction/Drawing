//  CustomPaths_Part2.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/creating-custom-paths-with-swiftui
 */

import SwiftUI



struct CustomPaths_Part2: View {
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Path { path in
                
                path.move(to : CGPoint(x : 100.00 , y : 300.00))
                path.addLine(to : CGPoint(x : 300.00 , y : 300.00))
                path.addLine(to : CGPoint(x : 200.00 , y : 100.00))
                path.addLine(to : CGPoint(x : 100.00 , y : 300.00))
            }
            .stroke(Color.yellow , lineWidth : 8.0)
            /**
             That doesn’t look quite right, though
             – the bottom corners of our triangle are nice and sharp ,
             but the top corner is broken .
             This happens because SwiftUI makes sure
             lines connect up neatly with
             what comes before and after
             rather than just being a series of individual lines ,
             but our last line has nothing after it
             so there is no way to make a connection .
             One way to fix this is
             just to draw the first line again ,
             which means the last line has a connecting line to match up with :
             */
            Path { path in
                
                path.move(to : CGPoint(x : 100.00 , y : 300.00))
                path.addLine(to : CGPoint(x : 300.00 , y : 300.00))
                path.addLine(to : CGPoint(x : 200.00 , y : 100.00))
                path.addLine(to : CGPoint(x : 100.00 , y : 300.00))
                path.addLine(to : CGPoint(x : 200.00 , y : 300.00))
            }
            .stroke(Color.green.opacity(0.25) , lineWidth : 8.0)
            /**
             `NOTICE` how the whole stroke gets faded uniformly ,
             without seeing any sort of double stroke along the first line .
             */
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct CustomPaths_Part2_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustomPaths_Part2().previewDevice("iPhone 12 Pro")
    }
}
