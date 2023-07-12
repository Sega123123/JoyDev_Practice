//
//  ProfileHeader.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 12.07.2023.
//

import SwiftUI


 struct ProfileHeader: View {
     
     @Binding var editMode: Bool
     @Binding var imageUrl: String
     
     var body: some View {
         VStack{
             ZStack(alignment: .topLeading){
                 HStack(alignment: .bottom){
                     Image(imageUrl).profileImage()
                     Spacer()
                     HStack(spacing: 5){
                         Button{
                             print("Tapped share button")
                         }label: {
                             Image(systemName: Images.share)
                         }.buttonStyle(.subButton)
                         Button{
                             editMode = !editMode
                         }label: {
                             Text("\(!editMode ? ProfileStrings.editProfile : ProfileStrings.saveProfile)")
                         }.buttonStyle(.mainButton)
                         Spacer().frame(width: UIScreen.main.bounds.width*0.01)
                     }
                 }
             }
         }
     }
 }
