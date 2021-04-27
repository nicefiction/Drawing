// MARK: MetalRendering_Part1.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/enabling-high-performance-metal-rendering-with-drawinggroup
 */

import SwiftUI



struct ColorCyclingCircle: View {
    
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
                    .inset(by : CGFloat(value))
                    .strokeBorder(self.color(for : value ,
                                             brightness : 1) ,
                                  lineWidth : 2)
            }
        }
    }

    
    
     // //////////////
    //  MARK: METHODS
    
    func color(for value: Int ,
               brightness: Double)
    -> Color {
        
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        /**
         One small complexity here is
         that hues don’t automatically wrap after we reach 1.0 ,
         which means a hue of 1.0 is equal to a hue of 0.0 ,
         but a hue of 1.2 is not equal to a hue of 0.2 .
         As a result , we are going to wrap the hue by hand :
         if it’s over 1.0
         we’ll subtract 1.0 ,
         to make sure it always lies in the range of 0.0 to 1.0 .
         To figure out the hue for a particular circle
         we can take our circle number (e.g. 25) ,
         divide that by how many circles there are (e.g. 100) ,
         then add our color cycle amount (e.g. 0.5) .
         So , if we were circle 25 of 100 with a cycle amount of 0.5 ,
         our hue would be 0.75 .
         */
        if targetHue > 1 {
            
            targetHue -= 1
        }

        /**
         We can get a color cycling effect
         by using the `Color(hue:saturation:brightness:)` initializer :
         `hue` is a value from 0 to 1 controlling the kind of color we see
         – red is both 0 and 1 , with all other hues in between .
         */
        return Color(hue : targetHue ,
                     saturation : 1 ,
                     brightness : brightness)
    }
}



struct MetalRendering_Part1: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var colorCycle: Double = 0.00
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            ColorCyclingCircle(amount : self.colorCycle ,
                               steps : 100)
                .frame(width: 300)
            HStack {
                Spacer()
                Text("Color slider")
                    .font(.headline)
                Spacer()
            }
            Slider(value : $colorCycle)
        }
        .padding()
    }
    /**
     What you are seeing right now is powered by Core Animation ,
     which means it will turn our 100 circles into 100 individual views
     being drawn onto the screen .
     This is computationally expensive ,
     but as you can see
     it works well enough – we get smooth performance .
     */
}





struct MetalRendering_Part1_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MetalRendering_Part1().previewDevice("iPhone 12 Pro")
    }
}
