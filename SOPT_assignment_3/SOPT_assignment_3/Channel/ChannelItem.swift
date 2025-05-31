import Foundation

struct ChannelItem: Identifiable {
    let id = UUID()
    let logoName: String
}

struct ChannelModel {
    static let dummy: [ChannelItem] = [
        ChannelItem(logoName: "channel1"),
        ChannelItem(logoName: "channel2"),
        ChannelItem(logoName: "channel3"),
        ChannelItem(logoName: "channel4")
    ]
}
