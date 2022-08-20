//
//  GalleryViewController+DataSource.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 30.06.2022.
//

import UIKit
extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realPhotosArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCustom, for: indexPath) as? GalleryCollectionCell else { return UICollectionViewCell()}
        
        cell.configure(sdImage: realPhotosArray[indexPath.item])
    
        return cell
    }

}
