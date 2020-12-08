import SwiftUI

struct FrameworkListTitleView: View {
    
    let framework: Framework
    
    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 60, height: 60)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .padding()
        }
    }
}

struct FrameworkListTitleView_Previews: PreviewProvider {
    static let framework = MockData.sampleFramework
    
    static var previews: some View {
        FrameworkListTitleView(framework: framework)
            .preferredColorScheme(.dark)
    }
}
