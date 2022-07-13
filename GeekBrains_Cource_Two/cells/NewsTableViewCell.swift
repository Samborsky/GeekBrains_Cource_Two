//
//  NewsTableViewCell.swift
//  GeekBrains_Cource_Two
//
//  Created by Samborsky on 03.07.2022.
//

import UIKit
import AVFoundation

class NewsTableViewCell: UITableViewCell {

    var activityController: UIActivityViewController? = nil


//MARK: - аутлеты

//плеер
    @IBOutlet weak var songVolumeSlider: UISlider!
    @IBOutlet weak var songDurationSlider: UISlider!
    @IBOutlet weak var songTimeFrame: UILabel!
    @IBOutlet weak var newsTextLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!

    @IBOutlet weak var shareButton: UIButton!



    //остальное
    @IBOutlet weak var photo: UIImageView!

    @IBOutlet weak var likesLabel: UILabel!

    @IBOutlet weak var likeButton: UIButton!

    @IBOutlet weak var viewsLabel: UILabel!

    @IBOutlet weak var volumeLabel: UILabel!


//MARK: - константы и переменные
    var isLike = true
    var likesCount = 0
    var viewsCount = 0
    var player = AVAudioPlayer()


    //плеер
    func playerCatch() {
        do {
            if let audioPath = Bundle.main.path(forResource: "griby-taet led", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.songDurationSlider.maximumValue = Float(player.duration)
                self.songTimeFrame.text = "Грибы - Тает лед"
                player.volume = 50
//                songVolumeSlider.value = 50
            }
        } catch {
            print("error")
        }

    }

    //плеер




    //MARK: - методы

//меняем внешний вид кнопки
    func likeButtonAppearence() {
        likeButton.layer.shadowColor = UIColor.black.cgColor
        likeButton.layer.shadowRadius = 5
        likeButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        likeButton.layer.shadowOpacity = 0.8
    }

    //переиспользуем ячейки
    override func prepareForReuse() {
        super.prepareForReuse()
        newsTextLabel.text = nil
        photo.image = nil
        //увеличиваем просмотры новостей при скролинге(ячейки пересоздаются и происходит подсчет)
        viewsCount += 1
        viewsLabel.text = String(viewsCount)
        volumeLabel.text = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    //MARK: - экшены

///меняем громкость песни
    @IBAction func changeSongVolume(_ sender: UISlider) {
        self.player.volume = songVolumeSlider.value
        self.songVolumeSlider.minimumValue = 0
        self.songVolumeSlider.maximumValue = 100
        self.volumeLabel.text = String(Int(self.songVolumeSlider.value))
    }
    ///перематываем песню
    @IBAction func changeSongDuration(_ sender: UISlider) {
        self.player.currentTime = TimeInterval(songDurationSlider.value)

    }
    //играть/пауза песни
    @IBAction func musicButton(_ sender: UIButton) {
        if player.isPlaying {
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            player.pause()
        } else {
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            player.play()
        }

    }



    @IBAction func setLike(_ sender: UIButton) {
        if isLike {
            likeButton.tintColor = .red
            likeButtonAppearence()
            likesCount += 1
            
//анимация нажатия на лайк
            UIView.transition(with: likeButton, duration: 0.5, options: .transitionCrossDissolve) {
                self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }


        } else {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = .lightGray

            likesCount -= 1
        }
        isLike.toggle()
        likesLabel.text = String(likesCount)

    }


    @IBAction func writeComment(_ sender: UIButton) {
    }

    @IBAction func sharePost(_ sender: UIButton) {
      
    }



    
}
