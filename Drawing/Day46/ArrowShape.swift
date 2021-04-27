// MARK: ArrowShape.swift

import SwiftUI



struct TriangleShape: Shape {
    
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



struct ArrowShape: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        let goldenRatio: CGFloat = 1.618
        
        ZStack {
            TriangleShape()
                .stroke(lineWidth: 8)
                .frame(width : 150 * goldenRatio , height : 100)
            VStack {
                Rectangle()
                    .frame(width : 150 * goldenRatio , height : 335)
                    .foregroundColor(Color.blue.opacity(0.00))
                Rectangle()
                    .frame(width : 150 , height : 150 * goldenRatio)
                    .foregroundColor(Color.blue.opacity(0.00))
                    .overlay(Rectangle().stroke(lineWidth: 8))
            }
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ArrowShape_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ArrowShape().previewDevice("iPhone 12 Pro")
    }
}
