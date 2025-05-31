import SwiftUI

struct Top20View: View {
    let items: [Top20Item] = Top20Model.dummy

    var body: some View {
        VStack(alignment: .leading) {
            Text("오늘의 티빙 TOP 20")
                .font(.custom("Pretendard-Bold", size: 18))
                .foregroundColor(.white)
                .padding(.leading, 16)
                .padding(.top, 8)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 60) {
                    ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                        Top20CellView(item: item, rank: index + 1)
                    }
                }
                .padding(.leading, 16 + 30)
                .padding(.trailing, 16)
            }
            .frame(height: 180)
        }
        .background(Color.black)
    }
}

struct Top20CellView: View {
    let item: Top20Item
    let rank: Int

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 180)
                .clipped()
                .cornerRadius(4)

            Text("\(rank)")
                .font(.custom("Pretendard-Bold", size: 32))
                .foregroundColor(.white)
                .padding(.leading, -30)
                .padding(.bottom, 8)
        }
        .frame(width: 120, height: 180)
    }
}
