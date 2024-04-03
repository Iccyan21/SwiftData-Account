//
//  Account.swift
//  SwiftData-Account
//
//  Created by 水原　樹 on 2024/04/01.
//

import SwiftData

// SwiftDataと連携
@Model
class Account {
    var name: String
    var first_name: String
    var comment: String
    // 新しいAccountオブジェクトを作成する際に必要な情報を引数として受け取る
    init(name: String,first_name: String,comment:String) {
        self.name = name
        self.first_name = first_name
        self.comment = comment
    }
}

