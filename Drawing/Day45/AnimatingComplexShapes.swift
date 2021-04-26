// MARK: AnimatingComplexShapes.swift
/**
 SOURCE :
 https://www.hackingwithswift.com/books/ios-swiftui/animating-complex-shapes-with-animatablepair
 */

import SwiftUI



struct Checkerboard: Shape {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var rows: Int
    var columns: Int
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    /**
     NOTE OLIVIER :
     For the animation to work ,
     this property has to be called `animatableData` .
     It appears to be part of the `AnimatablePair` type :
     */
    public var animatableData: AnimatablePair<Double , Double> {
        /**
         `AnimatablePair` is a type that contains a pair of animatable values ,
         and because both its values can be animated ...
         */
        get {
            AnimatablePair(Double(rows) , Double(columns))
        }
        /**
         ... the `AnimatablePair` can itself be animated .
         We can read individual values from the pair using `.first` and `.second` .
         */
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
    
    
    
     // //////////////
    //  MARK: METHODS
    
    func path(in rect: CGRect)
    -> Path {
        
        var path: Path = Path()
        
        // Figure out how big each row and column needs to be :
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        
        // Loop over all rows and columns , making alternating squares colored :
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of : 2) {
                    // This square should be colored ; add a rectangle here :
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)
                    
                    let rectangle = CGRect(x : startX ,
                                           y : startY ,
                                           width : columnSize ,
                                           height : rowSize)
                    path.addRect(rectangle)
                }
            }
        }
        
        return path
    }
}



struct AnimatingComplexShapes: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var numberOfRows: Int = 4
    @State private var numberOfColumns: Int = 4
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        ZStack {
            Color
                .red
                .edgesIgnoringSafeArea(.all)
            Checkerboard(rows : numberOfRows , columns : numberOfColumns)
                .frame(width : 300 , height : 300)
                .overlay(
                    Rectangle()
                        .stroke(lineWidth: 0.75))
                .onTapGesture {
                    withAnimation(.linear(duration : 3)) {
                        numberOfRows *= 2
                        numberOfColumns *= 2
                        // numberOfRows = 8
                        // numberOfColumns = 16
                    }
                }
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct AnimatingComplexShapes_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AnimatingComplexShapes().previewDevice("iPhone 12 Pro")
    }
}
