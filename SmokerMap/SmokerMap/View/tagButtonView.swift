

import UIKit
import SnapKit
protocol TagButtonViewDelegate: class {
  func tagButtonsDidTap(tagKey: TagKey)
}

class TagButtonView: UIView {
  
  struct Padding {
    static let inset: CGFloat = 16
    static let buttonXSpace: CGFloat = 40
    static let buttonYSpace: CGFloat = 8
    static let buttonSize: CGFloat = 70
  }
  
  weak var delegate: TagButtonViewDelegate?
  
  private var tagButtons = [UIButton]()
  private var selectButtonTag: Int?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  convenience init(fontSize: CGFloat, cornerRadius: CGFloat) {
    self.init()
    self.createTagButton(fontSize: fontSize, cornerRadius: cornerRadius)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func createTagButton(fontSize: CGFloat, cornerRadius: CGFloat) {
    for (index, value) in TagData.tagHeads.enumerated() {
      
      let tempButton = TagButton(tagKey: value)
      tagButtons.append(tempButton)
      tempButton.tag = index
      tempButton.layer.cornerRadius = 10 + cornerRadius
      tempButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
      tempButton.setTitle(TagData.tags[value.rawValue]?.name, for: .normal)
      tempButton.setTitleColor(.white, for: .normal)
      tempButton.backgroundColor = TagData.tags[value.rawValue]?.color
      tempButton.addTarget(self, action: #selector(tagButtonAction(_:)), for: .touchUpInside)
      self.addSubview(tempButton)
      //tempButton.translatesAutoresizingMaskIntoConstraints = false
    }
    setConstraints()
    
  }
  private func setConstraints(){
    let center = tagButtons[4].snp
    tagButtons.forEach {
      $0.snp.makeConstraints {
        $0.height.width.equalTo(100)
      }
    }
    tagButtons[3...5].forEach {
      $0.snp.makeConstraints {
        $0.centerY.equalToSuperview()
      }
    }
    tagButtons.filter { $0.tag % 3 == 1 }.forEach {
      $0.snp.makeConstraints {
        $0.centerX.equalToSuperview()
      }
    }
    
    tagButtons[0...2].forEach {
      $0.snp.makeConstraints {
        $0.bottom.equalTo(center.top).offset(-10)
      }
    }
    
    tagButtons.filter { $0.tag % 3 == 2 }.forEach {
      $0.snp.makeConstraints {
        $0.leading.equalTo(center.trailing).offset(10)
      }
    }
    tagButtons[6...8].forEach {
      $0.snp.makeConstraints {
        $0.top.equalTo(center.bottom).offset(10)
      }
    }
    tagButtons.filter { $0.tag % 3 == 0 }.forEach {
      $0.snp.makeConstraints {
        $0.trailing.equalTo(center.leading).offset(-10)
      }
    }
  }
  @objc private func tagButtonAction(_ sender: TagButton) {
    tagButtons[sender.tag].shadow()
    if let tempTag = selectButtonTag {
      tagButtons[tempTag].unShadow()
    }
    selectButtonTag = sender.tag
    delegate?.tagButtonsDidTap(tagKey: sender.tagKey)
  }
  
}
