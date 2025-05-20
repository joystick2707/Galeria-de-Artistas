import SwiftUI

struct DetalhesObraView: View {
    let obra: ObraDeArte

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(obra.imagemNome)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text(obra.titulo)
                    .font(.title)
                    .bold()
                
                Text("Artista: \(obra.artista)")
                    .font(.headline)
                
                Text("Ano: \(obra.ano)")
                    .font(.subheadline)
                
                Text("Estilo: \(obra.estilo)")
                    .font(.subheadline)
                
                Divider()
                
                Text("Descrição")
                    .font(.headline)
                
                Text(obra.descricao)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle(obra.titulo)
        //.navigationBarTitleDisplayMode(.inline)
    }
}
