//
//  BigPhotoViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Admin on 23.08.2022.
//

import UIKit
import SDWebImage

class BigPhotoViewController: UIViewController {
 //массив с фотками
    var photosArray = [String]()
    //индекс фотографии
    var selectedPhotoIndex = 1
    
    var collectionView2: UICollectionView!
    
    @IBOutlet weak var bigPhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
        
        //ресгистрируем коллекцию
        collectionView2.register(UINib(nibName: BigPhotoCollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: BigPhotoCollectionViewCell.reuseId)
        
        collectionView2.reloadData()
        
        
    }
    ///настройка коллекции
    func config() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        collectionView2 = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView2.isPagingEnabled = true
        collectionView2.showsHorizontalScrollIndicator = false
//        collectionView2.alwaysBounceHorizontal = true
        
        
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
        
//        cell.configCell(image: photosArray[selectedPhotoIndex])
        
        cell.configCell(image: photosArray[indexPath.row])
        cell.pinchGesture()
//        cell.panGesture()
        
        cell.swipeDownGesture()
        
        
        for i in selectedPhotoIndex...photosArray.count {

            if selectedPhotoIndex < photosArray.count {
            cell.configCell(image: photosArray[selectedPhotoIndex])
               selectedPhotoIndex += 1
                return cell
            }

        }
        

        return cell
    }
    
//размер отображаемой ячейки(сделал чтобы растягивалась по сейф ареа)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.safeAreaLayoutGuide.layoutFrame.size
    }
    
}
