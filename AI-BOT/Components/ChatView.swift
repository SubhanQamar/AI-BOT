//
//  ChatView.swift
//  AI-BOT
//
//  Created by Subhan Qamar on 04/10/2024.
//

import SwiftUI

struct ChatView: View {
    @Binding var messages: [ChatStructure]
    var body: some View {
        ScrollViewReader { scrollView in
        ScrollView(){
            VStack{
                ForEach(messages,id:\.id) { message in
                    if message.role == "user"{
                        HStack{
                            Spacer()
                            Text(message.message)
                                .padding()
                                .background(.quinary)
                                .cornerRadius(20)
                                .font(.custom("",size: 15))
                        }.padding(.horizontal,5)
                    }
                    else{
                        HStack(alignment: .top){
                            Image(systemName: "circle.hexagongrid")
                            Text(message.message)
                                .padding(.horizontal,5)
                                .font(.custom("",size: 15))
                            Spacer()
                        }
                        .padding()
                    }
                }
                
            }.onChange(of: messages) { _ in
                // Scroll to the bottom when messages change
                if let lastMessageID = messages.last?.id {
                    withAnimation {
                        scrollView.scrollTo(lastMessageID, anchor: .bottom)
                    }
                }
            }
        }
    }
       
    }
}

#Preview {
    ChatView(messages: .constant(Messages))
}
