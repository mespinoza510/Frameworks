import SwiftUI

struct BackgroundColor: View {
    var body: some View {
        // Setup display for custom color
        ZStack {
            Rectangle()
                .frame(width: 300, height: 300)
                .background(Color.lightBlack)
        }
    }
}

struct BackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundColor()
    }
}

extension Color {
    public static var lightBlack: Color {
        return Color.black.opacity(0.65)
    }
}
