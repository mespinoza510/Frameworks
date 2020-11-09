import SwiftUI

struct FrameworkDetailView: View {
    
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var framework: Framework
    
    var body: some View {
        VStack {
            
            XDismissButton(isShowingModal: $isShowingDetailView)
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                self.isShowingSafariView = true
            } label: {
                FrameworksButton(title: "More Info")
            }
        }.fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: (URL(string: framework.urlString) ?? URL(string: "www.apple.com")!))
        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(isShowingDetailView: .constant(false), framework: MockData.sampleFramework)
            .preferredColorScheme(.dark)
    }
}
