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
    var body: some View {
        VStack {
            NavigationStack{
                Group{
                    if accounts.isEmpty {
                        NavigationLink("アカウントを登録しよう！", destination: CreateView())
                    } else {
                        Text("登録ありがとう")
                        NavigationLink("アカウントを登録しよう！", destination: CreateView())
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
