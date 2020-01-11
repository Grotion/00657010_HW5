//
//  UpdatesDataType.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/6.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import Foundation

struct DetailsDataType: Codable
{
    var number: Int
    var info: String
}

struct UpdatesDataType: Codable
{
    var date: String
    var detail: [DetailsDataType]
}
