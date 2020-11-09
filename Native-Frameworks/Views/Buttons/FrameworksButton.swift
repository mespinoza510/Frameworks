import SwiftUI

struct FrameworksButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 280, height: 50)
            .background(Color.red)
            .cornerRadius(10)
        
        
    }
}

struct FramworksButton_Previews: PreviewProvider {
    static var previews: some View {
        FrameworksButton(title: "Test Title")
            .preferredColorScheme(.dark)
    }
}
