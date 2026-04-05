import 'package:atvd/conteudo.dart';
import 'dart:convert';
import 'dart:io';

void salvar(List<Conteudo> conteudo) {
  final arquivo = File('./dados.json');
  List<Map<String, dynamic>> listaParaSalvar =
      conteudo.map((filme) => filme.toJson()).toList();
  arquivo.writeAsStringSync(jsonEncode(listaParaSalvar));
}

void main(List<String> arguments) {
  List<Conteudo> catalogo = [];

  final arquivo = File('./dados.json');
  if (arquivo.existsSync()) {
    List<dynamic> dados = jsonDecode(arquivo.readAsStringSync());
    for (var item in dados) {
      var filme = Filme(item['ID'], item['titulo']);
      filme.validarClassificacao = item['classificacao'];
      catalogo.add(filme);
    }

    while (true) {
      for (var filmes in catalogo) {
        print(
          '${filmes.id} | ${filmes.titulo} | ${filmes.classificacaoIndicativa}',
        );
      }
      print('-------------------------------------');
      print(
        '[1] Adicionar | [2] Remover | [5] Sair',
      );
      stdout.write('Escolha: ');

      String? opcao = stdin.readLineSync();
      if (opcao == '5') break;
      try {
        if (opcao == "1") {
          stdout.write('ID do Novo Filme: ');
          String id = stdin.readLineSync()!;

          bool idJaExiste = catalogo.any((filmeAtual) => filmeAtual.id == id);

          if (idJaExiste) {
            throw Exception("Erro: ID já cadastrado no sistema!");
          } else {
            stdout.write('Nome do Novo Filme: ');
            String nome = stdin.readLineSync()!;

            stdout.write('Classificação do Novo Filme: ');
            int classificacao = int.parse(stdin.readLineSync()!);

            Filme adicionar = Filme(nome, id);
            adicionar.validarClassificacao = classificacao;

            catalogo.add(adicionar);
            print('✅ Filme cadastrado com sucesso');
          }
        }
        if (opcao == "2") {
          stdout.write('ID do filme para EXCLUIR: ');
          String idExcluir = stdin.readLineSync()!;

          catalogo.removeWhere((idAtual) => idAtual.id == idExcluir);
          print('🗑️ Filme removido!');
        }
        salvar(catalogo);
      } catch (e) {
        print('\n⚠️ ERRO: ${e.toString().replaceAll('Exception: ', '')}');
        stdout.write('Pressione Enter para continuar...');
        stdin.readLineSync();
      }
    }
  }
}
