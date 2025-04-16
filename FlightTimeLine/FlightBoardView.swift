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
    
    private var shownFlights: [FlightInformation] { // фильтр массив
        hiddenCanceled
        ? flights.filter { $0.status != .cancelled }
        : flights
    }
    
    var body: some View {
        //  ScrollView([.horizontal, .vertical]) { скролинг во све стороны
        List(shownFlights) { flight in // готовый список со скролом
            FlightRowView(flight: flight)
        }
        .listStyle(.plain)
        .navigationTitle(boardName)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) { // кнопка
                Toggle("Hide canceled", isOn: $hiddenCanceled)
            }
        }
    }
}

#Preview {
    FlightBoardView(boardName: "Flight Board", flights: FlightInformation.generateFlights())
}
