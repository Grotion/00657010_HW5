//
//  ProfilePic.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/30.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation

struct ProfilePic: Codable
{
    var imageName: String
    var imagePath: String
    {
        return ProfilePicData.documentsDirectory.appendingPathComponent(imageName).path
    }
}

class ProfilePicData: ObservableObject
{

    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    @Published var profilePic = [ProfilePic]()
    {
        didSet
        {
            if let data = try? PropertyListEncoder().encode(profilePic)
            {
                let url = ProfilePicData.documentsDirectory.appendingPathComponent("profilePic")
                try? data.write(to: url)
            }
        }
    }
    
    init()
    {
        let url = ProfilePicData.documentsDirectory.appendingPathComponent("profilePic")
        if let data = try? Data(contentsOf: url), let array = try?  PropertyListDecoder().decode([ProfilePic].self, from: data)
        {
            profilePic = array
        }
    }
    
    
    
}
