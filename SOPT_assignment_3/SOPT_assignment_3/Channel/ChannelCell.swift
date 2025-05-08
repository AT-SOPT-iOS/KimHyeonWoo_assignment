// ChannelCell.swift

import UIKit
import SnapKit
import Then

final class ChannelCell: UICollectionViewCell {
    static let identifier = "ChannelCell"

    private let backgroundCard = UIView().then {
        $0.backgroundColor = UIColor(white: 0.1, alpha: 1.0)  // 거의 검정에 가까운 진한 회색
        $0.layer.cornerRadius = 12
        $0.clipsToBounds      = true
    }

    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(backgroundCard)
        backgroundCard.addSubview(imageView)

        // 모서리 4pt 여백, 배경 카드 꽉 채우기
        backgroundCard.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(4)
        }
        // 로고는 카드 안에서 70% 크기로 중앙 정렬
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(backgroundCard.snp.height).multipliedBy(0.4)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// ChannelModel의 item.logoName 에 해당하는 이미지 로드
    func configure(with item: ChannelItem) {
        imageView.image = UIImage(named: item.logoName)
    }
}
