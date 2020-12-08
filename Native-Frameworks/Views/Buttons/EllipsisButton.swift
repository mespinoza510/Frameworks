import SwiftUI

struct EllipsisButton: View {
    
    @Binding var isPressed: Bool
    
    let ellipsisImage = SystemImageName.ellipsis.rawValue
    
    var body: some View {
        Button {
            withAnimation {
                self.isPressed.toggle()
            }
        } label: {
            Image(systemName: ellipsisImage)
                .scaledToFit()
                .imageScale(.large)
                .squareFrame(side: 40)
                .foregroundColor(Color(.label))
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(.label), lineWidth: 3))
                .rotationEffect(.degrees(90))
        }
        .cornerRadius(20)
    }
}

struct EllipsisButton_Previews: PreviewProvider {
    static var previews: some View {
        EllipsisButton(isPressed: .constant(false))
            .preferredColorScheme(.dark)
    }
}
