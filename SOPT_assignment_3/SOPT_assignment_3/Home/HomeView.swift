import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    HStack {
                        Image("tving_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 60)
                            .padding(.leading, 16)
                        
                        Spacer()
                        
                        Button(action: {
                        }) {
                            Image("search")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .frame(width: 28, height: 28)
                        }
                        
                        Button(action: {
                        }) {
                            Image("tving_profile")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .frame(width: 28, height: 28)
                        }
                        .padding(.trailing, 16)
                    }
                    .frame(height: 60)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                    
                    MenuView()
                        .frame(height: 30 + 4 + 2)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 16) {
                            // 3-1) 메인 이미지 (전체 화면 높이의 0.5)
                            GeometryReader { geo in
                                Image("tving_main")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geo.size.width,
                                           height: geo.size.height * 0.5)
                                    .clipped()
                            }
                            .frame(height: UIScreen.main.bounds.height * 0.5)
                            
                            Top20View()
                            LiveView()
                            MovieView()
                            KboView()
                            ChannelView()
                            PDView()
                            FooterView()
                        }
                        .padding(.bottom, 16)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}
