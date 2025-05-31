import SwiftUI

struct ChannelView: View {
    let items: [ChannelItem] = ChannelModel.dummy

    var body: some View {
        VStack(alignment: .leading) {
            Text("채널")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(items) { item in
                        ChannelCellView(item: item)
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(height: 160)
        }
    }
}

struct ChannelCellView: View {
    let item: ChannelItem

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(white: 0.1))
                .frame(width: 120, height: 160)
            
            Image(item.logoName)
                .resizable()
                .scaledToFit()
                .frame(width: 120 * 0.4, height: 160 * 0.4)
        }
        .padding(4)
    }
}
