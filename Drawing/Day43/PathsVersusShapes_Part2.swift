//  PathsVersusShapes_Part2.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/paths-vs-shapes-in-swiftui
 
 The key to understanding the difference between `Path` and `Shape` is reusability :
 paths are designed to do one specific thing ,
 whereas shapes have the flexibility of drawing space
 and can also accept parameters to let us customize them further .
 To demonstrate this ,
 we could create an Arc shape that accepts three parameters :
 start angle , end angle , and whether to draw the arc clockwise or not .
 */

import SwiftUI



struct Arc: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    
    func path(in rect: CGRect)
    -> Path {
        
        /**
         In the eyes of SwiftUI
         0 degrees is not straight upwards ,
         but instead directly to the right .
         Shapes measure their coordinates
         from the bottom-left corner
         rather than the top-left corner ,
         which means SwiftUI goes the other way around
         from one angle to the other .
         This is , in my not very humble opinion , extremely alien .
         We can fix both of those problems with
         subtracting 90 degrees
         from the start and end angles :
         */
        let rotationAdjustment = Angle.degrees(90.00)
        let modifiedStartAngle = startAngle - rotationAdjustment
        let modifiedEndAngle = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center : CGPoint(x : rect.midX , y : rect.midY) ,
                    radius : rect.width / 2 ,
                    // startAngle : startAngle ,
                    startAngle : modifiedStartAngle ,
                    // endAngle : endAngle ,
                    endAngle : modifiedEndAngle ,
                    // clockwise : clockwise)
                    clockwise : !clockwise)
        
        return path
    }
}



struct PathsVersusShapes_Part2: View {
    
    var body: some View {
        
        Arc(startAngle : .degrees(0.00) ,
            endAngle : .degrees(90.00) ,
            clockwise : true)
            .stroke(Color.red , lineWidth : 8.00)
            .frame(width : 300)
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct PathsVersusShapes_Part2_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PathsVersusShapes_Part2().previewDevice("iPhone 12 Pro")
    }
}
