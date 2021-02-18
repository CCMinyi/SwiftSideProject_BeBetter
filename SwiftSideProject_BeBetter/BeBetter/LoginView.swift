//
//  LoginView.swift
//  BeBetter
//
//  Created by Minyi on 2021/1/27.
//

import SwiftUI

let storeusername = "Allen"
let storepassword = "123456"

struct LoginView: View {
    
    
    
    @State var username : String = ""
    @State var password : String = ""
    

    
    @State var authenticationDidFail : Bool = false
    @State var authenticationDidSucceed : Bool = false
    
    
    @State var MoveToGoalSetting = false
    @State var MoveToSignUp = false
    
    var body: some View {
        
        ZStack{
            Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
                .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ZStack {
                
                
                VStack{
                    LoginTitle()
                    UserNameAndPasswordTextField(username: $username, password: $password)
                    if authenticationDidFail{
                        Text("Wrong user name or password , please try again")
                            .offset(y:-25)
                            .foregroundColor(.red)
                    }
                    
                    
                    HStack{
                        Button(action: {
                            if self.username == storeusername && self.password == storepassword{
                                
                                authenticationDidSucceed = true
                                authenticationDidFail = false
                                
                                MoveToGoalSetting = true
                                
                            }else {
                                
                                authenticationDidFail = true
                                authenticationDidSucceed = false
                                MoveToGoalSetting = false
                            }
                            
                        }){
                            Text("Sign in ").font(.custom("SPShemokmedi", size: 25)).foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                        }
                        
                        Button(action: {
                            MoveToSignUp = true
                        }){
                            Text("Sign up").font(.custom("SPShemokmedi", size: 25))
                                .foregroundColor(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
                        }
                        NavigationLink(
                            destination: MainView(), isActive: $MoveToGoalSetting){EmptyView()}
                        NavigationLink(
                            destination: SignUp(), isActive: $MoveToSignUp){EmptyView()}
                        
                        
                    }
                    
                    
                    
                    
                }
            }
            if authenticationDidSucceed {
                Text("Login succeed")
                    .offset(y:-100)
                    .foregroundColor(Color(#colorLiteral(red: 0.1505931318, green: 0.1485940218, blue: 0.8878549337, alpha: 1)))
            }
            
        }
        
    }
}
    







struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct LoginTitle: View {
    var body: some View {
        Text("Be Better")
            .font(.custom("SPShemokmedi", size: 40))
    }
}

struct UserNameAndPasswordTextField: View {
    
    @Binding var username : String
    @Binding var password : String
    
    var body: some View {
        VStack{
            Group{
                TextField("User Name", text: $username)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                    .cornerRadius(5)
                    .padding(.bottom,20)
            }
            Group{
                TextField("Password", text: $password)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.7055450082, green: 0.7056652904, blue: 0.7055291533, alpha: 1)))
                    .cornerRadius(5)
                    .padding(.bottom,20)
            }
            
        }.padding(40)
    }
}


