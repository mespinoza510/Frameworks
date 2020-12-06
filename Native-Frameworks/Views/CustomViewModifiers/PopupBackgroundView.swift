import SwiftUI

struct PopupBackgroundView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.lightBlack)
            .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    func popupBackground() -> some View {
        self.modifier(PopupBackgroundView())
    }
}
