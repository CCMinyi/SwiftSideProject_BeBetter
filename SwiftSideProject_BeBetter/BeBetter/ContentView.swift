//
//  ContentView.swift
//  BeBetter
//
//  Created by Minyi on 2021/1/27.
//

import SwiftUI

struct ContentView: View {
    
    @State var SuccessLogin = false
    
    var body: some View {
        NavigationView{
            Group{
                if SuccessLogin {
                    MainView()
                } else {
                    LoginView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

