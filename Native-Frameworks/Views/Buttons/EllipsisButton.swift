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
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .imageScale(.large)
                .rotationEffect(.degrees(90))
                .foregroundColor(Color(.label))
        }
    }
}

struct EllipsisButton_Previews: PreviewProvider {
    static var previews: some View {
        EllipsisButton(isPressed: .constant(false))
    }
}
