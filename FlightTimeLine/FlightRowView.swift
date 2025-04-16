//
//  FlightRowView.swift
//  FlightTimeLine
//
//  Created by Alexander Shevtsov on 15.04.2025.
//

import SwiftUI

struct FlightRowView: View {
    @State private var isPresented = false
    
    let flight: FlightInformation
    
    var body: some View {
        Button(action: { isPresented.toggle() }) { // делаем из строки кнопку
            HStack {
                Text("\(flight.airline) \(flight.number)")
                    .frame(width: 120, alignment: .leading) // размер, по лев краю
                Text(flight.otherAirport)
                    .frame(alignment: .leading)
                
                Spacer()
                
                Text(flight.flightStatus)
            }
        }
        .sheet(isPresented: $isPresented) { // вместо Alert
            FlightsDetailsView(isPresented: $isPresented, flight: flight)
        }
    }
}

#Preview {
    FlightRowView(flight: FlightInformation.generateFlight())
}
