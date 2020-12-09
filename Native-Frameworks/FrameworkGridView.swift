import SwiftUI

struct FrameworkGridView: View {

    @StateObject private var viewModel = FrameworkGridViewModel()
    @State private var isPressed = false
    @State private var isGridviewSelected = true
    @State private var isListviewSelected = false
    @State private var isPopupDisplayed = false
    
    var selectionView: some View {
        HStack {
            
            Spacer()
            
            VStack {
                PopupSelectionView(isGridviewSelected: $isGridviewSelected, isListviewSelected: $isListviewSelected)
                
                Spacer()
            }
            .padding(.top, 100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .popupBackground()
        .onTapGesture {
            withAnimation {
                self.isPressed.toggle()
            }
        }
    }
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            NavigationView {
                if isListviewSelected {
                    List {
                        ForEach(MockData.frameworks) { framework in
                            NavigationLink(destination: FrameworkDetailView(isShowingDetailView: $viewModel.isShowingDetailView, isShowingGridviewSelected: $isGridviewSelected, framework: framework)) {
                                FrameworkListTitleView(framework: framework)
                            }
                        }
                        .navigationTitle("🍎 Frameworks")
                    }
                } else {
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
                                isShowingDetailView: $viewModel.isShowingDetailView, isShowingGridviewSelected: $isGridviewSelected,
                                framework: viewModel.selectedFramework
                            )
                        }
                    }
                }
            }
            
            if isPressed {
                selectionView
            }
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    
    static let deviceName = ["iPhone 12 Pro", "iPhone SE (2nd generation)", "iPhone 11 Pro Max"]
    
    static var previews: some View {
        ForEach(deviceName, id: \.self) { device in
            FrameworkGridView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
                .preferredColorScheme(.dark)
        }
    }
}
