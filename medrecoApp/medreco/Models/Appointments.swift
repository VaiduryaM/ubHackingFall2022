//
//  Appointments.swift
//  medreco
//
//  Created by Swaminathan Venkataraman on 11/5/22.
//

import Foundation

struct Appointments {
    let id: Int
    let description: String
    let patient: Users
    let doctor: Users
    let hospital: Hospitals
    let date: Date
}
