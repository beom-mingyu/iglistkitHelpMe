import Foundation
import IGListKit
import SwiftDate

protocol WithImagesSectionControllerDelegate: class {
    func didSelectItem(_ postId: Int?)
}

final class WithImagesSectionController: ListSectionController{
 
    
    private var post:Post?
    weak var delegate: WithImagesSectionControllerDelegate?
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        displayDelegate = self
        
    }
    
    override func numberOfItems() -> Int {
        return 4
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {

        var cellClass: AnyClass? = nil
        switch index {
        case 0:
            cellClass = HeaderCell.self
        case 1:
            cellClass = PhotoPagerCell.self
        case 2:
            cellClass = MiddleCell.self
        case 3:
            cellClass = TailCell.self
        default:
            cellClass = HeaderCell.self //default
        }
        
        
        let cell = collectionContext!.dequeueReusableCell(of: cellClass!, for: self, at: index)
        if let cell = cell as? HeaderCell {
            cell.dateLabel.text = post?.selectedDate.toRelative(locale: Locales.korean)
        }else if let cell = cell as? PhotoPagerCell {
            
            cell.images = post?.photos ?? []
            cell.photoPagerView.reloadData()
            
        }else if let cell = cell as? MiddleCell {
            cell.tagsLabel.text = post?.oneHashTags
            cell.emojisLabel.text = "helloEmms"
        }else if let cell = cell as? TailCell {
            cell.txtView.text = post?.memo
        }
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.post = object as? Post
    }
    override func sizeForItem(at index: Int) -> CGSize {
        
        guard let context = collectionContext, let post = post else { return .zero }
        let width = context.containerSize.width
        
        switch index {
        case 0:
            return CGSize(width: width, height: 30)
        case 1:
            return CGSize(width: width, height: width)
        case 2:
            return CGSize(width: width, height: 30)
        case 3:
            return CGSize(width: width, height: floor(width/4))
        default:
            return .zero
        }
    
    }
    
}

extension WithImagesSectionController: ListDisplayDelegate{
    func listAdapter(_ listAdapter: ListAdapter, willDisplay sectionController: ListSectionController) {
        print("Will display section \(self.section) // withImage")
    }
    
    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying sectionController: ListSectionController) {
        //print("Did end displaying section \(self.section)")
    }
    
    func listAdapter(_ listAdapter: ListAdapter, willDisplay sectionController: ListSectionController, cell: UICollectionViewCell, at index: Int) {
        //print("Did will display cell \(index) in section \(self.section)")
        //delegate?.fetchPosts(at: section)
    }
    
    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying sectionController: ListSectionController, cell: UICollectionViewCell, at index: Int) {
        // print("Did end displaying cell \(index) in section \(self.section)")
    }
    
    
}
