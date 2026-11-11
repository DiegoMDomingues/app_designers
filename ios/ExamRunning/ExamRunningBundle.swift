//
//  ExamRunningBundle.swift
//  ExamRunning
//
//  Created by Daniel Santana on 09/06/25.
//

import WidgetKit
import SwiftUI

@main
struct ExamRunningBundle: WidgetBundle {
    var body: some Widget {
        if #available(iOS 16.1, *) {
            ExamRunningLiveActivity()
        }
    }
}
