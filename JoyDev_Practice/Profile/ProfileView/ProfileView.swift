//
//  ProfileView.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 08.07.2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var imageUrl = Images.profileTest
    @State private var name = "Bugaenko Daniil"
    @State private var username = "@ProveY0urW0rth"
    @State private var bio = "Created this page. Doing code for living. Perspective IOS developer who wants to create his own big Action-RPG game"
    @State private var joinDate = "November 2017"
    @State private var following = 121
    @State private var followers = 21230
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: 10){
                HStack(alignment: .bottom,spacing: 120){
                    Image(imageUrl).profileImage()
                    Button{
                        print("tapped edit button")
                    }label: {
                        Text("\(ProfileStrings.editProfile)")
                    }.buttonStyle(.editButton)
                }
                Text(name).boldLabelStyle
                Text(username)
                    .multilineTextAlignment(.leading)
                Text(bio).bio
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
