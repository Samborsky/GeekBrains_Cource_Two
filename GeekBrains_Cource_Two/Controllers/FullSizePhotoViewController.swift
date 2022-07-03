//
//  FullSizePhotoViewController.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 29.06.2022.
//

import UIKit

class FullSizePhotoViewController: UIViewController {

    @IBOutlet var fullSizePhoto: UIImageView!

    @IBOutlet var label: UILabel!
    var labelNew = ""

    var photo: UIImage?

    let indexPath = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelNew
        fullSizePhoto.image = photo
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
