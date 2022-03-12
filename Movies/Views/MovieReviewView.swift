//
//  MovieReviewView.swift
//  Movies
//
//  Created by LiewSyetChau on 5/3/22.
//

import SwiftUI

struct MovieReviewView: View {
    
    @ObservedObject private var movieReviewManager: MovieReviewManager
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        self.movieReviewManager = MovieReviewManager(movie: movie)
        
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.7)
            
            List {
                ForEach(movieReviewManager.reviews) { review in
                    VStack {
                        Text(review.author ?? "")
                            .font(.title)
                            .bold()
                        
                        Text(review.content ?? "")
                            .font(.body)
                            .lineLimit(nil)
                        
                    }.foregroundColor(.white)
                     .listRowBackground(Color.clear)
                }
            }.onAppear {
                movieReviewManager.getMovieReviews()
            }.padding(.horizontal, 32)
        }.padding(.top, 32)
         .edgesIgnoringSafeArea(.all)
    }
}
