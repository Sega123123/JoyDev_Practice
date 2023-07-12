//
//  ProfileButtonStyle.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 08.07.2023.
//

import SwiftUI

//MARK: - Button styles
struct MainButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .padding(.horizontal,12)
            .padding(.vertical,7)
            .font(.title3)
            .lineLimit(nil)
            .multilineTextAlignment(.center)
            .frame(minWidth: UIScreen.main.bounds.width*0.1,maxWidth: UIScreen.main.bounds.width*0.45)
            .background(Color.active)
            .foregroundColor(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 7.5))
    }
}

struct SubButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal,5)
            .padding(.vertical,7)
            .font(.title3)
            .multilineTextAlignment(.center)
            .frame(maxWidth: UIScreen.main.bounds.width*0.1)
            .background(Color.white)
            .foregroundColor(.active)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.active, lineWidth: 2))
    }
}

extension ButtonStyle where Self == MainButtonStyle{
    static var mainButton: Self { Self()}
}

extension ButtonStyle where Self == SubButtonStyle{
    static var subButton: Self {Self()}
}
