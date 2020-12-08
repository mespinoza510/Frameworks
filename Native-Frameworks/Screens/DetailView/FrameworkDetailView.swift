import SwiftUI

struct FrameworkDetailView: View {
    
    @Binding var isShowingDetailView: Bool
    @Binding var isShowingGridviewSelected: Bool
    @State private var isShowingSafariView = false
    
    var framework: Framework
    
    var body: some View {
        VStack {
            
            if isShowingGridviewSelected {
                XDismissButton(isShowingModal: $isShowingDetailView)
            }
            
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
        }.sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: (URL(string: framework.urlString) ?? URL(string: "www.apple.com")!))
        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(isShowingDetailView: .constant(false), isShowingGridviewSelected: .constant(true), framework: MockData.sampleFramework)
            .preferredColorScheme(.dark)
    }
}
