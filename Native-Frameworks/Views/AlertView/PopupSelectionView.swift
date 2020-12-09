import SwiftUI

struct PopupSelectionView: View {
    
    @Binding var isGridviewSelected: Bool
    @Binding var isListviewSelected: Bool
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        VStack {
            
            ArrowShape()
                .fill(Color(.darkGray))
                .squareFrame(side: 25)
                .clipShape(ArrowShape())
                .offset(x: 40, y: 10)
            
            
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
            .cornerRadius(20)
        }
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
            .squareFrame(side: 15)
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
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}
