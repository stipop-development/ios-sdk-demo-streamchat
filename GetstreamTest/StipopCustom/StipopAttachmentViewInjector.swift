//
//  StipopAttachmentViewInjector.swift
//  GetstreamTest
//
//  Created by Jay Ahn on 2021/12/16.
//

import UIKit
import StreamChatUI

class StipopAttachmentViewInjector: AttachmentViewInjector {
    let stipopStickerAttachmentView: StipopStickerAttachmentView = {
        let view = StipopStickerAttachmentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func contentViewDidLayout(options: ChatMessageLayoutOptions) {
        contentView.bubbleContentContainer.insertArrangedSubview(
            stipopStickerAttachmentView,
            at: 0,
            respectsLayoutMargins: true
        )
        let constraint = stipopStickerAttachmentView.widthAnchor.constraint(
            equalTo: contentView.widthAnchor
        )
        constraint.priority = .defaultLow
        constraint.isActive = true
    }
    
    override func contentViewDidUpdateContent() {
        stipopStickerAttachmentView.content = attachments(payloadType: StipopAttachmentPayload.self).first
        contentView.bubbleView?.backgroundColor = .clear
        contentView.bubbleView?.layer.borderWidth = 0
        contentView.bubbleView?.layer.borderColor = UIColor.clear.cgColor
    }
}
