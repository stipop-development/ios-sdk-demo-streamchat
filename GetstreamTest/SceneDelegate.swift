//
//  SceneDelegate.swift
//  GetstreamTest
//
//  Created by Jay Ahn on 2021/12/15.
//

import UIKit
import StreamChat
import StreamChatUI
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let config = ChatClientConfig(apiKey: .init("b67pax5b2wdq"))
        
        /// user id and token for the user
        let userId = "tutorial-droid"
        let token: Token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZHJvaWQifQ.NhEr0hP9W9nwqV7ZkdShxvi02C5PR7SJE7Cs4y7kyqg"
        
        /// Step 1: create an instance of ChatClient and share it using the singleton
        ChatClient.shared = ChatClient(config: config)
        
        /// Step 2: connect to chat
        ChatClient.shared.connectUser(
            userInfo: UserInfo(
                id: userId,
                name: "Tutorial Droid",
                imageURL: URL(string: "https://bit.ly/2TIt8NR")
            ),
            token: token
        )
        
        /// Step 3: create the ChannelList view controller
        let channelList = ChatChannelListVC()
        let query = ChannelListQuery(filter: .containMembers(userIds: [userId]))
        channelList.controller = ChatClient.shared.channelListController(query: query)
        Components.default.channelVC = ViewController.self
        Components.default.attachmentViewCatalog = StipopAttachmentViewCatalog.self
        
        /// Step 4: similar to embedding with a navigation controller using Storyboard
        window?.rootViewController = UINavigationController(rootViewController: channelList)
    }
}
