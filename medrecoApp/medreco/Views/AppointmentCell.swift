//
//  AppointmentCell.swift
//  medreco
//
//  Created by Swaminathan Venkataraman on 11/5/22.
//

import Foundation
import UIKit

class AppointmentCell: UITableViewCell {
    
    @IBOutlet weak var aptDescription: UILabel!
    @IBOutlet weak var dateOfApt: UILabel!
    @IBOutlet weak var doctor: UILabel!
    @IBOutlet weak var hospital: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UITableViewCell{
    func shadowAndBorderForCell(yourTableViewCell : UITableViewCell){
        // SHADOW AND BORDER FOR CELL
        //yourTableViewCell.contentView.layer.cornerRadius = 5
        yourTableViewCell.contentView.layer.borderWidth = 0.5
        yourTableViewCell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        yourTableViewCell.contentView.layer.masksToBounds = true
        yourTableViewCell.layer.shadowColor = UIColor.gray.cgColor
        yourTableViewCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        yourTableViewCell.layer.shadowRadius = 2.0
        yourTableViewCell.layer.shadowOpacity = 1.0
        yourTableViewCell.layer.masksToBounds = false
        yourTableViewCell.layer.shadowPath = UIBezierPath(roundedRect:yourTableViewCell.bounds, cornerRadius:yourTableViewCell.contentView.layer.cornerRadius).cgPath
    }
}
