// Top20Cell.swift

import UIKit
import SnapKit
import Then

final class Top20Cell: UICollectionViewCell {
    static let identifier = "Top20Cell"

    private let imageView = UIImageView().then {
        $0.contentMode   = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 4
    }

    private let numberLabel = UILabel().then {
        $0.textColor = .white
        $0.font      = UIFont(name: "Pretendard-Bold", size: 32)
                       ?? .boldSystemFont(ofSize: 32)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        // 숫자가 셀 바깥으로 튀어나와도 보이게
        clipsToBounds        = false
        contentView.clipsToBounds = false

        contentView.addSubview(imageView)
        contentView.addSubview(numberLabel)

        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        numberLabel.snp.makeConstraints {
            // 왼쪽으로 30pt 빼서 셀 사이 간격 중앙에 표시
            $0.leading.equalTo(imageView.snp.leading).offset(-30)
            $0.bottom.equalTo(imageView.snp.bottom).inset(8)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// 모델에서 imageName, 순번(rank)을 받아 셀을 그립니다.
    func configure(with model: Top20Item, rank: Int) {
        imageView.image  = UIImage(named: model.imageName)
        numberLabel.text = "\(rank)"
    }
}
