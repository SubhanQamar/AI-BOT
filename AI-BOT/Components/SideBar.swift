import SwiftUI

struct SideBar: View {
    @Binding var dropDown: Bool

    var body: some View {
        NavigationStack {
            HStack(alignment: .center, spacing: 100) {
                VStack {
                    HStack {
                        Button(action: {
                            withAnimation {
                                dropDown.toggle()
                            }
                        }) {
                            Image(systemName: "list.bullet.indent")
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)

                    HStack {
                        Image(systemName: "circle.hexagongrid")
                        Text("Chat GPT")
                            .font(.system(size: 15, weight: .regular))
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 2)

                    NavigationLink(value: dropDown) {
                        HStack {
                            Image(systemName: "square.grid.4x3.fill")
                            Text("Image Generation")
                                .font(.system(size: 15, weight: .regular))
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 2)
                        .foregroundColor(.black)
                    }

                    HStack {
                        Text("Chats")
                            .font(.system(size: 12, weight: .bold))
                            .padding(.horizontal, 10)
                        Spacer()
                    }
                    .padding(.vertical, 10)

                    VStack {
                        HStack {
                            Text("Creating Project Folders")
                                .font(.system(size: 15, weight: .regular))
                                .lineLimit(1)
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 5)

                    Spacer()
                }
                .background(Color.white)
                .cornerRadius(10)

                VStack {
                    Spacer()
                }
            }
            .navigationDestination(for: Bool.self) { value in
                Text("HELLO, Bool value: \(value ? "True" : "False")")
            .onAppear {
                    let appearance = UINavigationBarAppearance()
                    appearance.configureWithOpaqueBackground()
                    appearance.backgroundColor = .white
                    appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
                    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
                    appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
                    UINavigationBar.appearance().standardAppearance = appearance
                    UINavigationBar.appearance().scrollEdgeAppearance = appearance
                    UINavigationBar.appearance().tintColor = UIColor.black
                    }
            }
            
        }
    }

    
}

#Preview {
    SideBar(dropDown: .constant(false))
}
