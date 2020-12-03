import SwiftUI

final class FrameworkGridViewModel: ObservableObject {

    // TODO: I think `selectedFramework` and `isShowingDetailView` can be join to one property `Freamwork` of `@Published` type and check if this value is nil ( I am not sure it will be work on 100% )
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }
    
    @Published var isShowingDetailView = false

    // TODO: You dont need specify type of your array
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
