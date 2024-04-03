//
//  CreateView.swift
//  SwiftData-Account
//
//  Created by 水原　樹 on 2024/04/01.
//

import SwiftUI
import SwiftData

struct CreateView: View {
    // SwiftDataで使用されるデータベースコンテキストを参照します。
    @Environment(\.modelContext) private var context
    // 現在表示されているビューを閉じるために使用
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var first_name = ""
    @State private var comment = ""
    var body: some View {
        NavigationStack{
            Form{
                TextField("ユーザー名",text: $name)
                TextField("ファーストネーム",text: $first_name)
                TextField("コメント",text: $comment)
                Button("作成"){
                    let createAccount = Account(name: name,first_name: first_name,comment: comment)
                    context.insert(createAccount)
                    dismiss()
                }
                
                .disabled(name.isEmpty)
                .navigationTitle("アカウント作成")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    CreateView()
}
