import Foundation

struct MovieItem: Identifiable {
    let id = UUID()
    let imageName: String
}

struct MovieModel {
    static let dummy: [MovieItem] = [
        MovieItem(imageName: "tving_signal"),
        MovieItem(imageName: "tving_harrypoter"),
        MovieItem(imageName: "movie1"),
        MovieItem(imageName: "movie2"),
        MovieItem(imageName: "movie3"),
    ]
}
