//
//  ContentView.swift
//  AI-BOT
//
//  Created by Subhan Qamar on 04/10/2024.
//
//
//i have designed the main page of gpt now using swiftUI having navbar chatview and input bar now i want a buttton that sends a message and store in a structure and listed in a chatview

import SwiftUI

struct ContentView: View {
    @State private var dropDown:Bool = false
    @State private var loading:Bool = false
    @State private var messages: [ChatStructure] = Messages
    @State private var messageText: String = ""
    @State private var role: String = "user"
    var body: some View {
        ZStack{
                VStack{
                    Navbar(dropDown: $dropDown)
                    Spacer()
                    ChatView(messages: $messages)
                    Spacer()
                    InputBar(messages: $messages,messageText: $messageText, role: $role, loading: $loading)
                }
                .disabled(dropDown)
            .overlay(
                dropDown ? Color.gray.opacity(0.3).ignoresSafeArea(): nil
        )
            if dropDown {
                SideBar(dropDown: $dropDown)
                    .frame(width: 400)
                    .transition(.move(edge: .leading))
                    .animation(.easeIn(duration: 0.9), value: dropDown)
            }
        }

    }
}

#Preview {
    ContentView()
}
