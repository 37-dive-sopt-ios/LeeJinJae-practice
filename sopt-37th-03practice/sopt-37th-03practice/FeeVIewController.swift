import UIKit
import SnapKit

final class FeedViewController: UIViewController {
    
    // MARK: - Properties
    
   private var feeds: [FeedModel] = []
   
   private let lineSpacing: CGFloat = 10
   private let itemSpacing: CGFloat = 21
   private let cellHeight: CGFloat = 198
   private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
   
   
   // MARK: - UI Components
   
   private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .vertical // 디폴트가 vertical 입니다~
       layout.minimumLineSpacing = lineSpacing
       layout.minimumInteritemSpacing = itemSpacing
       layout.sectionInset = collectViewInset
       
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       collectionView.backgroundColor = .white
       return collectionView
   }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setDelegate()
        register()
        loadMockData()
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .white
        title = "피드"
    }
    
    private func setLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func loadMockData() {
         feeds = FeedModel.mockData
         collectionView.reloadData()
     }
}

// 1. 위 코드 처럼 똑같이 FeedViewController 에서 UICollectionView() 객체 초기화 후


// 2. UICollectionViewDelegateFlowLayout 메서드 구현하기
extension FeedViewController: UICollectionViewDelegateFlowLayout {
        // item 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalInset: CGFloat = 20
        let width = (collectionView.frame.width - (itemSpacing + horizontalInset * 2)) / 2
        let height: CGFloat = cellHeight
        return CGSize(width: width, height: height)
    }
    
    // 행간
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    // item 간
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
    // collectionView inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return collectViewInset
    }
}

extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        feeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as? FeedCollectionViewCell else { return UICollectionViewCell()}
        cell.configure(feed: feeds[indexPath.item])
        cell.delegate = self
        return cell
    }
    
    
}

extension FeedViewController: FeedCollectionViewCellDelegate {
    func didTapScrapButton(_ cell: FeedCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
            
            feeds[indexPath.item].isScrap.toggle() // feed의 값을 변경 시키고
            cell.scrapButton.isSelected.toggle() // cell에 접근해서 해당 scrap
    }
    
    
}
