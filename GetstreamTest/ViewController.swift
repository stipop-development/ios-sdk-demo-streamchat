//
//  ViewController.swift
//  GetstreamTest
//
//  Created by Jay Ahn on 2021/12/15.
//

import UIKit
import StreamChat
import StreamChatUI
import AVFoundation
import Stipop

class ViewController: ChatChannelVC {
    let stipopPickerButton: SPUIButton = {
        let stipopPickerButton = SPUIButton(type: .system)
        return stipopPickerButton
    }()
    
    let stipopSearchButton: SPUIButton = {
        let stipopSearchButton = SPUIButton(type: .system)
        let iconImage = UIImage(named: "searchIcon")
        stipopSearchButton.setImage(iconImage, for: .normal)
        return stipopSearchButton
    }()
    
    override func setUpLayout() {
        super.setUpLayout()
        if let userId = ChatClient.shared.currentUserId {
            let stipopUser = SPUser(userID: userId)
            
            stipopPickerButton.setUser(stipopUser, viewType: .picker)
            stipopPickerButton.delegate = self
            messageComposerVC.composerView.trailingContainer.addArrangedSubview(stipopPickerButton)
            
            stipopSearchButton.setUser(stipopUser, viewType: .search)
            stipopSearchButton.delegate = self
            messageComposerVC.composerView.trailingContainer.addArrangedSubview(stipopSearchButton)
        }
    }
}

extension ViewController: SPUIDelegate {
    func spViewDidSelectSticker(_ view: SPUIView, sticker: SPSticker) {
        guard let stickerImgURL = URL(string: sticker.stickerImg) else { return }
        let payload = StipopAttachmentPayload(stipopStickerImg: stickerImgURL)
        self.channelController.createNewMessage(
            text: "",
            attachments: [AnyAttachmentPayload(payload: payload)]
        )
    }
}
