//
//  Enums.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 08.07.2023.
//

import Foundation

enum ProfileStrings{
    static let editProfile = NSLocalizedString("Profile.EditButton", comment: "label for edit profile button"),
               following = NSLocalizedString("Profile.Following", comment: "label for user profile following count"),
               followers = NSLocalizedString("Profile.Followers", comment: "label for user profile followers count"),
               joined = NSLocalizedString("Profile.Joined", comment: "label fot user profile joined date")
}

enum NavBarString{
    static let carousel = NSLocalizedString("TabBar.Carousel", comment: "label for carousel button"),
               profile = NSLocalizedString("TabBar.Profile", comment: "label for profile button")
}

enum Images{
    static let carousel = "house",
               profile = "person"
}
