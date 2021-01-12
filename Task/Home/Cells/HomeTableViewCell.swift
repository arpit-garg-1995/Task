//
//  HomeTableViewCell.swift
//  Task
//
//  Created by Arpit Garg on 11/01/21.
//  Copyright © 2021 OneBanc. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var cuisines = [CuisineSet]()
    weak var delegate: MoveController?
    var collectionViewLayout:UICollectionViewFlowLayout?
    private var indexOfCellBeforeDragging = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CuisineCollectionViewCell.nib, forCellWithReuseIdentifier: CuisineCollectionViewCell.identifier)
        collectionView.register(DishCollectionViewCell.nib, forCellWithReuseIdentifier: DishCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        configureCollectionViewLayoutItemSize()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    private func calculateSectionInset() -> CGFloat? {
        if let layout = collectionViewLayout{
            let deviceIsIpad = UIDevice.current.userInterfaceIdiom == .pad
            let deviceOrientationIsLandscape = UIDevice.current.orientation.isLandscape
            let cellBodyViewIsExpended = deviceIsIpad || deviceOrientationIsLandscape
            let cellBodyWidth: CGFloat = 236 + (cellBodyViewIsExpended ? 174 : 0)
            
            let inset = (layout.collectionView!.frame.width - cellBodyWidth) / 4
            return inset
        }else{
            return nil
        }
    }
       
    private func configureCollectionViewLayoutItemSize() {
        if let layout = collectionViewLayout{
            if let inset: CGFloat = calculateSectionInset(){
                layout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
                
                layout.itemSize = CGSize(width: layout.collectionView!.frame.size.width - inset * 2, height: layout.collectionView!.frame.size.height)
                layout.collectionView!.reloadData()
            }
        }
    }
}


extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cuisines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CuisineCollectionViewCell.identifier, for: indexPath as IndexPath) as? CuisineCollectionViewCell {
            cell.cuisineItem = cuisines[indexPath.row]
            return cell
        } else {
          return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: AppSizes.SCREENWIDTH*0.8, height: AppSizes.SCREENWIDTH / 2)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.moveController(dict: [:], controller: AllControllers.dishController, object: cuisines[indexPath.row].itDishes)            
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        collectionViewLayout?.targetContentOffset(forProposedContentOffset: scrollView.contentOffset)
        if let indexOfMajorCell = self.indexOfMajorCell(){
            let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
            collectionViewLayout!.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    
    private func indexOfMajorCell() -> Int? {
        if let layout = collectionViewLayout{
            let itemWidth = layout.itemSize.width
            let proportionalOffset = layout.collectionView!.contentOffset.x / itemWidth
            let index = Int(round(proportionalOffset))
            let safeIndex = max(0, min(cuisines.count - 1, index))
            return safeIndex
        }else{
            return nil
        }
    }
}
