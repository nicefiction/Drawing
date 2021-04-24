// MARK: PathsVersusShapes_Part1.swift
/**
 SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/paths-vs-shapes-in-swiftui
 
 SwiftUI enables custom drawing with two subtly different types :
 paths and shapes .
 A `path` is a series of drawing instructions
 such as “start here , draw a line to here , then add a circle there” ,
 all using absolute coordinates .
 In contrast , a `shape` has no idea where it will be used or how big it will be used ,
 but instead will be asked to draw itself inside a given rectangle .
 */

import SwiftUI



struct Triangle: Shape {
    
    func path(in rect: CGRect)
    -> Path {
        
        var path = Path()
        
        path.move(to : CGPoint(x : rect.midX , y : rect.minY))
        path.addLine(to : CGPoint(x : rect.minX , y : rect.maxY))
        path.addLine(to : CGPoint(x : rect.maxX , y : rect.maxY))
        path.addLine(to : CGPoint(x : rect.midX , y : rect.minY))
        
        return path
        
        /* OLIVIER :
         Path { path in
         
            path.move(to : CGPoint(x : rect.midX , y : rect.minY))
            path.addLine(to : CGPoint(x : rect.minX , y : rect.maxY))
            path.addLine(to : CGPoint(x : rect.maxX , y : rect.maxY))
            path.addLine(to : CGPoint(x : rect.midX , y : rect.minY))
            // path.addLine(to : CGPoint(x : rect.minX , y : rect.maxY))
         }
         */
        /**
         OLIVIER : There is no need to write `return path` in my alternative solution .
         */
    }
}



struct PathsVersusShapes_Part1: View {
    
    var body: some View {
        
        Triangle()
            // .fill(Color.blue)
            .stroke(Color.orange ,
                    style : StrokeStyle(lineWidth : 20 ,
                                        lineCap : .round ,
                                        lineJoin : .round))
            .frame(width : 300 ,
                   height : 300)
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct PathsVersusShapes_Part1_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PathsVersusShapes_Part1().previewDevice("iPhone 12 Pro")
    }
}
