//
//  SwiftData_AccountApp.swift
//  SwiftData-Account
//
//  Created by 水原　樹 on 2024/04/01.
//

import SwiftUI
import SwiftData

@main
struct SwiftData_AccountApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // ここで使うベースモデルを設定
        .modelContainer(for: Account.self)
    }
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
