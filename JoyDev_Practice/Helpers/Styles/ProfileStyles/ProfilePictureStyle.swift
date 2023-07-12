//
//  ProfilePictureStyle.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 09.07.2023.
//

import SwiftUI

extension Image{
    func profileImage() -> some View{
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width*0.3,height: UIScreen.main.bounds.width*0.3)
            .clipShape(Circle())
            .overlay(Circle().stroke(lineWidth: 5).foregroundColor(Color.active))
    }
}
