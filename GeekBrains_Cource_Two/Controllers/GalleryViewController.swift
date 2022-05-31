//
//  GalleryViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 31.05.2022.
//

import UIKit




class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let reuseIdentifierCustom = "reuseIdentifierCustom"

    var photos = [UIImage(named: "friend1")!, UIImage(named: "friend2")!]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GalleryCollectionCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifierCustom)
    }


}

extension GalleryViewController: UICollectionViewDelegate {


}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCustom, for: indexPath) as? GalleryCollectionCell else { return UICollectionViewCell()}

        cell.configure(image: photos[indexPath.item])

        return cell
    }

}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let whiteSpace = CGFloat(5)
        let lineCountCell = CGFloat(2)
        let cellWidth = collectionViewWidth / lineCountCell - whiteSpace
        return CGSize(width: cellWidth, height: cellWidth)
    }


}
