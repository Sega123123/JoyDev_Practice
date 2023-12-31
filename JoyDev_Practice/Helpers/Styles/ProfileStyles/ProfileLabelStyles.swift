//
//  LabelStyles.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 09.07.2023.
//

import SwiftUI

extension View {
    var labelStyle: some View{
        self.foregroundColor(.black)
            .font(.system(size: 28,weight: .medium,design: .rounded))
    }
    var boldLabelStyle: some View{
        self.foregroundColor(.black)
            .font(.system(size: 28,weight: .bold,design: .rounded))
    }
    var bioLabelStyle: some View{
        self.foregroundColor(.black)
            .font(.system(size: 20,weight:.regular,design: .rounded))
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 4.0)
    }
    var bioEditorStyle: some View{
        self.foregroundColor(.black)
            .font(.system(size: 20,weight: .regular,design: .rounded))
            .multilineTextAlignment(.leading)
            .frame(minWidth: UIScreen.main.bounds.width*0.919, maxHeight: 160)
            .fixedSize(horizontal: true, vertical: false)
    }
}
