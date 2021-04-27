// MARK: ColorCyclingRectangleShape.swift
/**
 CHALLENGE :
 https://www.hackingwithswift.com/books/ios-swiftui/drawing-wrap-up
 */

import SwiftUI



struct ColorCyclingRectangle: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var steps: Int = 10
    var amount: Double
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        ZStack {
            ForEach(1..<steps) { value in
                Rectangle()
                    .inset(by : CGFloat(value))
                    .strokeBorder(self.color(for : value ,
                                             brightness : 1) ,
                                  lineWidth : 8)
            }
        }
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



struct ColorCyclingRectangleShape: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var colorCycle: Double = 0.00
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            ColorCyclingRectangle(steps : 100 ,
                                  amount : colorCycle)
                .frame(width : 200 * 1.618 ,
                       height : 200)
            Slider(value : $colorCycle)
                .padding()
        }
    }
}





 // //////////////
// MARK: PREVIEWS

struct ColorCyclingRectangleShape_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ColorCyclingRectangleShape().previewDevice("iPhone 12 Pro")
    }
}
