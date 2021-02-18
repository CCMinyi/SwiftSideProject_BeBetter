//
//  SignUpView.swift
//  BeBetter
//
//  Created by Minyi on 2021/1/27.
//
/*
import SwiftUI



struct SignUpView: View {
    
    @State var NewUserName : String = ""
    @State var NewPassword : String = ""
    @State var NewEmail : String = ""
    
    @State var ShowImagePicker : Bool = false
    @State var showActionSheet : Bool = false
    @State var image:Image?
    @State var sourceType:Int = 0
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Sign Up").font(.custom("SPShemokmedi", size: 40))
                
                VStack {
                    image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame( height: 150, alignment: .center)
                        .clipped()
                        .cornerRadius(150)
                        .overlay(
                            CameraButtonView(showActionSheet: $showActionSheet)
                                .offset(x:50,y: 65)
                            
                        )
                }
                
                SignUpData(NewUserName: $NewUserName, NewPassword: $NewPassword, NewEmail: $NewEmail)
            }.padding()
            .actionSheet(isPresented: $showActionSheet, content: {
                ()-> ActionSheet in ActionSheet(title: Text("Select Selfie"), message: Text("Please select a selfie from the image gallery or use the camera"), buttons: [ActionSheet.Button.default(Text("Camera"),action: {
                    self.sourceType=0
                    self.ShowImagePicker.toggle()
                }),ActionSheet.Button.default(Text("Photo Gallery"),action: {
                    self.sourceType = 1
                    self.ShowImagePicker.toggle()
                }),
                ActionSheet.Button.cancel()
                ])
            })
            if ShowImagePicker {
                ImagePicker(isVisible: $ShowImagePicker,image: $image , sourceType : sourceType)
            }
            
        }
        .onAppear{self.image = Image("init_selfie")}
    }
}

struct SignUpView_Previews: PreviewProvider {    static var previews: some View {
        SignUpView()
    }
}

struct SignUpData: View {
    
    @Binding var NewUserName : String
    @Binding var NewPassword : String
    @Binding var NewEmail : String
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("User Name : ")
            TextField("",text: $NewUserName)
                .padding()
                .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                .cornerRadius(5)
                .padding(.bottom,20)
            Text("Password : ")
            TextField("",text: $NewPassword)
                .padding()
                .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                .cornerRadius(5)
                .padding(.bottom,20)
            Text("Email : ")
            TextField("XXXXX@gmail.com",text: $NewEmail)
                .padding()
                .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                .cornerRadius(5)
                .padding(.bottom,20)
            HStack{
                Text("How long journy takes : ")
                TextField("Month",text: $NewEmail)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                    .cornerRadius(5)
                    .padding(.bottom,20)
                Text("How much to loss :")
                TextField("KG",text: $NewEmail)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                    .cornerRadius(5)
                    .padding(.bottom,20)
            }
            
            
            
        }
    }
}

 */
