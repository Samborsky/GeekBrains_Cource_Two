//
//  GalleryViewController+Delegate.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 30.06.2022.
//

import UIKit
extension GalleryViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("нажатие на картинку №\(indexPath.item)")
       
            performSegue(withIdentifier: "toFullSizePhoto", sender: nil)
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //устанавливаем ширину картинок
        let collectionViewWidth = collectionView.bounds.width
        //отспуп между картинками
        let spaceBetweenCells = CGFloat(6)
        return CGSize(width: collectionViewWidth * 0.5 - spaceBetweenCells, height: collectionViewWidth * 0.5 - spaceBetweenCells)
    }
}
