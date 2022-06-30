//
//  GalleryViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 31.05.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!


    let indexPath = UITableView()


    let reuseIdentifierCustom = "reuseIdentifierCustom"
//этот массив можно сделать тут пустым, наполнять его будем фотками из массива friendsArray
    var photos = [UIImage(named: "friend1")!, UIImage(named: "friend2")!, UIImage(named: "friend3")!]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self

        
        collectionView.register(UINib(nibName: "GalleryCollectionCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifierCustom)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toFullSizePhoto" else { return }
//           let sourceVC = segue.source as? FriendsViewController,
        guard let destinationVC = segue.destination as? FullSizePhotoViewController else { return }
//        let indexPath = destinationVC.indexPath.indexPathForSelectedRow!
        let a = IndexPath(row: 0, section: 0)
        


        destinationVC.photo = photos[a.row]

        }


}

extension GalleryViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("нажатие на картинку №\(indexPath.item)")
            performSegue(withIdentifier: "toFullSizePhoto", sender: nil)

    }




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
        //устанавливаем ширину картинок
        let collectionViewWidth = collectionView.bounds.width
        //отспуп между картинками
        let whiteSpace = CGFloat(5)
        let lineCountCell = CGFloat(2)
        let cellWidth = collectionViewWidth / lineCountCell - whiteSpace
        return CGSize(width: cellWidth, height: cellWidth)
    }


}
