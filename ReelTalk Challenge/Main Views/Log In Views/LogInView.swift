import SwiftUI

/// Originally made this LogInView, but after asking realized it was unnecessary. I'll keep it here though, just in case.

struct LogInView: View {
    @State private var emailTextField = ""
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack{
                ZStack {
                    Image("movies")
                    VStack {
                        Image("Final Proposed Logo(small)")
                            .padding(.top)
                        Spacer()
                            .frame(height: 45)
                        VStack {
                            CustomText(text: "Welcome Back!", color: .white, textSize: 18)
                                .bold()
                                .padding(1)
                            CustomText(text: "Please enter your email.", color: Color.gray, textSize: 12)
                        }
                        .padding(.init(top: 0, leading: 0, bottom: -20, trailing: 0))
                    }
                }
                .mask(LinearGradient(gradient: Gradient(colors: [.black.opacity(1.0), .black.opacity(1.0), .black.opacity(0.2), .black.opacity(0.1)]), startPoint: .center, endPoint: .bottom))

                EmailTextField()
                    .padding(.bottom)
                
                VStack {
                    Spacer()
                    NavigationLink {
                        WelcomeView()
                            .toolbarRole(.editor)
                    } label: {
                        ContinueButton(text: "Continue")
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .padding()
                    }
                    Spacer()
                    HStack(alignment: .top) {
                        CustomText(text: "Don't have an account?", color: .white)
                            .bold()
                        NavigationLink {
                            Text("Sign Up")
                                .toolbarRole(.editor)
                        } label: {
                            CustomText(text: "Sign Up", color: .customTint)
                        }
                    }
                    .padding(.bottom)
                    Spacer()
                }
                
            }
                .foregroundColor(.white)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                        ToolbarItem(placement: .topBarLeading){
                            ZStack {
                                Image("Movies")
                                CustomText(text: "Log In", color: .white)
                                    .bold()
                            }
                        }

                    }
                }
        }
    }


#Preview {
    LogInView()
}
