//
//  StipopStickerAttachmentView.swift
//  GetstreamTest
//
//  Created by Jay Ahn on 2021/12/16.
//

import UIKit
import StreamChat
import Stipop

public typealias StipopStickerMessageAttachment = ChatMessageAttachment<StipopAttachmentPayload>

class StipopStickerAttachmentView: UIView {
    var content: StipopStickerMessageAttachment? { didSet { updateContent() } }
    
    let stickerView: SPUIStickerView = {
        let stickerView = SPUIStickerView()
        stickerView.translatesAutoresizingMaskIntoConstraints = false
        return stickerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stickerView)
        NSLayoutConstraint.activate([
            stickerView.topAnchor.constraint(equalTo: topAnchor),
            stickerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stickerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stickerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stickerView.widthAnchor.constraint(equalToConstant: 120),
            stickerView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateContent() {
        guard let payload = content?.payload else {
            return
        }
        stickerView.setSticker(payload.stipopStickerImg.absoluteString)
    }
}
