//
//  StipopAttachmentViewCatalog.swift
//  GetstreamTest
//
//  Created by Jay Ahn on 2021/12/16.
//

import StreamChat
import StreamChatUI

class StipopAttachmentViewCatalog: AttachmentViewCatalog {
    override class func attachmentViewInjectorClassFor(
        message: ChatMessage,
        components: Components
    ) -> AttachmentViewInjector.Type? {
        if hasStipopStickerLinkAttachment(message: message) {
            return StipopAttachmentViewInjector.self
        } else {
            return super.attachmentViewInjectorClassFor(
                message: message,
                components: components
            )
        }
    }
    
    private class func hasStipopStickerLinkAttachment(message: ChatMessage) -> Bool {
        return message.attachments(payloadType: StipopAttachmentPayload.self).first != nil
    }
}
