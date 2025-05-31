import SwiftUI

struct MenuView: View {
    let items: [MenuItem] = MenuModel.dummy
    @State private var selectedIndex: Int = 0

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                    MenuItemView(item: item, isSelected: index == selectedIndex)
                        .onTapGesture {
                            selectedIndex = index
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 30 + 4 + 2)
    }
}

struct MenuItemView: View {
    let item: MenuItem
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 4) {
            Text(item.title)
                .font(.custom("Pretendard-Medium", size: 16))
                .foregroundColor(isSelected ? .white : Color(white: 1.0, opacity: 0.6))
                .frame(width: 60, height: 24, alignment: .center)
            
            Rectangle()
                .fill(Color.white)
                .frame(width: isSelected ? 60 : 0, height: 2)
                .opacity(isSelected ? 1 : 0)
        }
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}
