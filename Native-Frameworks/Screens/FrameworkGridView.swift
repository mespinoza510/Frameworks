import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    @State private var isPressed = false
    @State private var isGridviewSelected = true
    @State private var isListviewSelected = false
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: viewModel.columns) {
                        ForEach(MockData.frameworks) { framework in
                            FrameworkTitleView(framework: framework)
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                                }
                        }
                    }
                    .navigationTitle("🍎 Frameworks")
                    .navigationBarItems(trailing: EllipsisButton(isPressed: $isPressed))
                    .fullScreenCover(isPresented: $viewModel.isShowingDetailView) {
                        FrameworkDetailView(isShowingDetailView: $viewModel.isShowingDetailView, framework: viewModel.selectedFramework ?? MockData.sampleFramework)
                    }
                }
                
            }
            //TODO: Refactor logic to viewModel
            if isPressed {
                GeometryReader { geo in
                    PopupSelectionView(isGridviewSelected: $isGridviewSelected, isListviewSelected: $isListviewSelected)
                }
                .offset(x: UIScreen.screenWidth * 0.61, y: UIScreen.screenHeight * 0.1)
                .background(Color.black.opacity(0.65))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        self.isPressed.toggle()
                    }
                }
            }
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}

struct EllipsisButton: View {
    
    @Binding var isPressed: Bool
    
    var body: some View {
        Button {
            withAnimation {
                self.isPressed.toggle()
            }
        } label: {
            Image(systemName: "ellipsis")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .imageScale(.large)
                .rotationEffect(.degrees(90))
                .foregroundColor(Color(.label))
        }
    }
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    
}
