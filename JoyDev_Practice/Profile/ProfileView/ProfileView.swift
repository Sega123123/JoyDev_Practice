//
//  ProfileView.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 08.07.2023.
//

import SwiftUI

struct ProfileView: View {
    init() {
        let jsonData = DataLoader.shared.jsonGet()
        imageUrl = jsonData.imageUrl
        name = jsonData.name
        username = jsonData.username
        bio = jsonData.bio
        joinDate = jsonData.joinDate
        following = jsonData.following
        followers = jsonData.followers
    }
    
    @State private var imageUrl:String
    @State private var name:String
    @State private var username:String
    @State private var bio:String
    @State private var joinDate:String
    @State private var following:Int
    @State private var followers:Int
    @State private var editMode: Bool = false
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: 10){
                ProfileHeader(editMode: $editMode, imageUrl: $imageUrl)
                FieldWithEditor(mode: $editMode, text: $name, type: .name)
                Text("@"+username)
                    .multilineTextAlignment(.leading)
                FieldWithEditor(mode: $editMode, text: $bio, type: .bio)
                
                Text("\(ProfileStrings.joined) \(joinDate)")
                    .multilineTextAlignment(.leading)
                HStack{
                    Text("\(ProfileStrings.following): **\(following)**")
                    Text("\(ProfileStrings.followers): **\(followers)**")
                }
            }
            .padding(.leading, 10.0)
        }.frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude, alignment: .top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
