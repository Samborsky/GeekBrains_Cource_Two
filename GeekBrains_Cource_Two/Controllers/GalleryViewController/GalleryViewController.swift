//
//  GalleryViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 31.05.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    let singletone = Singleton.shared
    let service = Service()
    
    let reuseIdentifierCustom = "reuseIdentifierCustom"
    
//массив с url фотографий
    var realPhotosArray = [String]()
    
    var likesArray = [Int]()
    
    
    @IBOutlet weak var collectionView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "GalleryCollectionCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifierCustom)
        
        service.getFriendPhotos(token: singletone.token, userID: singletone.userID) { friendsPhotos in
            
//вытаскиваем url фотографий
            for item in friendsPhotos {
                for photo in item.sizes {
                    if photo.type == "y" {
                        self.realPhotosArray.append(photo.url)
                    }
                }
            }

            self.collectionView.reloadData()
        }
 
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toFullSizePhoto",
              
              //indexPathsForSelectedItems?.first позволяет вызвать первый элемент массива. Так он будет работать, как обычный IndexPath
              let selectedPhoto = collectionView.indexPathsForSelectedItems?.first,
        let destinationVC = segue.destination as? FullSizePhotoViewController else { return }

        destinationVC.selectedPhotoIndex = selectedPhoto.item
        destinationVC.fullSizePhotosArray = realPhotosArray
//        destinationVC.fullSizePhoto.sd_setImage(with: URL(string: destinationVC.fullSizePhotosArray[selectedPhoto.item]))
        print(selectedPhoto.row)

    }
}


