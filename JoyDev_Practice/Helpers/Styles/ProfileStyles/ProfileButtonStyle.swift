//
//  ProfileButtonStyle.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 08.07.2023.
//

import SwiftUI

//MARK: - Button styles
struct ProfileEditButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .padding(.horizontal,12)
            .padding(.vertical,7)
            //.scaledToFit()
            .font(.title3)
            .lineLimit(nil)
            .multilineTextAlignment(.center)
            .frame(maxWidth: 170)
            .background(Color.active)
            .foregroundColor(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 7.5))
    }
}

extension ButtonStyle where Self == ProfileEditButton{
    static var editButton: Self { Self()}
}
