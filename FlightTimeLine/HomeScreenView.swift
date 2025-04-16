//
//  HomeScreenView.swift
//  FlightTimeLine
//
//  Created by Alexander Shevtsov on 11.04.2025.
//

import SwiftUI

struct HomeScreenView: View {
    private let flights = FlightInformation.generateFlights() // иниц класса
    
    var body: some View {
        NavigationStack { // помещаем чтоб работали ссылки
            ZStack {
                Image(systemName: "airplane") // изображение
                    .resizable() // сбрасываем размеры
                    .frame(width: 250, height: 250)
                    .opacity(0.1) // прозрачность
                    .rotationEffect(.degrees(-90)) // поворот на лево
                
                VStack(alignment: .leading, spacing: 10) { // выравнивание и расстояние
                    NavigationLink("Arrivals") { // ссылка
                        FlightBoardView(
                            boardName: "Arrivals",
                            flights: flights.filter { $0.direction == .arrival }
                        ) // фильтруем и передаем только прибытие
                    }
                    
                    NavigationLink("Departures") { // ссылка
                        FlightBoardView(
                            boardName: "Departures",
                            flights: flights.filter { $0.direction == .departure }
                        ) // фильтруем и передаем только отправление
                    }
                    
                    NavigationLink("Flight Timeline") { // ссылка
                        TimelineView(flights: flights)
                    }
                    
                    Spacer() // поднимаем ссылки вверх
                }
                .font(.title) // шрифт ссылок
                .padding()
            }
            .navigationTitle("Airport")
        }
    }
}

#Preview {
    HomeScreenView()
}
