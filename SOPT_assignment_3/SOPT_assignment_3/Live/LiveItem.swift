struct LiveItem {
    let title: String
    let episode: String
    let percent: String
    let thumbName: String
}

struct LiveModel {
    static let dummy: [LiveItem] = [
        LiveItem(title: "Channel A", episode: "환승연애3 4화", percent: "20.5%", thumbName: "live1"),
        LiveItem(title: "tvN", episode: "슬기로운 전공의생활 1화", percent: "18.9%", thumbName: "live3"),
        LiveItem(title: "tvN", episode: "지구오락실 6화", percent: "10.33%", thumbName: "live2"),
        LiveItem(title: "tvN", episode: "이혼보험 1화", percent: "10.12%", thumbName: "live4"),
        LiveItem(title: "tvN", episode: "선재업고튀어 1화", percent: "9.4%", thumbName: "live5"),
        LiveItem(title: "tvN", episode: "별들에게 물어봐 11화", percent: "8.1%", thumbName: "live6")
    ]
}
