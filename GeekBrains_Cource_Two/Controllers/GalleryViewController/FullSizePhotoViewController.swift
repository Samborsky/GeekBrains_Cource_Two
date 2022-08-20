//
//  FullSizePhotoViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 29.06.2022.
//

import UIKit
import SDWebImage

class FullSizePhotoViewController: UIViewController {

    let galleryViewController = GalleryViewController()
    
    @IBOutlet var fullSizePhoto: UIImageView!
//    {
//        didSet {
//            fullSizePhoto.isUserInteractionEnabled = true
//        }
//    }

    enum AnimationDirection {
        case left
        case right
    }

    let additionalImageView = UIImageView()


//массив фотографий
    var fullSizePhotosArray = [String]()

    //индекс выбранной фотки из массива
    var selectedPhotoIndex: Int = 0
    var propertyAminator: UIViewPropertyAnimator!
    var animationDirection: AnimationDirection = .left

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        fullSizePhotosArray = galleryViewController.realPhotosArray
        fullSizePhoto.sd_setImage(with: URL(string: fullSizePhotosArray[selectedPhotoIndex]))
//отображаем картинку из массива по индексу нажатия
//        fullSizePhoto.image = fullSizePhotosArray[selectedPhotoIndex]
//
//        //проверка, чтобы массив с фото не был пустым
//        guard !fullSizePhotosArray.isEmpty else {return}
//
//        leftSwipe()
//        downSwipe()
//        addFillAdditionalImageView()
//
//        let panGR = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))
//        view.addGestureRecognizer(panGR)

    }
//
//    @objc func viewPanned(_ panGesuture: UIPanGestureRecognizer) {
//        switch panGesuture.state {
//        case .began:
//            if panGesuture.translation(in: view).x > 0 {
//
//                guard selectedPhotoIndex >= 1 else {return}
//
//                animationDirection = .right
//                //направо
//                propertyAminator = UIViewPropertyAnimator(duration: 0.7, curve: .easeInOut, animations: {
//                    self.additionalImageView.transform = CGAffineTransform(translationX: 1.05 * self.additionalImageView.bounds.width, y: 0)
//                    self.fullSizePhoto.transform = CGAffineTransform(translationX: 1.05 * self.fullSizePhoto.bounds.width, y: 0)
//                    self.additionalImageView.transform = .identity
//                })
//                propertyAminator.addCompletion { position in
//                    switch position {
//                    case .end:
//                        self.selectedPhotoIndex -= 1
//                        self.fullSizePhoto.image = self.fullSizePhotosArray[self.selectedPhotoIndex]
//                        self.fullSizePhoto.transform = .identity
//                        self.additionalImageView.image = nil
//                    case .start:
//                        self.additionalImageView.transform = CGAffineTransform(translationX: 1.05 * self.additionalImageView.bounds.width, y: 0)
//                    case .current:
//                        break
//                    }
//                }
//            } else {
//                //налево
//            }
//        case .changed:
//            switch animationDirection {
//            case .left:
//                let percent = min(max(0, -panGesuture.translation(in: view).x / 200), 1)
//                propertyAminator.fractionComplete = percent
//
//            case .right:
//                let percent = min(max(0, panGesuture.translation(in: view).x / 200), 1)
//                propertyAminator.fractionComplete = percent
//            }
//        case .ended:
//            if propertyAminator.fractionComplete > 0.33 {
//                propertyAminator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
//            } else {
//                propertyAminator.isReversed = true
//                propertyAminator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
//            }
//        default: break
//        }
//
//
////    }
//
//
//    func addFillAdditionalImageView() {
//        //добавляем картинку на вью
//        view.addSubview(additionalImageView)
//        //размещаем additionalImageView под нашей основной картинкой
//        view.sendSubviewToBack(additionalImageView)
//
//        //устанавливаем констреинты равные fullSizePhoto
//        additionalImageView.translatesAutoresizingMaskIntoConstraints = false
//
//        additionalImageView.contentMode = .scaleAspectFit
//
//        NSLayoutConstraint.activate([
//            additionalImageView.leadingAnchor.constraint(equalTo: fullSizePhoto.leadingAnchor),
//            additionalImageView.trailingAnchor.constraint(equalTo: fullSizePhoto.trailingAnchor),
//            additionalImageView.topAnchor.constraint(equalTo: fullSizePhoto.topAnchor),
//            additionalImageView.bottomAnchor.constraint(equalTo: fullSizePhoto.bottomAnchor)
//
//        ])
//
//    }
//
//    //левый свайп
//    func leftSwipe() {
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeSelector(swipe:)))
//        leftSwipe.direction = .left
//        fullSizePhoto.addGestureRecognizer(leftSwipe)
//    }
//
//
//    //левый свайп
//
//    @objc func leftSwipeSelector(swipe: UISwipeGestureRecognizer) {
//        guard selectedPhotoIndex < fullSizePhotosArray.count - 1 else {return}
//
//        additionalImageView.transform = CGAffineTransform(translationX:  1.05 * additionalImageView.bounds.width, y: 0)
//        additionalImageView.image = fullSizePhotosArray[selectedPhotoIndex + 1]
//
//        print(#function)
//
//        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
//            self.fullSizePhoto.transform = CGAffineTransform(translationX: -1.05 * self.fullSizePhoto.bounds.width, y: 0)
//
//            self.additionalImageView.transform = .identity
//        }
//    completion: { _ in
//
//            self.selectedPhotoIndex += 1
//
//            self.fullSizePhoto.image = self.fullSizePhotosArray[self.selectedPhotoIndex]
//            self.fullSizePhoto.transform = .identity
//
//            self.additionalImageView.image = nil
//        }
//
//
//
//    }
//
////свайп вниз
//    func downSwipe() {
//        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(downSwipeSelector(downSwipe:)))
//        downSwipe.direction = .down
//        fullSizePhoto.addGestureRecognizer(downSwipe)
//    }
//    //свайп вниз
//
//    @objc func downSwipeSelector(downSwipe: UISwipeGestureRecognizer) {
//        print(#function)
//        self.navigationController?.popViewController(animated: true)
//    }
//
////правый свайп
//    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
//        guard selectedPhotoIndex >= 1 else {return}
//
//        additionalImageView.transform = CGAffineTransform(translationX:  -1.05 * additionalImageView.bounds.width, y: 0).concatenating(CGAffineTransform(scaleX: 1, y: 1))
//        additionalImageView.image = fullSizePhotosArray[selectedPhotoIndex - 1]
//
//
//        print(#function)
//
//        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
//            self.fullSizePhoto.transform = CGAffineTransform(translationX: 1.05 * self.fullSizePhoto.bounds.width, y: 0)
//
//            self.additionalImageView.transform = .identity
//        } completion: { _ in
//
//            self.selectedPhotoIndex -= 1
//            self.fullSizePhoto.image = self.fullSizePhotosArray[self.selectedPhotoIndex]
//            self.fullSizePhoto.transform = .identity
//
//            self.additionalImageView.image = nil
//
//        }
//
//}
//}
}
