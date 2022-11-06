//
//  AppointmentCell.swift
//  medreco
//
//  Created by Swaminathan Venkataraman on 11/5/22.
//

import Foundation
import UIKit

class AppointmentCell: UITableViewCell {
    

//    @IBOutlet weak var doctor: UILabel!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    //    @IBOutlet weak var hospital: UILabel!
    @IBOutlet weak var contentViewCell: UIView!
    
    @IBOutlet weak var cardView: UIView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentViewCell.clipsToBounds = false
        contentViewCell.layer.cornerRadius = 5
        contentViewCell.backgroundColor = UIColor(red: 246, green: 247, blue: 249, alpha: 1)
        
        cardView.layer.borderWidth = 2
        //        cardView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        let color = (UIColor(red: 126, green: 217, blue: 87, alpha: 1)).cgColor
        cardView.layer.borderColor = UIColor.systemFill.cgColor
    }
    
}
