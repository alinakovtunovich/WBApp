import SwiftUI


struct VerificationCodeView: View {
    @Environment(\.dismiss) private var dismiss
    @State var phoneNumber: String
    @State private var code: String = ""
    @State private var isCodeCorrect: Bool = false
    @State private var isNavigating: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Введите код")
                .font(.system(size: UIConstants.textFontSize))
                .bold()
                .padding(.bottom, 20)
            
            Text("Отправили код на номер \n +7 \(phoneNumber)")
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
            
            CodeField(code: $code, isCodeCorrect: $isCodeCorrect)
            
            Spacer()
            
            Button(action: {
                code = ""
            }) {
                Text("Запросить код повторно")
                    .foregroundColor(UIConstants.brandButtonColor)
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
        VerificationCodeView(phoneNumber: "999 999-99-99")
    }
}
