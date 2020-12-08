import SwiftUI

struct PopupSelectionView: View {
    
    @Binding var isGridviewSelected: Bool
    @Binding var isListviewSelected: Bool
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 15) {
            
            Button {
                self.isGridviewSelected = true
                self.isListviewSelected = false
            } label: {
                HStack(alignment: .bottom) {
                    if isGridviewSelected {
                        CheckmarkView()
                        ButtonTitleView(title: "Grid View")
                    } else {
                        ButtonTitleView(title: "Grid View")
                    }
                }
            }
            
            Divider()
                .frame(width: 195)
                .background(Color(.white))
            
            Button {
                self.isListviewSelected = true
                self.isGridviewSelected = false
            } label: {
                HStack(alignment: .bottom) {
                    if isListviewSelected {
                        CheckmarkView()
                        ButtonTitleView(title: "List view")
                    } else {
                        ButtonTitleView(title: "List View")
                    }
                }
            }
            
        }
        .padding()
        .squareFrame(side: 150)
        .background(Color(.darkGray))
//        .clipShape(ArrowShape()) TODO: Add arrowshape layer on top to keep rounded corners
        .cornerRadius(20)
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        PopupSelectionView(isGridviewSelected: .constant(true), isListviewSelected: .constant(false))
            .preferredColorScheme(.light)
    }
}

struct CheckmarkView: View {
    var body: some View {
        Image(systemName: "checkmark")
            .resizable()
            .frame(width: 15, height: 15)
            .font(.body)
            .foregroundColor(.green)
            .imageScale(.medium)
            .scaledToFit()
            .padding(.bottom, 5)
    }
}

struct ButtonTitleView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(Color(.white))
    }
}

struct GridviewButton: View {
    
    @Binding var isGridviewPressed: Bool
    
    var body: some View {
        Button {
            self.isGridviewPressed = true
        } label: {
            HStack(spacing: 20) {
                Text("Grid View")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color(.blue))
            }
        }
    }
}

struct ListviewButton: View {
    
    @Binding var isListviewPressed: Bool
    
    var body: some View {
        Button {
            self.isListviewPressed = true
        } label: {
            HStack(spacing: 20) {
                Text("List View")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color(.label))
            }
        }
    }
}

struct ArrowShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 10))
            path.addLine(to: CGPoint(x: rect.width - 40, y: 10))
            path.addLine(to: CGPoint(x: rect.width - 30, y: 0))
            path.addLine(to: CGPoint(x: rect.width - 20, y: 10))
            path.addLine(to: CGPoint(x: rect.width, y: 10))
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - 10))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 10))
            
        }
    }
}
