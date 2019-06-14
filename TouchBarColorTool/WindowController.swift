//
//  WindowController.swift
//  TouchBarColorTool
//
//  Created by Funakoshi Minto on 2019/06/14.
//  Copyright © 2019年 Funakoshi Minto. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    @IBOutlet weak var colorPicker: NSColorPickerTouchBarItem!
    
    @IBOutlet weak var maxValueSegment: NSSegmentedControl!
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    @IBAction func changeColor(_ sender: NSColorPickerTouchBarItem) {
    }
    
    @IBAction func copyToClipBoard(_ sender: Any) {
        print(colorPicker.color)
        let board = NSPasteboard.general
        
        //テキストの作成
        let isMax255 = maxValueSegment.intValue==1
        let maxValue = isMax255 ? 255.0: 1.0
        let format = isMax255 ? "%.0lf, %.0lf, %.0lf, %.0lf" : "%lf, %lf, %lf, %lf"
        
        let color = colorPicker.color
        let red = Double(color.redComponent)*maxValue
        let green = Double(color.greenComponent)*maxValue
        let blue = Double(color.blueComponent)*maxValue
        let alpha = Double(color.alphaComponent)*maxValue
        let colorString = String(format: format, arguments: [red, green, blue, alpha])
        
        //クリップボードにセット
        board.clearContents()
        board.setString(colorString, forType: .string)
        
    }
}
