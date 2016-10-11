//
//  ViewController.swift
//  ScrollingStack
//
//  Created by Mattias Jähnke on 11/10/16.
//  Copyright © 2016 Engineerish. All rights reserved.
//

import Cocoa
import Darwin

class ViewController: NSViewController {
    
    @IBOutlet weak var stack: NSStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
            self.appendViewToStack()
            return $0
        }
    }
    
    private func appendViewToStack() {
        let view = NSView()
        stack.addArrangedSubview(view)
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.random.cgColor
        view.addConstraint(view.heightAnchor.constraint(equalToConstant: 20))
    }
}

let colors: [NSColor] = [.blue, .red, .orange, .yellow, .brown, .black, .green, .purple, .gray, .cyan]

private extension NSColor {
    class var random: NSColor { return colors[Int(arc4random_uniform(UInt32(colors.count)))] }
}

class FlippedClipView: NSClipView {
    override var isFlipped: Bool { return true }
}
