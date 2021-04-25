// CreativeBordersAndFills_Part1.swift
/**
 SOURCE :
 
 https://www.hackingwithswift.com/books/ios-swiftui/creative-borders-and-fills-using-imagepaint
 
 SwiftUI gives us a dedicated type that wraps images
 in a way that we have complete control over how they should be rendered ,
 which in turn means we can use them for borders and fills without problem .
 The type is called `ImagePaint` , and it is created using one to three parameters .
 At the very least you need to give it an Image to work with as its first parameter ,
 but you can also provide a rectangle within that image
 to use as the source of your drawing specified in the range of 0 to 1 (the second parameter) ,
 and a scale for that image (the third parameter) .
 Those second and third parameters have sensible default values of “the whole image” and “100% scale” ,
 so you can sometimes ignore them .
 */

import SwiftUI



struct CreativeBordersAndFills_Part1: View {
    
    var body: some View {
        
        ZStack {
            Color
                .yellow
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing : 20) {
                Text("hello Sun")
                    .frame(width : 200.00  ,
                           height : 200.00)
                    .background(
                        Image("sunIcon")
                            .resizable()
                            .scaledToFill()
                    )
                Text("hello Sun")
                    .frame(width : 300 ,
                           height : 200)
                    // .border(Image("sunIcon") , width : 30) // ERROR
                    .border(ImagePaint(image : Image("sunIcon") ,
                                       scale : 0.2 ) ,
                            width : 50)
                Text("hello Sun")
                    .frame(width : 300.00 ,
                           height : 200.00)
                    .border(ImagePaint(image : Image("sunIcon") ,
                                       sourceRect : CGRect(x : 0.00 ,
                                                           y : 0.25 ,
                                                           width : 1.00 ,
                                                           height : 0.50) ,
                                       scale : 0.05) ,
                            width : 30.00)
            }
        }
    }
}





struct CreativeBordersAndFills_Part1_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CreativeBordersAndFills_Part1().previewDevice("iPhone 12 Pro")
    }
}
