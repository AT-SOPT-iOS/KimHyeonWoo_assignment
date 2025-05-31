import SwiftUI

struct LiveView: View {
    let items: [LiveItem] = LiveModel.dummy

    var body: some View {
        VStack(alignment: .leading) {
            Text("실시간 인기 LIVE")
                .font(.custom("Pretendard-Bold", size: 18))
                .foregroundColor(.white)
                .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                        LiveCellView(item: item, rank: index + 1)
                    }
                }
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
            .frame(height: 180 + 0)
        }
    }
}

struct LiveCellView: View {
    let item: LiveItem
    let rank: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(item.thumbName)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 100)
                .clipped()
                .cornerRadius(4)

            HStack(alignment: .center, spacing: 8) {
                Text("\(rank)")
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundColor(.white)
                Text(item.title)
                    .font(.custom("Pretendard-SemiBold", size: 16))
                    .foregroundColor(.white)
                    .lineLimit(1)
            }

            Text(item.episode)
                .font(.system(size: 12))
                .foregroundColor(.gray)

            Text(item.percent)
                .font(.system(size: 12))
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 180, alignment: .topLeading)
    }
}
