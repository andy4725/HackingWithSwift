//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Endre Imecs on 5/29/24.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var scoreMessage = ""
    @State private var questionCount = 1
    @State private var gameOver = false
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Text("Guess The Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        
                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: 300)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("Question \(questionCount)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreMessage)
            Text(scoreMessage)
        }
        
        .alert("Game Over", isPresented: $gameOver) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your final score is \(score) points.")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            scoreMessage = score == 1 ? "You have \(score) point." : "You have \(score) points."
        } else {
            scoreTitle = "Wrong"
            scoreMessage = "That's the flag of \(countries[number])."
        }
        
        if questionCount <= 7 {
            showingScore = true
        } else {
            gameOver = true
        }
    }
    
    func askQuestion() {
        if questionCount <= 7 && gameOver == false{
            questionCount += 1
        }
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame() {
        score = 0
        questionCount = 1
        askQuestion()
    }
}


#Preview {
    ContentView()
}
