//  StrokeBorderSupport_Part2.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/adding-strokeborder-support-with-insettableshape
 */

import SwiftUI



// struct Arc2: Shape {
struct Arc2: InsettableShape { // STEP 1 of 5
    /**
     `NOTE`:
     `InsettableShape` actually builds upon `Shape` ,
     so there is no need to add both there .
     */
    
    var startAngle: Angle
    var endAngle: Angle
    var isClockwise: Bool
    var insetAmount: CGFloat = 0.00 // STEP 2 of 5
    
    
    func path(in rect: CGRect)
    -> Path {
        
        let rotationCorrection = Angle.degrees(180)
        let startAngleCorrection = startAngle - rotationCorrection
        let endAngleCorrection = endAngle - rotationCorrection
        
        var path: Path = Path()
        
        path.addArc(center : CGPoint(x: rect.midX , y: rect.midY) ,
                    radius : (rect.width / 2) - insetAmount , // STEP 4 of 5
                    startAngle : startAngleCorrection ,
                    endAngle : endAngleCorrection ,
                    clockwise : !isClockwise)
        
        return path
    } // conforms to Shape
    
    
    func inset(by amount: CGFloat)
    -> some InsettableShape {
        
        var arc = self
        
        arc.insetAmount += amount
        
        return arc
    } // STEP 3 of 5
}



struct StrokeBorderSupport_Part2: View {
    
    var body: some View {
        
        Arc2(startAngle : .degrees(0.00) ,
             endAngle : .degrees(180.00) ,
             isClockwise : true)
            // .stroke(Color.orange , lineWidth : 40.00)
            .strokeBorder(Color.purple , lineWidth : 40.00) // STEP 5 of 5
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct StrokeBorderSupport_Part2_Previews: PreviewProvider {
    
    static var previews: some View {
        
        StrokeBorderSupport_Part2().previewDevice("iPhone 12 Pro")
    }
}
