//
//  ProfileHomePage.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/28.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct ProfileHomePage: View
{
    @EnvironmentObject var profileData: ProfileData
    var profilePicData: ProfilePicData
    let genderShow = ["Male", "Female", "QuestionMark"]
    let favoriteSports = ["F1Logo", "NBALogo", "NFLLogo", "noFavorite"]
    @Binding var selectImage: UIImage?
    @State private var showLogOutAlert = false
    var body: some View
    {
        GeometryReader
        {
            geometry in
            NavigationView
            {
                ZStack
                {
                    Image("profileBackground")
                    .resizable()
                    .opacity(0.3)
                    .frame(width: geometry.size.width)
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    if(self.profileData.profileInfo.isLogIn == false)
                    {
                        VStack
                        {
                            Text("Profile")
                            .font(Font.custom("Snell Roundhand", size: geometry.size.width * 80 / 414))
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                            .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: geometry.size.width * 30 / 414, trailing: geometry.size.width * 10 / 414))
                            NavigationLink(destination: ProfileEditor(profilePicData: self.profilePicData, selectImage: self.$selectImage))
                            {
                                Text("Log In")
                                .font(Font.system(size:geometry.size.width * 40 / 414))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(width:geometry.size.width * 3 / 4, height:geometry.size.width * 60 / 414)
                                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.blue))
                                .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: 0, trailing: geometry.size.width * 10 / 414))
                            }
                        }
                    }
                    else
                    {
                        VStack
                        {
                            Group
                            {
                                if self.selectImage != nil || self.profilePicData.profilePic.count != 0
                                {
                                    Image(uiImage: UIImage(contentsOfFile: self.profilePicData.profilePic[0].imagePath)!)
                                    .resizable()
                                    .renderingMode(.original)
                                }
                                else
                                {
                                    Image("defaultProfilePic")
                                    .resizable()
                                    .renderingMode(.original)
                                }
                            }
                            .scaledToFill()
                            .frame(width: geometry.size.width * 3 / 4, height:geometry.size.width * 3 / 4)
                            .clipShape(Circle())
                            .padding(.bottom, geometry.size.width * 10 / 414)
                            HStack
                            {
                                Text("\(self.profileData.profileInfo.name), \(self.profileData.profileInfo.age), ")
                                .font(Font.system(size:geometry.size.width * 30 / 414))
                                .fontWeight(.bold)
                                Image(self.genderShow[self.profileData.profileInfo.selectedGender])
                                .resizable()
                                .scaledToFill()
                                .frame(width:geometry.size.width * 30 / 414, height:geometry.size.width * 30 / 414)
                            }
                            HStack
                            {
                                Text("Favorite Sport:")
                                .font(Font.system(size:geometry.size.width * 20 / 414))
                                .fontWeight(.bold)
                                if(self.profileData.profileInfo.selectedFavorite == 0)
                                {
                                    Image(self.favoriteSports[0])
                                    .resizable()
                                    .frame(width:geometry.size.width * 150 / 414, height:geometry.size.width * 100 / 414)
                                    .scaledToFit()
                                }
                                else if(self.profileData.profileInfo.selectedFavorite == 1)
                                {
                                    Image(self.favoriteSports[1])
                                    .resizable()
                                    .frame(width:geometry.size.width * 130 / 414, height:geometry.size.width * 80 / 414)
                                    .scaledToFit()
                                }
                                else if(self.profileData.profileInfo.selectedFavorite == 2)
                                {
                                    Image(self.favoriteSports[2])
                                    .resizable()
                                    .frame(width:geometry.size.width * 90 / 414, height:geometry.size.width * 100 / 414)
                                    .scaledToFit()
                                }
                                else if(self.profileData.profileInfo.selectedFavorite == 3)
                                {
                                    Image(self.favoriteSports[3])
                                    .resizable()
                                    .frame(width:geometry.size.width * 100 / 414, height:geometry.size.width * 100 / 414)
                                    .scaledToFit()
                                }
                                
                            }
                            .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: geometry.size.width * 10 / 414, trailing: geometry.size.width * 10 / 414))
                            HStack
                            {
                                NavigationLink(destination: ProfileEditor(profilePicData: self.profilePicData, selectImage: self.$selectImage, editProfile: self.profileData.profileInfo))
                                {
                                    Text("Edit!")
                                    .font(Font.system(size:geometry.size.width * 20 / 414))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.blue)
                                    .multilineTextAlignment(.center)
                                    .frame(width:geometry.size.width / 4, height:geometry.size.width * 60 / 414)
                                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white))
                                    .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: 0, trailing: geometry.size.width * 10 / 414))
                                }
                                Button(action:
                                {
                                    self.showLogOutAlert = true
                                })
                                {
                                    Text("Log Out")
                                    .font(Font.system(size:geometry.size.width * 20 / 414))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                    .frame(width:geometry.size.width / 4, height:geometry.size.width * 60 / 414)
                                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.red))
                                    .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: 0, trailing: geometry.size.width * 10 / 414))
                                }
                                .alert(isPresented: self.$showLogOutAlert)
                                {
                                    () -> Alert in
                                    return Alert(title: Text("Really?!"), message: Text("Are you sure to log out?"), primaryButton: .default(Text("No!")), secondaryButton: .destructive(Text("Yes!"), action:{
                                        self.profileData.profileInfo.isLogIn = false
                                        self.profileData.profileInfo.name = ""
                                        self.profileData.profileInfo.selectedGender = 0
                                        self.profileData.profileInfo.age = 20
                                        self.profileData.profileInfo.selectedFavorite = 0
                                        self.profilePicData.profilePic.removeAll()
                                        self.selectImage = nil
                                        print("Log out!")
                                    }))
                                }
                            }
                        }
                        .offset(x:0,y:-geometry.size.width * 20 / 414)
                    }
                }
            }
        }
    }
}

struct ProfileHomePage_Previews: PreviewProvider
{
    static var previews: some View
    {
        ProfileHomePage(profilePicData: ProfilePicData(), selectImage: .constant(UIImage(named: "pic"))).environmentObject(ProfileData())
    }
}
