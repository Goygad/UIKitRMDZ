// PlayListController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Плейлист
class PlayListController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? PlayerController {
            switch segue.identifier {
            case "TrackOne":
                destinationVC.trackIndex = 0
            case "TrackTwo":
                destinationVC.trackIndex = 1
            default:
                break
            }
        }
    }
}
