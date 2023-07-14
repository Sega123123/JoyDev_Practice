//
//  ProfileView.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 08.07.2023.
//

import SwiftUI

struct ProfileView: View {
    init() {
        profileData = DataLoader.shared.jsonGet()
    }
    @State private var profileData: Profile
    @State private var editMode: Bool = false
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: 10){
                ProfileHeader(editMode: $editMode, imageUrl: $profileData.imageUrl)
                FieldWithEditor(mode: $editMode, text: $profileData.name, type: .name)
                Text("@"+profileData.username)
                    .multilineTextAlignment(.leading)
                FieldWithEditor(mode: $editMode, text: $profileData.bio, type: .bio)
                
                Text("\(ProfileStrings.joined) \(profileData.joinDate)")
                    .multilineTextAlignment(.leading)
                HStack{
                    Text("\(ProfileStrings.following): **\(profileData.following)**")
                    Text("\(ProfileStrings.followers): **\(profileData.followers)**")
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
