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
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    let reuseIdentifierCustom = "reuseIdentifierCustom"
    //этот массив можно сделать тут пустым, наполнять его будем фотками из массива friendsArray
    var photos = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "GalleryCollectionCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifierCustom)
        
        service.getFriendPhotos(token: singletone.token, userID: singletone.userID)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toFullSizePhoto",
              //indexPathsForSelectedItems?.first позволяет вызвать первый элемент массива
              let selectedPhoto = collectionView.indexPathsForSelectedItems?.first,
        let destinationVC = segue.destination as? FullSizePhotoViewController else { return }
        destinationVC.fullSizePhotosArray = photos
        destinationVC.selectedPhotoIndex = selectedPhoto.item
        print(selectedPhoto.row)

    }
}


