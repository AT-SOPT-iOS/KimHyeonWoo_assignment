import Foundation

struct FooterItem {
    let badge: String
    let message: String
    let arrowImageName: String
}

struct FooterModel {
    static let dummy : [FooterItem] = [
        .init(
            badge: "공지",
            message: "티빙 계정 공유 정책 추가 안내",
            arrowImageName: "nextbutton"
        )
    ]
}
