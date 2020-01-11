//
//  ProfileInfo.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/28.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation
import SwiftUI

struct ProfileInfo: Identifiable, Codable
{
    var id = UUID()
    var isLogIn : Bool
    var name: String
    var selectedGender: Int
    var age: Int
    var selectedFavorite: Int
    init()
    {
        id = UUID()
        isLogIn = false
        name = ""
        selectedGender = 0
        age = 20
        selectedFavorite = 3
    }
}
