
import SwiftUI

struct SecondView: View {
    @State var updatingText: String = "init"
    var body: some View {
        VStack{
            Text("\(updatingText)")
            TextField("SwiftUI TextField", text: $updatingText)
            UITextViewRepresentable(text: $updatingText)
                .padding()
        }
    }
}

struct UITextViewRepresentable: UIViewRepresentable {
    typealias UIViewType = UITextView
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text2: $text)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var text2: String
        
        init(text2: Binding<String>) {
            self._text2 = text2
        }
        
        func textViewDidChange(_ textView: UITextView) {
            text2 = textView.text
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
