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
        }.sheet(isPresented: $isShowingSafariView, content: { // TODO: You show screen `fullScreenCover` under `fullScreenCover`, I think you should call only 1 time, probably in first place in your Grid you should use list and push your screen 
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
