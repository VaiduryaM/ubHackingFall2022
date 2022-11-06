//
//  DashboardViewController.swift
//  medreco
//
//  Created by Narasimha Gaonkar on 11/5/22.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var appointments = [Appointments]()
    struct Place {
        var name:String
        var address:String
        var image:UIImage
    }
    var placeList = [Place]()
    let colors = [UIColor.systemRed, UIColor.systemYellow, UIColor.systemYellow]
    
    override func viewDidLoad() {

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(red: 246, green: 247, blue: 249, alpha: 1)
        self.tableView.backgroundColor = UIColor(red: 246, green: 247, blue: 249, alpha: 1)
        self.tableView.separatorStyle = .none
        //appointments = getAppointments()
        placeList.append(Place(name: "Cardio - Blood Pressure check - 1", address: "       Nov 10, 22 | Dr.Ethan Hunt", image: UIImage(named: "Logo.jpeg")!))
        placeList.append(Place(name: "Cardio - Blood Pressure check - 2", address: "       Nov 13, 22 | Dr.Ethan Hunt", image: UIImage(named: "Logo.jpeg")!))
        placeList.append(Place(name: "Cardio - Blood Pressure check - 3", address: "       Nov 16, 22 | Dr.Ethan Hunt", image: UIImage(named: "Logo.jpeg")!))
        placeList.append(Place(name: "Diabetes - Sugar level check - 1", address: "        Nov 17, 22 | Dr.Melissa Grey", image: UIImage(named: "Logo.jpeg")!))
        placeList.append(Place(name: "Diabetes - Sugar level check - 2", address: "        Nov 18, 22 | Dr.Melissa Grey", image: UIImage(named: "Logo.jpeg")!))
        
        tableView.dataSource = self
        title = "Appointments"
        navigationItem.hidesBackButton = true
        super.viewDidLoad()
    }

}


extension DashboardViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle(for: AppointmentCell.self).loadNibNamed("AppointmentCell", owner: self, options: nil)?.first as! AppointmentCell
        
        cell.placeName.text = placeList[indexPath.row].name
        cell.address.text = placeList[indexPath.row].address
//        cell.placeImage.image = placeList[indexPath.row].image
        
//        cell.placeImage.image?.withTintColor(UIColor(red: 201, green: 226, blue: 101, alpha: 0.5))
        if indexPath.row <= 2 {
            cell.placeImage.tintColor = colors[indexPath.row]
        }
        
        
        return cell
    }
}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true

    }
}
