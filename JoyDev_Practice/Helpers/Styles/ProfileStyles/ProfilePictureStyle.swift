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
            .frame(width: 125,height: 125)
            .clipShape(Circle())
            .overlay(Circle().stroke(lineWidth: 2).foregroundColor(Color.active))
    }
}
