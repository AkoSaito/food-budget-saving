//
//  ContentView.swift
//  food-budget-saving
//
//  Created by Ako Saito on 2022/06/11.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""
    @State private var price = ""
    let now = Date()

    var body: some View {
        GeometryReader { geometry in
            VStack() {
                // TODO: textをlocalizeStringで管理
                // TODO: 日付・品名・価格の両端をカテゴリの円の端に合わせたい
                // TODO: デザイン
                HStack {
                    Text("日付")
                    Group {
                        Button(action: {}) {
                            Image(systemName: "chevron.left")
                        }
                        Button(action: {}) {
                            Text(getDate(date: now))
                        }

                        Button(action: {}) {
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .frame(
                    width: geometry.size.width - 20,
                    height: 30
                )
            
                HStack {
                    Text("品名")
                    TextField("トマト", text: $text)
                        .frame(width: geometry.size.width - 165, height: 30)
                }
                .frame(
                    width: geometry.size.width - 20,
                    height: 30,
                    alignment: .center
                )

                HStack {
                    Text("価格")

                    TextField("0", text: $price)
                        .multilineTextAlignment(TextAlignment.trailing)
                        .frame(width: geometry.size.width - 190, height: 30)
                    Text("円")
                }
                .frame(
                    width: geometry.size.width - 20,
                    height: 30,
                    alignment: .center
                )

                HStack {
                    // TODO: アイコン検討
                    Button(action: {}) {
                        CircleIconView(
                            image: "tomato",
                            borderColor: Color(.red),
                            borderWidth: 2,
                            categoryName: "やさい"
                        )
                    }

                    Button(action: {}) {
                        CircleIconView(
                            image: "strawberry",
                            borderColor: Color(.red),
                            borderWidth: 2,
                            categoryName: "くだもの"
                        )
                    }

                    Button(action: {}) {
                        CircleIconView(
                            image: "meat",
                            borderColor: Color(.red),
                            borderWidth: 2,
                            categoryName: "にく"
                        )
                    }

                    Button(action: {}) {
                        CircleIconView(
                            image: "fish",
                            borderColor: Color(.red),
                            borderWidth: 2,
                            categoryName: "さかな"
                        )
                    }

                    Button(action: {}) {
                        CircleIconView(
                            image: "",
                            borderColor: Color(.red),
                            borderWidth: 2,
                            categoryName: "そのた"
                        )
                    }
                }.padding(.top, 50)
                .padding(.bottom, 50)
                HStack {
                    Button(action: {}) {
                        Text("入力する")
                    }
                }
            }.frame(width: geometry.frame(in: .global).width, height:geometry.frame(in: .global).height, alignment: .center)
        }
    }

    func getDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        formatter.dateFormat =  "yyyy/MM/dd(E)"

        return formatter.string(from: date)
    }
}

struct CircleIconView: View {
    var image: String
    var borderColor: Color
    var borderWidth: CGFloat
    var categoryName: String
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(borderColor, lineWidth: borderWidth)
                .frame(width:50, height: 50)
            VStack(spacing: 0) {
                Text(categoryName)
                    .font(.system(size: min(50, 50) * 0.15))

                if image != "" {
                    Image(image).resizable().scaledToFit().frame(width: 20, height: 20)
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
