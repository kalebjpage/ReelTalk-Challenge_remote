import SwiftUI

/// A simple screen which displays the message about the rules of the app.

struct KeepItReelView: View {
    @StateObject var buttonController = ContinueButtonController()
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("🚧 Keep it reel, but be kind")
                    .font(.custom("Avenir Next", size: 35))
                    .foregroundStyle((Color.white))
                CustomText(text: "Welcome! We're so excited to have you here!", color: Color("text"))
                    .padding(.bottom)
                CustomText(text: "At ReelTalk, we believe that every individual brings something unique to our community. We are committed to fostering a safe and troll-free environment for everyone to engage in exciting conversations.", color: Color("text"))
                    .padding(.vertical)
                    Text("In our mission to encourage respect, we ask that you join us by adhering to our guidelines - ")
                            .foregroundStyle(Color("text"))
                            .font(.custom("Avenir Next", size: 17))
                     + Text("no cyber-bullying or inappropriate content. ")
                                .foregroundStyle(Color(.white))
                                .font(.custom("Avenir Next", size: 17))
                                .bold()
                    + Text("Failure to adhere to them may result in being banned from our community. Thanks for your cooperation.")
                            .foregroundStyle(Color("text"))
                            .font(.custom("Avenir Next", size: 17))
                            
                VStack(alignment: .leading) {
                    CustomText(text: "With love,", color: Color("text"))
                    CustomText(text: "The Reel Talk Team", color: Color("text"))
                }
                .padding(.vertical)
                ContinueButton(text: "I Agree")
                    .environmentObject(self.buttonController)
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    .padding()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("")
            .navigationBarBackButtonHidden()
        }
        
    }
}

#Preview {
    ZStack {
        Color("background")
            .ignoresSafeArea()
        KeepItReelView()
    }
}
