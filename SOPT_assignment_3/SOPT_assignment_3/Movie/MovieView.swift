import SwiftUI

struct MovieView: View {
    let items: [MovieItem] = MovieModel.dummy

    var body: some View {
        VStack(alignment: .leading) {
            Text("실시간 인기 영화")
                .font(.custom("Pretendard-Bold", size: 18))
                .foregroundColor(.white)
                .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(items) { item in
                        MovieCellView(item: item)
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(height: 180)
        }
    }
}

struct MovieCellView: View {
    let item: MovieItem

    var body: some View {
        Image(item.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 180)
            .clipped()
            .cornerRadius(4)
    }
}
