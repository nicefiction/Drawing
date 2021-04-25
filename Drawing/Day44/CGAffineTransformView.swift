//  CGAffineTransformView.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/transforming-shapes-using-cgaffinetransform-and-even-odd-fills
 
 When you move beyond simple shapes and paths ,
 two useful features of SwiftUI come together
 to create some beautiful effects with remarkably little work .
 The first is `CGAffineTransform` ,
 which describes how a path or view should be rotated , scaled , or sheared ;
 and the second is `even-odd fills` ,
 which allow us to control how overlapping shapes should be rendered .
 
 The `even-odd rule` works like this:
 If a path has no overlaps it will be filled .
 If another path overlaps it , the overlapping part won’t be filled .
 If a third path overlaps the previous two , then it will be filled .
 …and so on .
 */

import SwiftUI



struct Flower: Shape {
    // How much to move this petal away from the center
    var petalOffset: Double = -20
    // How wide to make each petal
    var petalWidth: Double = 100

    
    func path(in rect: CGRect)
    -> Path {
        
        // The path that will hold all petals
        var path = Path()

        // Count from 0 up to pi * 2 , moving up pi / 8 each time
        for number in stride(from : 0 ,
                             to : CGFloat.pi * 2 ,
                             by : CGFloat.pi / 8) {
            /**
             Ranges such as 1...5 are great if you want to count through numbers one a time ,
             but if you want to count in 2s , or in our case count in “pi/8”s ,
             you should use `stride(from:to:by:)` instead .
             */
            
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle : number)
            /**
             Rotating something
             then moving it
             does not produce the same result as moving then rotating ,
             because when you rotate it first
             the direction it moves will be different from if it were not rotated .
             */
            
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX : rect.width / 2 ,
                                                                    y : rect.height / 2))

            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn : CGRect(x : CGFloat(petalOffset) ,
                                                        y : 0 ,
                                                        width : CGFloat(petalWidth) ,
                                                        height : rect.width / 2))

            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)

            // add it to our main path
            path.addPath(rotatedPetal)
        }

        // now send the main path back
        return path
    }
}



struct CGAffineTransformView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    /**
     To really help you understand what is going on ,
     we’ll be making our petal ellipses use a couple of properties
     we can pass in externally . ( OLIVIER : Using a Slider View . )
     */
    @State private var petalOffset: Double = -20.00
    @State private var petalWidth: Double = 100.00
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Flower(petalOffset : petalOffset ,
                   petalWidth : petalWidth)
                // .stroke(Color.pink , lineWidth : 3.0)
                // .fill(Color.pink)
                .fill(Color.pink ,
                      style : FillStyle(eoFill : true ,
                                        antialiased : true))
            HStack {
                Text("Petal width :")
                Spacer()
            }
            Slider(value : $petalWidth , in : -40...40)
            HStack {
                Text("Petal offset :")
                Spacer()
            }
            Slider(value: $petalOffset , in : 0...100)
        }
        .padding()
        .foregroundColor(Color.pink)
        .font(.headline)
    }
}





struct CGAffineTransformView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CGAffineTransformView().previewDevice("iPhone 12 Pro")
    }
}
