//
//  Router.swift
//  week07&08
//
//  Created by linds on 2024-10-25.
//

import SwiftUI

//@main
struct Router: App {
    @StateObject var pageModel = PageModel();
    var body: some Scene {
        WindowGroup {
            // This is the starting page for the app
            ContentView()
                .environmentObject(pageModel)
        }
    }
}

class PageModel: ObservableObject {
    @Published var pageTag: PageEnum = .PageImage
}

enum PageEnum {
    case PageAddImg
    case PageImage
    case PageVideo
}
