
//
//  QuarkTextView.swift
//  Quark
//
//  Created by Jose Canizares on 2/26/17.
//  Copyright © 2017 Flechettes. All rights reserved.
//

import UIKit
import Highlightr

class QuarkTextView: UITextView {
    func textViewDidChange(_ textView: UITextView) {
        print("typing")
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "paraiso-dark")
        // You can omit the second parameter to use automatic language detection.
        let highlightedCode = highlightr?.highlight(self.text, as: "swift", fastRender: true)
        self.attributedText = highlightedCode
    }
}
