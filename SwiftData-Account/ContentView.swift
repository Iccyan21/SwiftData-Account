//
//  ContentView.swift
//  SwiftData-Account
//
//  Created by 水原　樹 on 2024/04/01.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // SwiftUIの環境からモデルのコンテキストを取得
    @Environment(\.modelContext) private var context
    // データーベースからAccountオブジェクトの名前をタイトルでソートして取得
    @Query (sort: \Account.name) private var accounts: [Account]
    @State private var createNewBook = false
    var body: some View {
        VStack{
            NavigationStack{
                if accounts.isEmpty {
                    NavigationLink(destination: CreateView()) {
                        Text("アカウントを登録しよう")
                    }
                } else {
                    List {
                        ForEach(accounts) { account in
                            NavigationLink{
                                // タイトルと紐付けしてとる？？
                                EditView(account: account)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(account.name)
                                        .font(.title)
                                    Text(account.first_name)
                                        .font(.subheadline)
                                    Text(account.comment)
                                        .font(.caption)
                                }
                            }
                        }
                        // スライドしたら削除
                        .onDelete { IndexSet in
                            IndexSet.forEach { index in
                                let account = accounts[index]
                                context.delete(account)
                            }
                        }
                    }
                    NavigationLink(destination: CreateView()) {
                        Text("アカウントを登録しよう")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Account.self,inMemory: true)
}
