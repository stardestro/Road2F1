//
//  supabasenav.swift
//  Road2F1
//
//  Created by Hussain Alkatheri on 10/19/25.
//
import SwiftUI
import Supabase

struct SupabaseNavView: View {
  @State var isAuthenticated = false
  var body: some View {
    Group {
      if isAuthenticated {
        SupabaseProfileView()
      } else {
        AuthView()
      }
    }
    .task {
      for await state in supabase.auth.authStateChanges {
        if [.initialSession, .signedIn, .signedOut].contains(state.event) {
          isAuthenticated = state.session != nil
        }
      }
    }
  }
}
