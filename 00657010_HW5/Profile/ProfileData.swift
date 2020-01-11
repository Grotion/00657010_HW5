//
//  ProfileData.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/28.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation

class ProfileData: ObservableObject
{
    @Published var profileInfo = ProfileInfo()
    {
        didSet
        {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(profileInfo)
            {
                UserDefaults.standard.set(data, forKey:"profileInfo")
            }
        }
    }
    init()
    {
        if let data = UserDefaults.standard.data(forKey: "profileInfo")
        {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode(ProfileInfo.self, from:data)
            {
                profileInfo = decodedData
            }
        }
    }
}
