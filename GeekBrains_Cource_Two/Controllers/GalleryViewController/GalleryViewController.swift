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
    
    var bigPhotosArray = [String]()

    
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
                                if photo.type == "m" {
                                    self.realPhotosArray.append(photo.url)
                                }
                                if photo.type == "x" {
                                    self.bigPhotosArray.append(photo.url)
                                }
                            }
                        }

                        self.collectionView.reloadData()
                    }
 
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ToBigPhotoViewController",
              
              //indexPathsForSelectedItems?.first позволяет вызвать первый элемент массива. Так он будет работать, как обычный IndexPath
              let selectedPhoto = collectionView.indexPathsForSelectedItems?.first,
        let destinationVC = segue.destination as? BigPhotoViewController else { return }

        destinationVC.selectedPhotoIndex = selectedPhoto.item
        destinationVC.photosArray = bigPhotosArray
        
        
        

        print("\(selectedPhoto.row) hahah")

    }
}


