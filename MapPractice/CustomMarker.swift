//
//  CustomMarker.swift
//  MapPractice
//
//  Created by Shahnewaz on 5/3/23.
//

import UIKit
import GoogleMaps

class CustomMarker: UIView {
    var markerView: UIView?
    
    @IBOutlet weak var markerbackground: UIView!
    
    @IBOutlet weak var placeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        markerbackground.layer.cornerRadius = 10
    }
}

