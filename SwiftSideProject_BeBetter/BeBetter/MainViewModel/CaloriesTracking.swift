//
//  CaloriesTracking.swift
//  BeBetter
//
//  Created by Minyi on 2021/2/1.
//

import SwiftUI

struct CaloriesTracking: View {
    
    @State var PickerSelectedItem = 0
    
    @State var DatePoints : [[CGFloat]] = [
        [158,167,159,193,186,143,182],
        [185,177,191,182,165,173,184]
    ]
    //var manager = HttpNLP()
    var body: some View {
        ZStack{
            if Goal().manager.SadMood == true{
                Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
                    .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            } else {
                Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
                    .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            VStack{
                Text("Tracking")
                    .foregroundColor(.black)
                    .font(.custom("SPShemokmedi", size: 40))
                
                Picker(selection: $PickerSelectedItem, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
                    Text("Calory Intake").tag(0)
                    Text("Weight").tag(1)
                }).pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal,24)
                
                HStack(spacing:16){
                    BarView(value:DatePoints[PickerSelectedItem][0],weekname: "Su")
                    BarView(value:DatePoints[PickerSelectedItem][1],weekname: "M")
                    BarView(value:DatePoints[PickerSelectedItem][2],weekname: "T")
                    BarView(value:DatePoints[PickerSelectedItem][3],weekname: "W")
                    BarView(value:DatePoints[PickerSelectedItem][4],weekname: "Th")
                    BarView(value:DatePoints[PickerSelectedItem][5],weekname: "F")
                    BarView(value:DatePoints[PickerSelectedItem][6],weekname: "Sa")
                }.padding(.top,24)
                .animation(.default)
                
            }
        }
        
    }
}

struct CaloriesTracking_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesTracking()
    }
}

struct BarView: View {
    
    var value : CGFloat
    
    var weekname : String
    
    var body: some View {
        VStack {
            ZStack(alignment:.bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            }
            Text(weekname)
        }
    }
}
