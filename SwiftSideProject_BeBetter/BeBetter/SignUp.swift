//
//  SignUp.swift
//  BeBetter
//
//  Created by Minyi on 2021/1/30.
//

import SwiftUI

struct SignUp: View {
    
    @State var NewUserName : String = ""
    @State var NewPassword : String = ""
    @State var NewEmail : String = ""
    @State var GoalMonth : String = ""
    @State var GoalKG :String = ""
    
    
    
    @State var imageData : Data = .init(capacity:0)
    @State var show = false
    @State var imagepicker = false
    @State var source : UIImagePickerController.SourceType = .photoLibrary
    
    @State var MoveToMain = false
    
    var body: some View {
        VStack{
            NavigationLink(
                destination: ImagePicker(show: $imagepicker, image: $imageData, source: source),
                isActive: $imagepicker){
                EmptyView()
            }
            Spacer()
            Text("Sign Up").font(.custom("SPShemokmedi", size: 40))
                .offset( y: -40)
            
            HStack {
                VStack {
                    if imageData.count != 0 {
                        Image(uiImage: UIImage(data:self.imageData)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame( height: 150, alignment: .center)
                            .clipped()
                            .cornerRadius(150)
                            .offset( y: -30)
                            .overlay(
                                CameraButtonView(show: $show)
                                    .offset(x:50,y: 30)
                                
                            )
                    } else{
                        Image("init_selfie")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame( height: 150, alignment: .center)
                            .clipped()
                            .cornerRadius(150)
                            .offset( y: -30)
                            .overlay(
                                CameraButtonView(show: $show)
                                    .offset(x:50,y: 30)
                                
                            )
                        
                    }
                }
                VStack{
                    Text("How long journy takes : ")
                    TextField("Month",text: $GoalMonth)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                        .cornerRadius(5)
                        .padding(.bottom,10)
                    Text("How much to loss :")
                    TextField("KG",text: $GoalKG)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                        .cornerRadius(5)
                        .padding(.bottom,10)
                }.offset( y: -20)
            }.offset( y: -20)
            
            SignUpData(NewUserName: $NewUserName, NewPassword: $NewPassword, NewEmail: $NewEmail)
            
            Button(action: {
                self.MoveToMain.toggle()
                ContentView().SuccessLogin = true
            }, label: {
                Text("Next").font(.custom("SPShemokmedi", size: 25)).foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
            }).offset( y: -70)
            Spacer()
            NavigationLink(
                destination: MainView(), isActive: $MoveToMain ){
                EmptyView()
            }
            
        }.padding(24)
        .actionSheet(isPresented: $show, content: {
            ()-> ActionSheet in ActionSheet(title: Text("Select Selfie"), message: Text("Please select a selfie from the image gallery or use the camera"), buttons: [ActionSheet.Button.default(Text("Camera"),action: {
                self.source = .camera
                self.imagepicker.toggle()
            }),ActionSheet.Button.default(Text("Photo Gallery"),action: {
                self.source = .photoLibrary
                self.imagepicker.toggle()
            }),
            ActionSheet.Button.cancel()
            ])
        })
        
        
            
            
            
        }
        
    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}


struct SignUpData: View {
    
    @Binding var NewUserName : String
    @Binding var NewPassword : String
    @Binding var NewEmail : String
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("User Name : ")
                .offset( y: -50)
            TextField("",text: $NewUserName)
                .padding()
                .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                .cornerRadius(5)
                .padding(.bottom,10)
                .offset( y: -50)
            Text("Password : ")
                .offset( y: -60)
            TextField("",text: $NewPassword)
                .padding()
                .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                .cornerRadius(5)
                .padding(.bottom,10)
                .offset( y: -60)
            Text("Email : ")
                .offset( y: -70)
            TextField("XXXXX@gmail.com",text: $NewEmail)
                .padding()
                .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                .cornerRadius(5)
                .padding(.bottom,10)
                .offset( y: -70)
            /*HStack{
                Text("How long journy takes : ")
                TextField("Month",text: $NewEmail)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                    .cornerRadius(5)
                    .padding(.bottom,10)
                Text("How much to loss :")
                TextField("KG",text: $NewEmail)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                    .cornerRadius(5)
                    .padding(.bottom,10)
            }.offset( y: -20)*/
            
            
            
        }
    }
}


struct ImagePicker : UIViewControllerRepresentable{
    
    
    @Binding var show : Bool
    @Binding var image : Data
    var source : UIImagePickerController.SourceType
    
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator(parent1:self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator : NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        
        var parent : ImagePicker
        init(parent1:ImagePicker) {
            parent = parent1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            let data = image.pngData()
            self.parent.image = data!
            self.parent.show.toggle()
        }
        
        }
        
    }
