//
//  BigPhotoViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Admin on 23.08.2022.
//

import UIKit
import SDWebImage

class BigPhotoViewController: UIViewController {
    
    @IBOutlet weak var photo: UIImageView!
    
    
    var photosArray = [String]()
    var selectedPhotoIndex = 0
    
    var collectionView2: UICollectionView!
    
    
    
//    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        collectionView.delegate = self
//        collectionView.dataSource = self
        
        
        config()
        collectionView2.register(UINib(nibName: BigPhotoCollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: BigPhotoCollectionViewCell.reuseId)
        
//        photo.sd_setImage(with: URL(string: photosArray[selectedPhotoIndex]))
        collectionView2.reloadData()
        
    }
    
    func config() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView2 = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView2.isPagingEnabled = true
        collectionView2.delegate = self
        collectionView2.dataSource = self
        self.view.addSubview(collectionView2)
        
    }

}

extension BigPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigPhotoCollectionViewCell.reuseId, for: indexPath) as? BigPhotoCollectionViewCell else {preconditionFailure("error") }
//        cell.photo.sd_setImage(with: URL(string: photosArray[indexPath.item]))
        
        cell.configCell(image: photosArray[indexPath.item])
        
        
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.safeAreaLayoutGuide.layoutFrame.size
    }
    
}
