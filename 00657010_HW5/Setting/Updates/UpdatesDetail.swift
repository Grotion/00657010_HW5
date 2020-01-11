//
//  UpdatesDetail.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/6.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI

struct UpdatesDetail: View
{
    @Environment(\.presentationMode) var presentationMode
    var update: UpdatesDataType
    @State private var date = ""
    init(update: UpdatesDataType)
    {
        UITableView.appearance().backgroundColor = .clear
        let newDate = update.date.replacingOccurrences(of: "-", with: "/")
        self.update = update
        self.date = newDate
    }
    var body: some View
    {
        GeometryReader
        {
            geometry in
            Form
            {
                Section(header: Text("Date").foregroundColor(.black).fontWeight(.bold))
                {
                    HStack
                    {
                        Text("\(self.update.date)")
                        Spacer()
                    }
                }
                Section(header: Text("Deatils").foregroundColor(.black).fontWeight(.bold))
                {
                    ForEach(self.update.detail.indices, id: \.self)
                    {
                        (index) in
                        HStack
                        {
                            Text("No.\(self.update.detail[index].number)")
                            Spacer()
                            Text("\(self.update.detail[index].info)")
                            .lineLimit(Int.max)
                            .multilineTextAlignment(.trailing)
                        }
                    }
                }
            }
            .navigationBarTitle("Update")
            .navigationBarItems(leading: Button(action:
            {
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)})
            .background(Image("updateBackground")
            .resizable()
            .opacity(0.3)
            .frame(width: geometry.size.width)
            .scaledToFit()
            .edgesIgnoringSafeArea(.all))
        }
    }
}

struct UpdatesDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        UpdatesDetail(update: UpdatesDataType(date: "2020-01-06", detail: [DetailsDataType(number: 1, info: "Test")]))
    }
}
