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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        appointments = getAppointments()
        
        tableView.dataSource = self
        title = "Appointments"
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: "AppointmentCell", bundle: nil), forCellReuseIdentifier:"ReusableCell")
        self.tableView.reloadData()
    }
    
    func getAppointments() -> [Appointments]{
        return [
            Appointments(id: 1, description: "ap1 sadfasdf asdf sad fasd fsadf sadf", patient: Users(id: 1, name: "P1"), doctor: Users(id: 3, name: "Doctor 3"), hospital: Hospitals(id: 1, name: "H1"), date: Date.now),
            Appointments(id: 2, description: "ap1 sadfasdf asdf sad fasd fsadf sadf", patient: Users(id: 1, name: "P1"), doctor: Users(id: 2, name: "Doctor 2"), hospital: Hospitals(id: 1, name: "H1"), date: Date.now)
        ]
    }

}


extension DashboardViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let appointment = self.appointments[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! AppointmentCell
        
        cell.aptDescription.text = appointment.description
        let df = DateFormatter()
        df.dateFormat = "MMM d, yyyy"
        cell.dateOfApt.text = df.string(from: appointment.date)
        cell.hospital.text = appointment.hospital.name
        cell.doctor.text = appointment.doctor.name
        
//        cell.shadowAndBorderForCell(yourTableViewCell: cell)
        
        return cell
    }
}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true

    }
}
