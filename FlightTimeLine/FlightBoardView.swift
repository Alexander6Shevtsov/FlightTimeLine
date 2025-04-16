//
//  FlightBoardView.swift
//  FlightTimeLine
//
//  Created by Alexander Shevtsov on 11.04.2025.
//

import SwiftUI

struct FlightBoardView: View {
    let boardName: String // через иниц
    let flights: [FlightInformation]
    
    var body: some View {
        //  ScrollView([.horizontal, .vertical]) { скролинг во све стороны
        List(flights) { flight in // готовый список со скролом
            FlightRowView(flight: flight)
        }
        .listStyle(.plain)
        .navigationTitle(boardName)
    }
}

#Preview {
    FlightBoardView(boardName: "Flight Board", flights: FlightInformation.generateFlights())
}
