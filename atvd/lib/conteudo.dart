abstract class Conteudo {
  String titulo;
  int _classificacao = 0;
  Conteudo(this.titulo);

  int get classificacaoIndicativa => _classificacao;

  set validarClassificacao(int valor) => _classificacao = valor;
  void darPlay();
}

class Filme extends Conteudo {
  Filme(String titulo) : super(titulo);
  
  @override
  void darPlay() {
    print("Reproduzindo filme: $titulo");
  }
}

class Serie extends Conteudo {
  int temporadas;
  Serie(String titulo, this.temporadas) : super(titulo);
  @override
  void darPlay() {
    print("Reproduzindo séria: $titulo com $temporadas");
  }
}