//
//  InputBar.swift
//  AI-BOT
//
//  Created by Subhan Qamar on 04/10/2024.
//

import SwiftUI

struct InputBar: View {
    @Binding var messages: [ChatStructure]
    @Binding var messageText: String
    @Binding var role: String
    @Binding var loading: Bool
    @State var isAnimating: Bool = false
 
    var body: some View {
        VStack{
            
            if loading {
                Image(systemName: "circle.hexagongrid")
                .font(.largeTitle)
                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
                .onAppear {
                isAnimating = true
            }
                .padding()
            }
            
            HStack{
                Rectangle()
                    .fill(.quinary)
                    .frame(height: 50)
                    .cornerRadius(40)
                    .padding(.horizontal,15)
                    .overlay(
                        HStack{
    
                            Button(action: {
                                print("Link button pressed")
                            }){
                                Image(systemName: "link")
                                    .foregroundColor(.black)
                            }
                            TextField("Message BOT", text: $messageText)
                                .onSubmit{
                                     sendMessage()
                                }

                            Button(action: {
                                 sendMessage()
                            }){
                                Image(systemName: "arrowshape.up.circle.fill")
                                    .foregroundColor(.gray)
                            }
                            
                                
                        }.padding(.horizontal,30)
                        )
            }
            Text("AI BOT can make mistakesCheck important Info")
                .font(.custom("", size: 10))
            
        }
    }
    
//    private func sendMessage() {
//            if !messageText.isEmpty {
//                let newMessage = ChatStructure(message: messageText, role: role)
//                messages.append(newMessage)
//                print("New message added: \(messageText)")
//                messageText = ""
//            }
//        }

    private func sendMessage() {
        loading = true
        if !messageText.isEmpty {
                let newMessage = ChatStructure(message:messageText, role: role)
                messages.append(newMessage)
                print("New message added: \(messageText)")
                    }
        
        guard let url = URL(string: "https://metallama-git-main-subhan-hub1917s-projects.vercel.app/api/v1/metallama/") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
            "message": messageText
    ]
    
        messageText = ""
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the error
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            // Ensure we have data
            guard let data = data else {
                print("No data returned.")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(Response.self, from: data)
                print(response)
                let new = ChatStructure(message: response.result, role: "system")
                messages.append(new)
            } catch {
                loading = false
                print("Decoding error: \(error)")
            }
        }
        loading = false
        task.resume()
    }

    
    
    struct Response :Codable {
        let status:Bool
        let result:String
    }

    

}

#Preview {
    InputBar(messages: .constant([]), messageText: .constant(""), role: .constant("user"),loading:.constant(true))
}
