import SwiftUI


struct VerificationCodeView: View {
    @Environment(\.dismiss) private var dismiss
    @State var verificationCode: VerificationCode
    @State private var enteredCode: String = ""
    @State private var isCodeCorrect: Bool = false
    @State private var isNavigating: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text(NSLocalizedString("Enter a code", comment: ""))
                .font(.system(size: UIConstants.textFontSize))
                .padding(.bottom, 10)
                .foregroundColor(UIConstants.fontColor)
                .bold()
            Group {
                Text(NSLocalizedString("Sent the code to the number", comment: ""))
                Text("+7 \(verificationCode.phoneNumber)")
            }
            .font(.system(size: UIConstants.smallTextFontSize))
            .foregroundColor(UIConstants.fontColor)
            .multilineTextAlignment(.center)
            .padding(.bottom, 20)
            .lineSpacing(8)
            
            CodeField(enteredCode: $enteredCode, verificationCode: verificationCode, isCodeCorrect: $isCodeCorrect)
            
            Spacer()
            
            Button(action: {
                enteredCode = ""
            }) {
                Text(NSLocalizedString("Request code again", comment: ""))
                    .foregroundColor(UIConstants.brandButtonColor)
                    .bold()
                    .padding(.top, 20)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .onChange(of: isCodeCorrect) { newValue in
            if newValue {
                isNavigating = true
            }
        }
        .navigationDestination(isPresented: $isNavigating) {
            ContactsMainView()
                .environmentObject(ContactStore())
                .navigationBarBackButtonHidden(true)
        }
    }
    
    private var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(UIConstants.fontColor)
        }
    }
}


struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeView(verificationCode: VerificationCode(phoneNumber: "999 999-99-99", code: "1111"))
    }
}
