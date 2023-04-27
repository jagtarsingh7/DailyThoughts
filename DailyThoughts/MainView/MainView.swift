import SwiftUI
/// Copyright (c) 2023 Razeware LLC
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

struct MainView: View {
    @EnvironmentObject var authModel: AuthenticationModel

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    NavigationLink(destination: JournalListView()) {
                        Text("Text-Journal")
                            .italic()
                            .navigationBarBackButtonHidden(true)
                            .padding(.top,20)
                            .padding(.bottom,20)
                            .padding(.leading,22)
                            .padding(.trailing,22)
                            .border(Color.black)
                            .background(Color.mint)
                            .foregroundColor(Color.black)
                            .cornerRadius(20)
                    }.frame(width: 200,height: 200)
                    NavigationLink(destination: ImageJournalMenu()) {
                        Text("Image-Journal")
                            .italic()
                            .navigationBarBackButtonHidden(true)
                            .padding(20)
                            .border(Color.black)
                            .background(Color.mint)
                            .foregroundColor(Color.black)
                            .cornerRadius(20)
                    }.frame(width: 200,height: 200)
                }
                .navigationBarTitle("Menu")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .background(
                    Image("swift-laughing")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    signOutButton()
                }
            }
        }
    }
    
    @ViewBuilder
    private func signOutButton() -> some View {
        Button(action: {
            authModel.signOut()
        }, label: {
            Text("Sign Out")
                .bold()
                .font(.footnote)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    Capsule()
                        .foregroundColor(.mint)
                )
        })
    }
}


struct JournalMainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
