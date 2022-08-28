//
//  BigPhotoCollectionViewCell.swift
//  GeekBrains_Cource_Two
//
//  Created by Admin on 23.08.2022.
//

import UIKit
import SDWebImage

class BigPhotoCollectionViewCell: UICollectionViewCell {
    
    let test = BigPhotoViewController()
    let test2 = GalleryViewController()
    

    @IBOutlet weak var photo: UIImageView!
    
   static let reuseId = "BigPhotoCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.photo.image = nil
    }
    //MARK: - закрытие фото(вернуться на прошлый вью) по свайпу вниз

    func swipeDownGesture() {
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(downSwipeSelector(gesture:)))
        self.photo.isUserInteractionEnabled = true
        self.photo.addGestureRecognizer(downSwipe)
        downSwipe.direction = .down
    }
    
    @objc func downSwipeSelector(gesture: UISwipeGestureRecognizer) {
        
        if gesture.direction == .down {
            print("pppp")
            
        }
    }
    
    //MARK: - добавляем левый свайп фото
    func leftSwipeGesture() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeSelector(gesture:)))
        self.photo.isUserInteractionEnabled = true
        self.photo.addGestureRecognizer(leftSwipe)
        leftSwipe.direction = .left
    }

    @objc func leftSwipeSelector(gesture: UISwipeGestureRecognizer) {
        let view = gesture.view
//        gesture.direction = .left
        gesture.isEnabled = true
        gesture.numberOfTouchesRequired = 1
        print("hii")
        test.selectedPhotoIndex += 1
        print(test.selectedPhotoIndex)
        
        
    }
    
    //MARK: - добавляем жест с увеличением фото
    func pinchGesture() {
        let pinchGest = UIPinchGestureRecognizer(target: self, action: #selector(pinchSelector(gesture:)))
        
        self.photo.isUserInteractionEnabled = true
        self.photo.addGestureRecognizer(pinchGest)
        
    }
    @objc func pinchSelector(gesture: UIPinchGestureRecognizer) {
    
        if let view = gesture.view {
            
            view.transform = view.transform.scaledBy(x: gesture.scale, y: gesture.scale)
            gesture.scale = 1
            panGesture()
            //если жест закончен, вернуть все как было
            if gesture.state == .ended {
                view.transform = CGAffineTransform.identity
            }

        }
    }
    //MARK: - добавляем жест с перемещением фото

    func panGesture() {
        let panGest = UIPanGestureRecognizer(target: self, action: #selector(panSelector(gesture:)))
        self.photo.isUserInteractionEnabled = true
        panGest.minimumNumberOfTouches = 2
        self.photo.addGestureRecognizer(panGest)
    }
    @objc func panSelector(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.photo)
        guard let view = gesture.view else {return}
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        
//        gesture.minimumNumberOfTouches = 2
        if gesture.state == .ended {
            view.transform = CGAffineTransform.identity
        }
        gesture.setTranslation(CGPoint.zero, in: self.photo)
    }
    
    //MARK: - метод для настройки ячейки
    func configCell(image: String?) {
        if image != nil {
        self.photo.sd_setImage(with: URL(string: image!))
        }
    }
//    @IBAction func pinchGesture(_ sender: UIPinchGestureRecognizer) {
//        if let view = sender.view {
//            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
//            sender.scale = 1
//        }
//    }
}
