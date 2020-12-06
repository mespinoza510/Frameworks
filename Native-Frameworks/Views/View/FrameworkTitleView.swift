import SwiftUI

struct FrameworkTitleView: View {
    
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .squareFrame(side: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

struct FrameworkTitleView_Previews: PreviewProvider {
    static let framework = MockData.sampleFramework
    
    static var previews: some View {
        FrameworkTitleView(framework: framework)
            .preferredColorScheme(.dark)
    }
}
