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
     @State private var showingAlert = false
     
     var body: some View {
         VStack{
             ZStack(alignment: .topLeading){
                 HStack(alignment: .bottom){
                     Image(imageUrl).profileImage()
                     Spacer()
                     HStack(spacing: 5){
                         Button{
                             showingAlert = !showingAlert
                         }label: {
                             Image(systemName: Images.share)
                         }.buttonStyle(.subButton)
                             .alert(isPresented: $showingAlert){
                                 Alert(title: Text("Share link"),message: Text("share"),dismissButton: .default(Text("OK")))
                             }
                         Button{
                             editMode = !editMode
                         }label: {
                             Text("\(!editMode ? ProfileStrings.editProfile : ProfileStrings.saveProfile)").animation(.interpolatingSpring(stiffness: 170, damping: 15),value: editMode)
                         }.buttonStyle(.mainButton)
                         Spacer().frame(width: UIScreen.main.bounds.width*0.01)
                     }
                 }
             }
         }
     }
 }
