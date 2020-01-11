//
//  StrokeDouble.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/4.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI

struct StrokeDouble: View
{
    let double: Double
    let width: CGFloat
    let color: Color
    var body: some View
    {
        ZStack
        {
            ZStack
            {
                Text("\(double, specifier: "%.2f")").offset(x:  width, y:  width)
                Text("\(double, specifier: "%.2f")").offset(x: -width, y: -width)
                Text("\(double, specifier: "%.2f")").offset(x: -width, y:  width)
                Text("\(double, specifier: "%.2f")").offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text("\(double, specifier: "%.2f")")
        }
        .lineLimit(Int.max)
    }
}

struct StrokeDouble_Previews: PreviewProvider {
    static var previews: some View {
        StrokeDouble(double: 100.00, width: 1.5, color: .blue)
    }
}
