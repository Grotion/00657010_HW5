//
//  ProfileEditor.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/28.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI
import KeyboardObserving

struct ProfileEditor: View
{
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var profileData: ProfileData
    var profilePicData: ProfilePicData
    @State private var showSelectPhoto = false
    @Binding var selectImage: UIImage?
    @State private var name = ""
    @State private var selectedGender = 0
    @State private var age = 20
    @State private var selectedFavorite = 3
    let genders = ["Male", "Female", "Other"]
    let genderShow = ["Male", "Female", "QuestionMark"]
    let genderShowCM = ["MaleSymbol", "FemaleSymbol", "QuestionMark"]
    let genderColor: [Color] = [.blue, .red, .gray]
    let sports = ["F1", "NBA", "NFL", "None"]
    @State var isChecked1: Bool = false
    @State var isChecked2: Bool = false
    @State var isChecked3: Bool = false
    @State var isChecked4: Bool = true
    @State private var showSaveAlert = false
    @State private var showClearAlert = false
    @State private var tooYoungAlert = false
    var editProfile: ProfileInfo?
    var body: some View
    {
        GeometryReader
        {
            geometry in
            ZStack
            {
                Image("profileBackground")
                .resizable()
                .opacity(0.3)
                .frame(width: geometry.size.width)
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                VStack
                {
                    Group
                    {
                        if self.selectImage != nil
                        {
                            Image(uiImage: self.selectImage!)
                            .resizable()
                            .renderingMode(.original)
                        }
                        else if self.selectImage == nil && self.profilePicData.profilePic.count != 0
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
                    Button(action:
                    {
                        self.showSelectPhoto = true
                    })
                    {
                        Text("Choose Profile Picture")
                        
                    }
                    .sheet(isPresented: self.$showSelectPhoto)
                    {
                        ImagePickerController(selectImage: self.$selectImage, showSelectPhoto: self.$showSelectPhoto)
                    }
                    HStack
                    {
                       Text("Name: ")
                        TextField("Name", text: self.$name)
                        .frame(width:geometry.size.width / 2)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.pink, lineWidth: geometry.size.width * 1 / 414))
                        .multilineTextAlignment(.center)
                    }
                    HStack
                    {
                        Text("Gender:")
                        Text("\(self.genders[self.selectedGender])")
                        .foregroundColor(self.genderColor[self.selectedGender])
                        Image(self.genderShow[self.selectedGender])
                        .resizable()
                        .scaledToFill()
                        .frame(width:geometry.size.width * 1 / 414, height:geometry.size.width * 20 / 414)
                        .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: 0, trailing: geometry.size.width * 10 / 414))
                        Text("Long Press To Choose")
                        .foregroundColor(.blue)
                        .contextMenu
                        {
                            Button(action:{self.selectedGender = 0})
                            {
                                Text("Male")
                                Image(self.genderShowCM[0])
                                .resizable()
                                .scaledToFill()
                                .frame(width:10, height:10)
                            }
                            Button(action:{self.selectedGender = 1})
                            {
                                Text("Female")
                                Image(self.genderShowCM[1])
                                .resizable()
                                .scaledToFill()
                                .frame(width:10, height:10)
                            }
                            Button(action:{self.selectedGender = 2})
                            {
                                Text("Other")
                                Image(self.genderShowCM[2])
                                .resizable()
                                .scaledToFill()
                                .frame(width:10, height:10)
                            }
                        }
                    }
                    HStack
                    {
                        Text("Age: ")
                        Text("\(self.age)")
                        .frame(width:geometry.size.width / 4)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.orange, lineWidth: geometry.size.width * 1 / 414))
                        .multilineTextAlignment(.center)
                        Button(action:
                        {
                            if(self.age - 10 < 0)
                            {
                                self.tooYoungAlert = true
                            }
                            else
                            {
                                self.age = self.age - 10
                            }
                        })
                        {
                            Text("--")
                            .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: 0, trailing: geometry.size.width * 5 / 414))
                            .frame(width:geometry.size.width * 35 / 414)
                            .foregroundColor(Color.white)
                            .background(Color.orange)
                            .cornerRadius(10)
                        }
                        Button(action:
                        {
                            if(self.age - 1 < 0)
                            {
                                self.tooYoungAlert = true
                            }
                            else
                            {
                                self.age = self.age - 1
                            }
                        })
                        {
                            Text("-")
                            .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: 0, trailing: geometry.size.width * 5 / 414))
                            .frame(width:geometry.size.width * 35 / 414)
                            .foregroundColor(Color.white)
                            .background(Color.orange)
                            .cornerRadius(10)
                        }
                        .alert(isPresented: self.$tooYoungAlert)
                        {
                            () -> Alert in
                            return Alert(title: Text("Opps!!\nSomething went wrong!!"), message: Text("Couldn't be younger than 0 year old!!"))
                        }
                        Button(action:{self.age = self.age + 1})
                        {
                            Text("+")
                            .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: 0, trailing: geometry.size.width * 5 / 414))
                            .frame(width:geometry.size.width * 35 / 414)
                            .foregroundColor(Color.white)
                            .background(Color.orange)
                            .cornerRadius(10)
                        }
                        Button(action:{self.age = self.age + 10})
                        {
                            Text("++")
                            .padding(EdgeInsets(top: 0, leading: geometry.size.width * 5 / 414, bottom: 0, trailing: geometry.size.width * 5 / 414))
                            .frame(width:geometry.size.width * 35 / 414)
                            .foregroundColor(Color.white)
                            .background(Color.orange)
                            .cornerRadius(10)
                        }
                    }
                    HStack
                    {
                        Text("Favorite: ")
                        .lineLimit(Int.max)
                        Button(action:
                        {
                            self.isChecked1 = true
                            self.isChecked2 = false
                            self.isChecked3 = false
                            self.isChecked4 = false
                            self.selectedFavorite = 0
                        })
                        {
                            HStack
                            {
                                Image(systemName: self.isChecked1 ? "largecircle.fill.circle": "circle")
                                Text("F1")
                                .foregroundColor(.black)
                            }
                        }
                        Button(action:
                        {
                            self.isChecked1 = false
                            self.isChecked2 = true
                            self.isChecked3 = false
                            self.isChecked4 = false
                            self.selectedFavorite = 1
                        })
                        {
                            HStack
                            {
                                Image(systemName: self.isChecked2 ? "largecircle.fill.circle": "circle")
                                Text("NBA")
                                .foregroundColor(.black)
                            }
                        }
                        Button(action:
                        {
                            self.isChecked1 = false
                            self.isChecked2 = false
                            self.isChecked3 = true
                            self.isChecked4 = false
                            self.selectedFavorite = 2
                        })
                        {
                            HStack
                            {
                                Image(systemName: self.isChecked3 ? "largecircle.fill.circle": "circle")
                                Text("NFL")
                                .foregroundColor(.black)
                            }
                        }
                        Button(action:
                        {
                            self.isChecked1 = false
                            self.isChecked2 = false
                            self.isChecked3 = false
                            self.isChecked4 = true
                            self.selectedFavorite = 3
                        })
                        {
                            HStack
                            {
                                Image(systemName: self.isChecked4 ? "largecircle.fill.circle": "circle")
                                Text("None")
                                .foregroundColor(.black)
                            }
                        }
                    }
                    HStack
                    {
                        Button(action:
                        {
                            self.showClearAlert = true
                        })
                        {
                            Text("Clear")
                            .font(Font.custom("Snell Roundhand", size: geometry.size.width * 30 / 414))
                            .fontWeight(.bold)
                            .foregroundColor(Color.red)
                            .multilineTextAlignment(.center)
                            .frame(width:geometry.size.width / 4, height:geometry.size.width * 60 / 414)
                            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white))
                            .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: 0, trailing: geometry.size.width * 10 / 414))
                        }
                        .alert(isPresented: self.$showClearAlert)
                        {
                            () -> Alert in
                            return Alert(title: Text("Really?!"), message: Text("Are you sure to clear?"), primaryButton: .default(Text("No!")), secondaryButton: .destructive(Text("Sure!"), action:{
                                self.name = ""
                                self.selectedGender = 0
                                self.age = 20
                                self.isChecked1 = false
                                self.isChecked2 = false
                                self.isChecked3 = false
                                self.isChecked4 = true
                                self.selectedFavorite = 3
                                self.selectImage = nil
                                self.profilePicData.profilePic.removeAll()
                            }))
                        }
                        
                        Button(action:
                        {
                            if(self.name == "" || self.age < 0)
                            {
                                self.showSaveAlert = true
                            }
                            else
                            {
                                print("Save!")
                                self.profileData.profileInfo.isLogIn = true
                                self.profileData.profileInfo.name = self.name
                                self.profileData.profileInfo.selectedGender = self.selectedGender
                                self.profileData.profileInfo.age = self.age
                                self.profileData.profileInfo.selectedFavorite = self.selectedFavorite
                                if self.selectImage != nil
                                {
                                    let imageName = UUID().uuidString
                                    let url = ProfilePicData.documentsDirectory.appendingPathComponent(imageName)
                                    try? self.selectImage?.jpegData(compressionQuality: 0.9)?.write(to: url)
                                    let photo = ProfilePic(imageName: imageName)
                                    self.profilePicData.profilePic.removeAll()
                                    //print(self.profilePicData.profilePic)
                                    self.profilePicData.profilePic.insert(photo, at: 0)
                                    //print(self.profilePicData.profilePic)
                                }
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        })
                        {
                            Text("Save")
                            .font(Font.custom("Snell Roundhand", size: geometry.size.width * 30 / 414))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width:geometry.size.width / 4, height:geometry.size.width * 60 / 414)
                                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.green))
                            .padding(EdgeInsets(top: 0, leading: geometry.size.width * 10 / 414, bottom: 0, trailing: geometry.size.width * 10 / 414))
                        }
                        .alert(isPresented: self.$showSaveAlert)
                        {
                            () -> Alert in
                            return Alert(title: Text("Opps!!\nSomething went wrong!!"), message: Text("Name is empty!!"))
                        }
                    }
                }
                .offset(x:0,y:-geometry.size.width * 30 / 414)
            }
            .navigationBarItems(leading: Button(action:
            {
                self.presentationMode.wrappedValue.dismiss()
            }){BackButton(unit: geometry.size.width / 414)})
        }
        .onAppear
        {
            if let editProfile = self.editProfile
            {
                self.name = editProfile.name
                self.selectedGender = editProfile.selectedGender
                self.age = editProfile.age
                self.selectedFavorite = editProfile.selectedFavorite
                if(self.selectedFavorite == 0)
                {
                    self.isChecked1 = true
                    self.isChecked2 = false
                    self.isChecked3 = false
                    self.isChecked4 = false
                }
                else if(self.selectedFavorite == 1)
                {
                    self.isChecked1 = false
                    self.isChecked2 = true
                    self.isChecked3 = false
                    self.isChecked4 = false
                }
                else if(self.selectedFavorite == 2)
                {
                    self.isChecked1 = false
                    self.isChecked2 = false
                    self.isChecked3 = true
                    self.isChecked4 = false
                }
                else if(self.selectedFavorite == 3)
                {
                    self.isChecked1 = false
                    self.isChecked2 = false
                    self.isChecked3 = false
                    self.isChecked4 = true
                }
            }
        }
        .keyboardObserving()
    }
}

struct ProfileEditor_Previews: PreviewProvider
{
    static var previews: some View
    {
        ProfileEditor(profilePicData: ProfilePicData(), selectImage: .constant(UIImage(named: "pic"))).environmentObject(ProfileData())
    }
}
