//
//  ViewController.swift
//  iglistkityogi
//
//  Created by mingyu beom on 2020/11/30.
//

import UIKit
import IGListKit

class ViewController: UIViewController {
    @IBOutlet weak var igCollectionView: UICollectionView!
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    var loading = false
    let spinToken = "spinner"
    
    let dummyData = DummyData()
    
    var inputData = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.collectionView = igCollectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
        
        addPosts()
    }


}

extension ViewController: ListAdapterDataSource, UIScrollViewDelegate {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects = self.dummyData.posts as [ListDiffable]
        
        if loading {
            objects.append(spinToken as ListDiffable)
        }
        
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let obj = object as? String, obj == spinToken {
            return spinnerSectionController() //loading.
        }
        
        
        if let obj = object as? Post, obj.photos.first == ""{
            let noImagesSectionController = NoImagesSectionController()
            return noImagesSectionController
        }else{
            let withImagesSectionController = WithImagesSectionController()
            return withImagesSectionController
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    // MARK: UIScrollViewDelegate
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
       
        if !loading && distance < 200 {
                loading = true
                adapter.performUpdates(animated: true, completion: nil) //로딩시작.
                addPosts()
        }
    }
    
}

extension ViewController {
    func addPosts(){
        DispatchQueue.global(qos: .default).async {
            // fake background loading task
            sleep(2)
            DispatchQueue.main.async {
                self.loading = false
                
                if self.inputData == 0 {
                    self.dummyData.posts.append(contentsOf: self.dummyData.data)
                    print("append!!")
                }else if self.inputData == 1{
                    self.dummyData.posts.append(contentsOf: self.dummyData.data1)
                }else{
                    
                }
                
                self.inputData += 1
                self.adapter.performUpdates(animated: true, completion: nil)
            }
        }
    }
}
