//
//  UpdateRecord.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/8.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import Foundation

var updates: [UpdatesDataType] =
[
    UpdatesDataType(date: "2020-01-07", detail:
        [
            DetailsDataType(number: 1, info: "Change song Picker to NavigationLink."),
            DetailsDataType(number: 2, info: "Fix stats' lists appearance, shift up when music bar are shown."),
            DetailsDataType(number: 3, info: "Fix songs favorite abilities."),
        ]),
    UpdatesDataType(date: "2020-01-08", detail:
    [
        DetailsDataType(number: 1, info: "Change profile editing age from textField to Buttons."),
        DetailsDataType(number: 2, info: "Fix stats' lists appearance, shift up when music bar are shown."),
    ]),
    UpdatesDataType(date: "2020-01-10", detail:
    [
        DetailsDataType(number: 1, info: "Added 19 new songs."),
    ])
]
