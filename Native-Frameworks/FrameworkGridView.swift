import SwiftUI

struct FrameworkGridView: View {

    @StateObject private var viewModel = FrameworkGridViewModel()
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
                        FrameworkDetailView(
                            isShowingDetailView: $viewModel.isShowingDetailView,
                            framework: viewModel.selectedFramework!
                        )
                    }
                }
                
            }
            //TODO: Refactor logic to viewModel
            // Note: Its view and it don't and I dont see any extra logic, but probably you can move it to separete property
            if isPressed {
                GeometryReader { geo in
                    PopupSelectionView(isGridviewSelected: $isGridviewSelected, isListviewSelected: $isListviewSelected)
                }
                .offset(x: UIScreen.screenWidth * 0.61, y: UIScreen.screenHeight * 0.1)
                .background(Color.lightBlack)
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

// TODO: Can you replace this constants with `GeometryReader`
extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}
