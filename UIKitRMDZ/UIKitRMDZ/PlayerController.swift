// PlayerController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Плеер
class PlayerController: UIViewController {
    // MARK: - Public Properties

    var trackIndex = 0

    // MARK: - Private Properties

    private var player = AVAudioPlayer()
    private var tracks = ["Кукла", "Ром"]
    private var nameTracks = ["Кукла колдуна", "Лесник"]
    private var trackImages = ["king", "jester"]

    // MARK: - IBOutlets

    @IBOutlet var durationSlider: UISlider!
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var playStopButton: UIButton!
    @IBOutlet var trackName: UILabel!
    @IBOutlet var trackImage: UIImageView!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        rotateVolumSlider()
        setPlayer()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        trackName.text = nameTracks[trackIndex]
        trackImage.image = UIImage(named: trackImages[trackIndex])
    }

    // MARK: - Private Methods

    private func rotateVolumSlider() {
        volumeSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
    }

    // tracks[trackIndex]
    private func setPlayer() {
        durationSlider.addTarget(self, action: #selector(durationChanged), for: .valueChanged)
        playStopButton.setImage(UIImage(named: "playButton"), for: .normal)
        do {
            if let audioPath = Bundle.main.path(forResource: tracks[trackIndex], ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                durationSlider.maximumValue = Float(player.duration)
            }
        } catch {
            print("error")
        }
    }

    @objc private func durationChanged(sender: UISlider) {
        if sender == durationSlider {
            player.currentTime = TimeInterval(sender.value)
        }
    }

    // MARK: - IBAction

    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func playStopMusic(_ sender: Any) {
        if playStopButton.currentImage == UIImage(named: "playButton") {
            playStopButton.setImage(UIImage(named: "stopButton"), for: .normal)
            player.play()
        } else {
            playStopButton.setImage(UIImage(named: "playButton"), for: .normal)
            player.stop()
        }
    }

    @IBAction func backTrack(_ sender: Any) {
        if trackIndex != 0 {
            trackIndex -= 1
            trackName.text = nameTracks[trackIndex]
            trackImage.image = UIImage(named: trackImages[trackIndex])
            setPlayer()
            player.play()
        } else {
            trackIndex = (tracks.count - 1)
            trackName.text = nameTracks[trackIndex]
            trackImage.image = UIImage(named: trackImages[trackIndex])
        }
    }

    @IBAction func nextTrack(_ sender: Any) {
        if trackIndex < (tracks.count - 1) {
            trackIndex += 1
            trackName.text = nameTracks[trackIndex]
            trackImage.image = UIImage(named: trackImages[trackIndex])
            setPlayer()
            player.play()
        } else {
            trackIndex = 0
            trackName.text = nameTracks[trackIndex]
            trackImage.image = UIImage(named: trackImages[trackIndex])
        }
    }
}
