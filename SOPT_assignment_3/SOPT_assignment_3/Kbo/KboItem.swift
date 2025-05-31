import Foundation

struct KboItem: Identifiable {
    let id = UUID()
    let logoName: String
}

struct KboModel {
    static let dummy: [KboItem] = [
        KboItem(logoName: "kbo1"),
        KboItem(logoName: "kbo2"),
        KboItem(logoName: "kbo3"),
        KboItem(logoName: "kbo4"),
        KboItem(logoName: "kbo5"),
        KboItem(logoName: "kbo6"),
        KboItem(logoName: "kbo7"),
        KboItem(logoName: "kbo8"),
        KboItem(logoName: "kbo9"),
        KboItem(logoName: "kbo10")
    ]
}
