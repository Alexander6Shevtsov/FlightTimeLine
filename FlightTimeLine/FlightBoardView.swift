//
//  FlightBoardView.swift
//  FlightTimeLine
//
//  Created by Alexander Shevtsov on 11.04.2025.
//

import SwiftUI

struct FlightBoardView: View {
    @State private var hiddenCanceled = false // свойство фильтра
    
    let boardName: String // через иниц
    let flights: [FlightInformation]
    
    private var shownFlights: [FlightInformation] { // filtered массив
        hiddenCanceled // перебираем массив
        ? flights.filter { $0.status != .cancelled } // если статус не равен
        : flights // иначе отображаем основной массив
    }
    
    var body: some View {
        //  ScrollView([.horizontal, .vertical]) { скролинг во све стороны
        List(shownFlights) { flight in // готовый список со скролом
            FlightRowView(flight: flight)
        }
        .listStyle(.plain)
        .navigationTitle(boardName)
        .toolbar { // размещаем тулбар
            ToolbarItem(placement: .topBarTrailing) { // задаем параметры
                Toggle("Hide canceled", isOn: $hiddenCanceled) // кнопка
            }
        }
    }
}

#Preview {
    FlightBoardView(boardName: "Flight Board", flights: FlightInformation.generateFlights())
}
