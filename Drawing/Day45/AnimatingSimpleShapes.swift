// MARK: AnimatingSimpleShapes.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/animating-simple-shapes-with-animatabledata
 */

import SwiftUI



struct Trapezium: Shape {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var insetAmount: CGFloat
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var animatableData: CGFloat {
        
        get { insetAmount }
        set { insetAmount = newValue }
        /**
         What is happening here is quite complex :
         when we use `withAnimation()` ,
         SwiftUI immediately changes our state property to its new value ,
         but behind the scenes
         it is also keeping track of the changing value over time as part of the animation .
         As the animation progresses ,
         SwiftUI will set the `animatableData` property of our shape to the latest value ,
         and it is down to us to decide what that means
         – in our case we assign it directly to `insetAmount` ,
         because that is the thing we want to animate .
            Remember ,
         SwiftUI evaluates our view state before an animation was applied
         and then again after .
         It can see we originally had code that evaluated to `Trapezoid(insetAmount : 50)` ,
         but then after a random number was chosen
         we ended up with ( for example ) `Trapezoid(insetAmount : 62)` .
         So , it will interpolate between 50 and 62 over the length of our animation ,
         each time setting the `animatableData` property of our shape
         to be that latest interpolated value – 51 , 52 , 53 , and so on , until 62 is reached .
         */
    }

    
    
     // //////////////
    //  MARK: METHODS
    
    func path(in rect: CGRect)
    -> Path {
        
        var path: Path = Path()
        
        // path.move(to : CGPoint(x : rect.minX , y : rect.maxY)) // OLIVIER
        // path.addLine(to : CGPoint(x : rect.minX + insetAmount , y : rect.minY)) // OLIVIER
        // path.addLine(to : CGPoint(x : rect.maxX - insetAmount , y : rect.minY)) // OLIVIER
        // path.addLine(to : CGPoint(x : rect.maxX , y : rect.maxY)) // OLIVIER
        path.move(to : CGPoint(x : 0.00 , y : rect.maxY)) // PAUL HUDSON
        path.addLine(to : CGPoint(x : insetAmount , y : rect.minY)) // PAUL HUDSON
        path.addLine(to : CGPoint(x : rect.maxX - insetAmount , y : rect.minY)) // PAUL HUDSON + OLIVIER
        path.addLine(to : CGPoint(x : rect.maxX , y : rect.maxY)) // PAUL HUDSON + OLIVIER
        path.addLine(to : CGPoint(x : 0 , y : rect.maxY)) // PAUL HUDSON
        
        return path
    }
}



struct AnimatingSimpleShapes: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var insetAmount: CGFloat = 75.00
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        
        
        Trapezium(insetAmount : insetAmount)
            .fill(Color.blue)
            .frame(width : 300 , height : 200)
            .onTapGesture {
                /**
                 `withAnimation` explicitly asks SwiftUI
                 to animate changes
                 occurring as the result of a state change :
                 */
                withAnimation {
                    insetAmount = CGFloat.random(in: 0...80)
                    /**
                     As soon as `self.insetAmount` is set to a new random value ,
                     it will immediately jump to that value and pass it directly into Trapezoid
                     – it won’t pass in lots of intermediate values as the animation happens .
                     This is why our trapezoid jumps from inset to inset ;
                     it has no idea an animation is even happening .
                     We can fix this with the `animatableData` computed property .
                     */
                }
            }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct AnimatingSimpleShapes_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AnimatingSimpleShapes().previewDevice("iPhone 12 Pro")
    }
}
