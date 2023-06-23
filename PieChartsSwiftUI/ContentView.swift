//
//  ContentView.swift
//  PieChartsSwiftUI
//
//  Created by Yunus Emre Taşdemir on 23.06.2023.
//

import SwiftUI
import Charts

struct MacroData {
    let name: String
    let value: Int
}

struct ContentView: View {
    
    @State private var macros: [MacroData] = [
        .init (name: "Protein", value: 180),
        .init (name: "Carbs", value: 250),
        .init (name: "Fats", value: 55)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text ("Macros")
                .font (.title2)
                .fontWeight (.semibold)
            
            Text ("Daily breakdown")
                .font (. footnote)
                .foregroundStyle(.gray)
            
            ZStack {
                Chart (macros, id: \.name) { macro in
                    SectorMark(
                        angle: .value ("Macros", macro.value),
                        innerRadius: .ratio(0.618),
                        angularInset: 1.5
                    )
                    .cornerRadius (4)
                    .foregroundStyle (by: .value("Name", macro.name))
                    /*BarMark(
                        x: .value ("Macros", macro.value),
                        stacking: .normalized
                    )
                    .foregroundStyle (by: .value("Name", macro.name))*/
                }
                .frame(height: 300)
                //.frame(height: 48) //BarMark
                .chartXAxis (.hidden)
                
                VStack {
                    Text ("Macros")
                        .font (.title2)
                        .fontWeight (.semibold)
                    
                    Text ("Daily breakdown")
                        .font (. footnote)
                        .foregroundStyle(.gray)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
