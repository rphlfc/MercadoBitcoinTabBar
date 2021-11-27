//
//  MenuItem.swift
//  MercadoBitcoinTabBar
//
//  Created by Raphael Cerqueira on 26/11/21.
//

import Foundation

struct TabItem: Identifiable {
    let id = UUID().uuidString
    var image: String
    var title: String
}

let tabItems = [
    TabItem(image: "square.grid.2x2", title: "Início"),
    TabItem(image: "chart.bar", title: "Ativos"),
    TabItem(image: "dollarsign.square", title: "Movimentar BRL"),
    TabItem(image: "doc.plaintext", title: "Extrato")
]
