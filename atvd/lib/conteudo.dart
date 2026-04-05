abstract class Conteudo {
  String id;
  String titulo;
  int _classificacao = 0;
  Conteudo(this.titulo, this.id);

  int get classificacaoIndicativa => _classificacao;

  set validarClassificacao(int valor) {
    if (valor < 0) {
      throw Exception("A classificação não pode ser negativa!");
    }
    _classificacao = valor;
  }

  Map<String, dynamic> toJson();
  void darPlay();
}

class Filme extends Conteudo {
  Filme(String titulo, id) : super(titulo, id);

  @override
  void darPlay() {
    print("Reproduzindo filme: $titulo");
  }


  @override
  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'titulo': titulo,
      'classificacao': classificacaoIndicativa
    };
  }
}

class Serie extends Conteudo {
  int temporadas;
  Serie(String titulo, id, this.temporadas) : super(titulo, id);
  @override
  void darPlay() {
    print("Reproduzindo série: $titulo com $temporadas temporadas");
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'titulo': titulo,
      'classificacao': classificacaoIndicativa,
      'temporadas': temporadas
    };
  }
}
