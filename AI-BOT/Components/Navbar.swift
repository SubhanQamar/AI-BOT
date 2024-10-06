//
//  SwiftUIView.swift
//  AI-BOT
//
//  Created by Subhan Qamar on 04/10/2024.
//

import SwiftUI

struct Navbar: View {
    @Binding var dropDown: Bool
    var body: some View {
        HStack() {
            Button(action: {
                          dropDown.toggle()
                      }) {
                          Image(systemName: "list.bullet.indent")
                              .foregroundColor(.black)
                      }
            Spacer()
            Text("AI-BOT")
                .font(.title)
            Spacer()
        
            Image(systemName: "pencil")
                .fontWeight(.bold)
        }.padding(.horizontal,15)
    }
}

#Preview {
    Navbar(dropDown: .constant(false) )
}
