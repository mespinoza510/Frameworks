import SwiftUI

struct FrameworkGridView: View {

    @StateObject private var viewModel = FrameworkGridViewModel()
    @State private var isPressed = false
    @State private var isGridviewSelected = true
    @State private var isListviewSelected = false
    
    var selectionView: some View {
        GeometryReader { geo in
            PopupSelectionView(isGridviewSelected: $isGridviewSelected, isListviewSelected: $isListviewSelected)
                .offset(x: geo.size.width * 0.61, y: geo.size.height * 0.11)
                .background(Color.lightBlack)
                .edgesIgnoringSafeArea(.all)
        }
    }
    
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
                            framework: viewModel.selectedFramework
                        )
                    }
                }
                
            }
            
            if isPressed {
                selectionView
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
