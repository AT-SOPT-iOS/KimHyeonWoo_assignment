import SwiftUI

struct FooterView: View {
    let item: FooterItem = FooterModel.dummy.first!

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                HStack(spacing: 8) {
                    Text(item.badge)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                    Text(item.message)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    Spacer()
                    Image(item.arrowImageName)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(width: 16, height: 16)
                }
                .padding(.horizontal, 12)
                .frame(height: 50)
                .background(Color(white: 0.15))
                .cornerRadius(8)
                .padding(.horizontal, 16)
            }
            
            Text("고객문의 · 이용약관 · 개인정보처리방침")
                .font(.system(size: 12))
                .foregroundColor(Color(white: 0.7))
                .padding(.horizontal, 16)
            Text("사업자정보 · 인재채용")
                .font(.system(size: 12))
                .foregroundColor(Color(white: 0.7))
                .padding(.horizontal, 16)
        }
        .padding(.bottom, 16)
        .background(Color.black)
    }
}
