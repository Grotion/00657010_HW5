//
//  StrokeText.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/2.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI

struct StrokeText: View
{
    let text: String
    let width: CGFloat
    let color: Color
    var body: some View
    {
        ZStack
        {
            ZStack
            {
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
        .lineLimit(Int.max)
    }
}

struct StrokeText_Previews: PreviewProvider {
    static var previews: some View {
        StrokeText(text: "Test", width: 0.5, color: .red)
    }
}
