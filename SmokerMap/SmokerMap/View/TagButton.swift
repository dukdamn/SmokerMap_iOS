

import UIKit

class TagButton: UIButton {
    var tagKey: TagKey
    init(tagKey: TagKey) {
        self.tagKey = tagKey
        super.init(frame: .zero)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
