//
//  Goal.swift
//  BeBetter
//
//  Created by Minyi on 2021/2/6.
//

import SwiftUI
import Combine

struct Goal: View {
    
    @State var currentIndex: Int = 0
    private let _maxIndex = 2
    
    @State var feeling:String = ""
    @ObservedObject var manager = HttpNLP()
    //var manager = HttpNLP()
    @State var hiddenTrigger = false
    //@State var SadMood:Bool = false
    var body: some View {
         
        ZStack {
            if (self.manager.SadMood==true){
                Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
                    .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            } else{
                Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
                    .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            /*changeBkColor(SadMood: self.manager.SadMood)
                .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)*/
            VStack {
                
                VStack {
                    
                    Text("心情小語").font(.custom("hanwangkantan.ttf", size: 40))
                    TextField("Testing", text: $feeling)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                        .cornerRadius(5)
                        .padding(.bottom,10)
                    Button(action: {
                        
                        self.manager.checkDetails( feeling: self.feeling)
                        if self.manager.SadMood == true{self.hiddenTrigger.toggle()}else{return}
                    }, label: {
                        Text("Button")
                    })
                }.padding()
                VStack {
                    Text("\(SignUp().GoalMonth)個月後我要變成這樣！").font(.custom("hanwangkantan.ttf", size: 20))
                    VStack {
                        if SignUp().imageData.count != 0 {
                            Image(uiImage: UIImage(data:SignUp().imageData)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame( height: 150, alignment: .center)
                                .clipped()
                                .cornerRadius(150)
                                
                        } else{
                            Image("init_selfie")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame( height: 150, alignment: .center)
                                .clipped()
                                .cornerRadius(150)
                            
                        }
                    }
                }
                PagingView(index: $currentIndex, maxIndex: _maxIndex) {
                    SplashView( title: "改變你自己", description: "永遠不要低估一個胖子瘦下來的魅力")
                    SplashView( title: "再節制一點", description: "少熱量、多低卡，明天你女友是金泫雅")
                    SplashView( title: "堅持✊", description: "連減肥這點小事都做不好，你還能幹什麼!")
                }
                PagingControlView(index: $currentIndex, maxIndex: _maxIndex)
                
            }
        }
        
        
        
    }
    
}

struct Goal_Previews: PreviewProvider {
    static var previews: some View {
        Goal()
    }
}




struct PagingView<Content>: View where Content: View {
    
    @Binding var index: Int
    let maxIndex: Int
    let content: () -> Content
    
    @State private var _offset: CGFloat = .zero
    @State private var _isDragging = false
    
    init(index: Binding<Int>, maxIndex: Int, @ViewBuilder content: @escaping() -> Content) {
        self._index = index
        self.maxIndex = maxIndex
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    self.content()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
            }
            .content.offset(x: self.offset(in: geometry), y: 0)
            .frame(width: geometry.size.width, alignment: .leading)
            .gesture(
                DragGesture().onChanged { value in
                    _isDragging = true
                    _offset = -CGFloat(self.index) * geometry.size.width + value.translation.width
                }
                .onEnded { value in
                    let predictedEndOffset = -CGFloat(self.index) * geometry.size.width + value.predictedEndTranslation.width
                    let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width))
                    self.index = clampedIndex(from: predictedIndex)
                    withAnimation(.easeOut) {
                        _isDragging = false
                    }
                }
            )
        }.clipped()
    }
    
    func offset(in geometry: GeometryProxy) -> CGFloat {
        if _isDragging {
            return max(min(self._offset, 0), -CGFloat(self.maxIndex) * geometry.size.width)
        }
        return -CGFloat(self.index) * geometry.size.width
    }
    
    func clampedIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(max(predictedIndex, self.index - 1), self.index + 1)
        guard newIndex >= 0 else { return 0 }
        guard newIndex <= maxIndex else { return maxIndex }
        return newIndex
    }
    
}

struct PagingControlView: View {
    
    @Binding var index: Int
    
    let maxIndex: Int
    
    var normalPageControl: some View {
        Circle()
            .stroke(Color.white)
            .frame(width: 8, height: 8)
    }
    
    var selectedPageControl: some View {
        RoundedRectangle(cornerRadius: 4)
            //.fill(Color.primaryDark)
            .frame(width: 20, height: 9)
    }
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0...maxIndex, id: \.self) { index in
                self.index == index ? selectedPageControl : nil
                self.index == index ? nil : normalPageControl
            }
        }
    }
    
}


struct SplashView: View {

    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.system(size: 30, weight: .medium))
                Text(description)
                    .font(.system(size: 16, weight: .regular))
            }
            .foregroundColor(.black)
            .padding(.leading)
            .padding(.trailing)
        }
    }
    
}



/*func changeBkColor(SadMood: Bool) -> Color
{
    if(SadMood == true)
    {
        return Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1));
    }
    
    else
    {
        return Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1));
    }
}*/
