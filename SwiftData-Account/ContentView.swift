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
                        NavigationLink(destination: CreateView()) {
                            Text("アカウントを登録しよう")
                        }
                    } else {
                        List{
                            ForEach(accounts){ account in
                                NavigationLink{
                                    // タイトルと紐付けしてとる？？
                                    ReadView()
                                } label: {
                                    HStack(spacing: 10){
                                        VStack(alignment: .leading){
                                            Text(account.name).font(.title2)
                                            Text(account.first_name).foregroundStyle(.secondary)
                                            if let rating = account.rating {
                                                HStack{
                                                    ForEach(0..<rating, id:\.self){
                                                        _ in
                                                        Image(systemName: "star.fill")
                                                            .imageScale(.small)
                                                            .foregroundStyle(.yellow)
                                                    }
                                                }
                                                
                                            }
                                        }
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
                        .listStyle(.plain)
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
