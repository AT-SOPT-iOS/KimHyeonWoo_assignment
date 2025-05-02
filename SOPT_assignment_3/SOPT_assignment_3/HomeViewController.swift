import UIKit
import SnapKit
import Then

final class HomeViewController: UIViewController {

    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "tving_logo")
        $0.contentMode = .scaleAspectFit
    }
    private let searchButton = UIButton().then {
        $0.setImage(UIImage(named: "search"), for: .normal)
    }
    private let profileButton = UIButton().then {
        $0.setImage(UIImage(named: "tving_profile"), for: .normal)
    }

    private let menuVC = MenuCollectionViewController()

    // MARK: — Scrollable Content
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    // MARK: — Sections
    private let mainImageView = UIImageView().then {
        $0.image = UIImage(named: "tving_main")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private let top20VC   = Top20CollectionViewController()
    private let liveVC    = LiveCollectionViewController()
    private let movieVC   = MovieCollectionViewController()
    private let kboVC     = KboCollectionViewController()
    private let channelVC = ChannelCollectionViewController()
    private let pdVC      = PdCollectionViewController()
    private let footerVC  = FooterCollectionViewController()

    // MARK: — Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        layoutTopBar()
        embedMenu()
        setupScrollArea()
        embedMainImage()
        embedTop20()
        embedLive()
        embedMovie()
        embedKbo()
        embedChannel()
        embedPD()
        embedFooter()
    }

    // MARK: — Layout Helpers

    private func layoutTopBar() {
        [logoImageView, searchButton, profileButton].forEach { view.addSubview($0) }
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(120)
            $0.height.equalTo(60)
        }
        profileButton.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(28)
        }
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView)
            $0.trailing.equalTo(profileButton.snp.leading).offset(-12)
            $0.size.equalTo(28)
        }
    }

    private func embedMenu() {
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        menuVC.view.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
    }

    private func setupScrollArea() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(menuVC.view.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
        }
    }

    private func embedMainImage() {
        contentView.addSubview(mainImageView)
        mainImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
    }

    private func embedTop20() {
        addChild(top20VC)
        contentView.addSubview(top20VC.view)
        top20VC.didMove(toParent: self)
        top20VC.view.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(30 + 180 + 16)
        }
    }

    private func embedLive() {
        addChild(liveVC)
        contentView.addSubview(liveVC.view)
        liveVC.didMove(toParent: self)
        liveVC.view.snp.makeConstraints {
            $0.top.equalTo(top20VC.view.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(30 + 200 + 8)
        }
    }

    private func embedMovie() {
        addChild(movieVC)
        contentView.addSubview(movieVC.view)
        movieVC.didMove(toParent: self)
        movieVC.view.snp.makeConstraints {
            $0.top.equalTo(liveVC.view.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(30 + 180 + 8)
        }
    }

    private func embedKbo() {
        addChild(kboVC)
        contentView.addSubview(kboVC.view)
        kboVC.didMove(toParent: self)
        kboVC.view.snp.makeConstraints {
            $0.top.equalTo(movieVC.view.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
    }

    private func embedChannel() {
        addChild(channelVC)
        contentView.addSubview(channelVC.view)
        channelVC.didMove(toParent: self)
        channelVC.view.snp.makeConstraints {
            $0.top.equalTo(kboVC.view.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
    }

    private func embedPD() {
        addChild(pdVC)
        contentView.addSubview(pdVC.view)
        pdVC.didMove(toParent: self)
        pdVC.view.snp.makeConstraints {
            $0.top.equalTo(channelVC.view.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            // PD 모듈 내부에서 bottom 제약을 잡으므로 여기에선 생략
        }
    }

    private func embedFooter() {
        addChild(footerVC)
        contentView.addSubview(footerVC.view)
        footerVC.didMove(toParent: self)
        footerVC.view.snp.makeConstraints {
            $0.top.equalTo(pdVC.view.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}
