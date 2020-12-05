import SwiftUI

struct BackgroundColor: View {
    var body: some View {
        // Setup display for custom color
        ZStack {
            Rectangle()
                .squareFrame(side: 300)
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
    static var lightBlack: Color {
        return Color.black.opacity(0.65)
    }
}

extension View {
    func squareFrame(side: CGFloat) -> some View {
        return self.frame(width: side, height: side)
    }
}
