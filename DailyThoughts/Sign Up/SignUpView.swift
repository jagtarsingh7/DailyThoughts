/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct SignUpView: View {
  @State private var emailAddress: String = ""
  @State private var password: String = ""
  @EnvironmentObject var authModel: AuthenticationModel
  @State private var isJournalShown = false

  var body: some View {
    ZStack(alignment: .top) {
      Color.mint
        .ignoresSafeArea()
      VStack(alignment: .center, spacing: 40) {
        header()
        inputFields()
        signUpButton()
        Text("or")
        signInButton()
      }
    }
  }

  @ViewBuilder
  private func header() -> some View {
    VStack(spacing: 0) {
      Image("swift-laughing")
      Text("Daily Thoughts")
        .bold()
        .font(Font.largeTitle)
    }
  }

  @ViewBuilder
  private func inputFields() -> some View {
    VStack(alignment: .center, spacing: 16) {
      TextField(
        "Email Address",
        text: $emailAddress
      )
      .textContentType(.emailAddress)
      .textInputAutocapitalization(.never)
      .keyboardType(.emailAddress)
      .padding()
      .background(Color.white)
      .clipShape(Capsule())

      SecureField(
        "Password",
        text: $password
      )
      .textContentType(.password)
      .textInputAutocapitalization(.never)
      .padding()
      .background(Color.white)
      .clipShape(Capsule())
    }
    .padding(.horizontal)
  }

  @ViewBuilder
  private func signUpButton() -> some View {
    Button(
      action: {
        authModel.signUp(
          emailAddress: emailAddress,
          password: password
        )
      },
      label: {
        Text("Sign Up")
          .bold()
          .foregroundColor(.black)
          .padding()
          .frame(maxWidth: .infinity)
          .background(.regularMaterial)
          .clipShape(Capsule())
          .padding(.horizontal)
      }
    )
  }

  @ViewBuilder
  private func signInButton() -> some View {
    Button(
      action: {
        authModel.signIn(
          emailAddress: emailAddress,
          password: password
        )
      },
      label: {
        Text("Sign In")
          .bold()
          .foregroundColor(.black)
          .padding()
          .frame(maxWidth: .infinity)
          .background(.regularMaterial)
          .clipShape(Capsule())
          .padding(.horizontal)
      }
    )
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView()
      .previewLayout(.sizeThatFits)
  }
}
