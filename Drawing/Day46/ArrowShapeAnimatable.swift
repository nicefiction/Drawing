// MARK: ArrowShapeAnimatable.swift
/**
 CHALLENGE :
 https://www.hackingwithswift.com/books/ios-swiftui/drawing-wrap-up
 */

import SwiftUI



struct TriangleShape2: Shape {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var lineThicknessAmount: CGFloat
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var animatableShape: CGFloat {
        
        get {
            lineThicknessAmount
        }
        
        set {
            lineThicknessAmount = newValue
        }
    }
    
     // /////////////////
    //  PROTOCOL METHODS
    
    func path(in rect: CGRect)
    -> Path {
        
        var path: Path = Path()
        
        path.move(to : CGPoint(x : rect.midX , y : rect.minY))
        path.addLine(to : CGPoint(x : rect.minX , y : rect.maxY))
        path.addLine(to : CGPoint(x : rect.maxX , y : rect.maxY))
        path.addLine(to : CGPoint(x : rect.midX , y : rect.minY))
        path.addLine(to : CGPoint(x : rect.minX , y : rect.maxY))
        
        return path
    }
}



struct ArrowShapeAnimatable: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    let goldenRatio: CGFloat = 1.618
    
    
    
     // ///////////////////////
    // MARK: PROPERTY WRAPPERS
    
    @State private var lineThicknessAmount: CGFloat = 8
    
    
    
    // //////////////////////////
   //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack(spacing : 0) {
            TriangleShape()
                .stroke(lineWidth : lineThicknessAmount)
                .frame(width : 150 * goldenRatio ,
                       height : 100)
            Rectangle()
                .frame(width : 150 ,
                       height : 150 * goldenRatio)
                .foregroundColor(Color
                                    .blue
                                    .opacity(0.00))
                .overlay(
                    Rectangle()
                        .stroke(lineWidth : lineThicknessAmount))
            // Optional :
            Text("\(Int(lineThicknessAmount))")
                .font(.largeTitle)
                .bold()
                .frame(height : 100)
            Slider(value: $lineThicknessAmount , in : 1...10)
                .padding(.horizontal)
        }
        .onTapGesture {
            withAnimation {
                lineThicknessAmount = CGFloat(Int.random(in: 1...10))
            }
        }
    }
}





 // //////////////
// MARK: PREVIEWS

struct ArrowShapeAnimatable_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ArrowShapeAnimatable().previewDevice("iPhone 12 Pro")
    }
}
