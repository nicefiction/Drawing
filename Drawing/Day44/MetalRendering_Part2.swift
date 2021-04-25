// MARK: MetalRendering_Part2.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/enabling-high-performance-metal-rendering-with-drawinggroup
 
 `IMPORTANT` :
 The `drawingGroup()` modifier is helpful to know about
 and to keep in your arsenal
 as a way to solve performance problems when you hit them ,
 but you should _not_ use it that often .
 Adding the off-screen render pass
 might slow down SwiftUI for simple drawing ,
 so you should wait until you have an actual performance problem
 before trying to bring in `drawingGroup()` .
 */

import SwiftUI



struct ColorCyclingCircle2: View {
        
     // //////////////////
    //  MARK: PROPERTIES
    
    var amount = 0.0
    var steps = 100

    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    // .strokeBorder(self.color(for : value , brightness : 1) ,
                    //               lineWidth : 2)
                    .strokeBorder(
                        LinearGradient( gradient : Gradient(
                                            colors : [
                                                self.color(for : value , brightness : 1) ,
                                                self.color(for : value , brightness : 0.5)
                                            ]) ,
                                        startPoint : .top ,
                                        endPoint : .bottom) ,
                        lineWidth : 2)
            }
        }
        .drawingGroup()
        /**
         `drawingGroup()` tells SwiftUI
         it should render the contents of the view into an off-screen image
         before putting it back onto the screen as a single rendered output ,
         which is signficantly faster .
         Behind the scenes this is powered by Metal ,
         which is Apple’s framework for working directly with the GPU for extremely fast graphics .
         */
    }

    
    
     // //////////////
    //  MARK: METHODS
    
    func color(for value: Int ,
               brightness: Double)
    -> Color {
        
        var targetHue = Double(value) / Double(self.steps) + self.amount

        
        if targetHue > 1 {
            
            targetHue -= 1
        }

        
        return Color(hue : targetHue ,
                     saturation : 1 ,
                     brightness : brightness)
    }
}



struct MetalRendering_Part2: View {
    
     // ///////////////////////
    // MARK: PROPERTY WRAPPERS
    
    @State private var colorCycle: Double = 0.00
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            ColorCyclingCircle2(amount : self.colorCycle ,
                                steps : 100)
            HStack {
                Text("Slide to change the color cycle :")
                    .font(.headline)
                Spacer()
            }
            Slider(value: $colorCycle)
        }
        .padding()
    }
    
}




 // ///////////////
//  MARK: PREVIEWS

struct MetalRendering_Part2_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MetalRendering_Part2().previewDevice("iPhone 12 Pro")
    }
}
