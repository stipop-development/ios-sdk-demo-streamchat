//
//  StipopAttachmentPayload.swift
//  GetstreamTest
//
//  Created by Jay Ahn on 2021/12/16.
//

import Foundation
import StreamChat

public struct StipopAttachmentPayload: AttachmentPayload {
    public static var type: AttachmentType = .unknown
    public var stipopStickerImg: URL
}
