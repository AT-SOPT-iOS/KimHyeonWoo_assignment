import Foundation

struct MenuItem: Identifiable {
    let id = UUID()
    let title: String
}

struct MenuModel {
    static let dummy: [MenuItem] = [
        "홈","드라마","예능","영화","스포츠","뉴스"
    ].map { MenuItem(title: $0) }
}
