//
//  IdentityDetailView.swift
//  Mailway
//
//  Created by Cirno MainasuK on 2020-5-22.
//  Copyright © 2020 Dimension. All rights reserved.
//

import SwiftUI

struct IdentityDetailView: View {
    
    @EnvironmentObject var context: AppContext
    @ObservedObject var viewModel: IdentityDetailViewModel
    
    var body: some View {
        ProfileView(
            avatar: $viewModel.avatar,
            name: $viewModel.name,
            shortKeyID: $viewModel.shortKeyID,
            shareProfileAction: { self.viewModel.shareProfileActionPublisher.send(()) },
            contactInfoDict: $viewModel.contactInfoDict,
            note: $viewModel.note
        )
    }
        
}

#if DEBUG
import CoreData
import CoreDataStack

struct IdentityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let managedObjectContext = AppContext.shared.managedObjectContext
        
        let keypairProperty = Keypair.Property(privateKey: nil, publicKey: "", keyID: "0816fe6c1edebe9fbb83af9102ad9c899abec1a87a1d123bc24bf119035a2853")
        let keypair = Keypair.insert(into: managedObjectContext, property: keypairProperty)
        
        let identityProperty = Contact.Property(name: "Alice", note: "Alice in the Book\nPhone Number: +00 123-456-7890")
        let channels: [ContactChannel] = [
            ContactChannel.insert(into: managedObjectContext, property: .init(name: .twitter, value: "@alice")),
            ContactChannel.insert(into: managedObjectContext, property: .init(name: .twitter, value: "@alice1")),
            ContactChannel.insert(into: managedObjectContext, property: .init(name: .twitter, value: "@alice2")),
            ContactChannel.insert(into: managedObjectContext, property: .init(name: .facebook, value: "Alice not alice")),
            ContactChannel.insert(into: managedObjectContext, property: .init(name: .telegram, value: "Alice!")),
            ContactChannel.insert(into: managedObjectContext, property: .init(name: .discord, value: "Alice#1234")),
            ContactChannel.insert(into: managedObjectContext, property: .init(name: .custom("about.me"), value: "Alice.about.me")),
        ]
        let identity = Contact.insert(into: managedObjectContext, property: identityProperty, keypair: keypair, channels: channels)
        
        let viewModel = IdentityDetailViewModel(context: AppContext.shared, identity: identity)
        return IdentityDetailView(viewModel: viewModel)
            .environmentObject(AppContext.shared)
    }
}
#endif
