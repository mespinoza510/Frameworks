import SwiftUI

struct XDismissButton: View {
    
    @Binding var isShowingModal: Bool
    
    let xMarkImage = SystemImageName.xmark.rawValue
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                isShowingModal = false
            } label: {
                Image(systemName: xMarkImage)
                    .foregroundColor(Color(.label))
                    .frame(width: 45, height: 45)
                    .imageScale(.large)
            }
        }.padding()
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton(isShowingModal: .constant(true))
            .preferredColorScheme(.dark)
    }
}
