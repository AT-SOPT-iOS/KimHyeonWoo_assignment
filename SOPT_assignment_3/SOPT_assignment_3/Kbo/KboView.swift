import SwiftUI

struct KboView: View {
    let items: [KboItem] = KboModel.dummy

    var body: some View {
        VStack(alignment: .leading) {
            Text("KBO 팀 로고")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                        KboCellView(item: item, index: index)
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(height: 120)
        }
    }
}

struct KboCellView: View {
    let item: KboItem
    let index: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(index % 2 == 0 ? Color.white : Color.black)
                .frame(width: 140, height: 120)
            
            Image(item.logoName)
                .resizable()
                .scaledToFit()
                .frame(height: 120 * 0.7)
        }
        .padding(4)
    }
}
