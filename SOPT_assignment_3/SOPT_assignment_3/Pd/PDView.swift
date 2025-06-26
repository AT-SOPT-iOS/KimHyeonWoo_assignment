import SwiftUI

struct PDView: View {
    let items: [PDItem] = PDModel.dummy

    var body: some View {
        VStack(alignment: .leading) {
            Text("김가현PD의 인생작 TOP 5")
                .font(.custom("Pretendard-Bold", size: 18))
                .foregroundColor(.white)
                .padding(.leading, 16)
                .padding(.top, 0)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(items) { item in
                        PDCellView(item: item)
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(height: 180)
        }
        .background(Color.clear)
    }
}

struct PDCellView: View {
    let item: PDItem

    var body: some View {
        Image(item.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 180)
            .clipped()
            .cornerRadius(4)
    }
}
