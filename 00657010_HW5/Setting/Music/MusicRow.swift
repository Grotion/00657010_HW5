//
//  MusicRow.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2020/1/7.
//  Copyright © 2020 Shaun Ku. All rights reserved.
//

import SwiftUI

struct MusicRow: View
{
    var song: SongDetail
    var body: some View
    {
        GeometryReader
        {
            geometry in
            HStack
            {
                if(self.song.isFavorite == true)
                {
                    Image("Rate")
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFit()
                    .frame(width: geometry.size.width * 20 / 414, height:geometry.size.width * 20 / 414)
                }
                else
                {
                    Image("noRate")
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFit()
                    .frame(width: geometry.size.width * 20 / 414, height:geometry.size.width * 20 / 414)
                    .hidden()
                }
                Text("\(self.song.singer ?? "Unknow") - \(self.song.songName)")
                Spacer()
            }
        }
    }
}

struct MusicRow_Previews: PreviewProvider {
    static var previews: some View {
        MusicRow(song: SongDetail(songName: "Demons", singer: "Imagine Dragons", isFavorite: true))
    }
}
