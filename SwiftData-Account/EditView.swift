//
//  EditView.swift
//  SwiftData-Account
//
//  Created by 水原　樹 on 2024/04/04.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) private var dismiss
    let account: Account
    @State private var rating: Int?
    @State private var name = ""
    @State private var first_name = ""
    @State private var comment = ""
    
    var body: some View {
        VStack{
            LabeledContent{
                TextField("",text: $name)
            } label: {
                Text("名前").foregroundStyle(.secondary)
            }
            LabeledContent{
                TextField("",text: $first_name)
            } label: {
                Text("ファーストネーム").foregroundStyle(.secondary)
            }
            LabeledContent{
                TextField("",text: $comment)
            } label: {
                Text("コメント").foregroundStyle(.secondary)
            }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .navigationTitle(name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            if changed{
                // ユーザーがこのボタンをクリックすると、編集された本の情報が保存
                Button("Update"){
                    account.name = name
                    account.first_name = first_name
                    account.comment = comment
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        // ビューが表示される際に初期値を設定する
        .onAppear{
            name = account.name
            first_name = account.first_name
            comment = account.comment
         
        }
    }
    // 編集前後で情報に変更があるかどうかをチェック
    var changed: Bool {
        name != account.name
        || first_name != account.first_name
        || comment != account.comment
    }
}
