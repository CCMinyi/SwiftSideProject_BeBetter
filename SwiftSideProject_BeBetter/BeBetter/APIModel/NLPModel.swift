//
//  NLPModel.swift
//  BeBetter
//
//  Created by Minyi on 2021/2/19.
//

import SwiftUI
import Combine

struct ServerMessage : Decodable{
    var labels : Int
}



class HttpNLP : ObservableObject {
    
    @Published var SadMood : Bool

    var didChange = PassthroughSubject<HttpNLP,Never>()
    
    var authenticated = false{
        didSet{
            didChange.send(self)
        }
    }
    init(){
        self.SadMood = false
    }
    
    func checkDetails(feeling:String) {
        // NLP API URL
        guard let url = URL(string: "https://9080722f4a2e.ngrok.io/bert/sentiment/en") else {return}
        
        let databody = ["text":feeling]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: databody)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            
            guard let data = data else{return}
            
            let finalData = try? JSONDecoder().decode(ServerMessage.self, from: data)
            let NLP_result = finalData!.labels
            print(NLP_result)
            if NLP_result == 1{
                DispatchQueue.main.sync {
                    self.SadMood = true
                    //CaloriesTracking().CaloriesColor = true
                }
            }
            /*DispatchQueue.global().async {
                if NLP_result == 1{
                    Goal().hiddenTrigger.toggle()
                }else{
                    return
                }
                
            }*/
            
            
        }.resume()
    }
}
