//
//  ListaContatosViewController.m
//  AgendaDeContatos
//
//  Created by Thiago Durante Pires on 09/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "Contato.h"

@implementation ListaContatosViewController

-(id) init { // retornar id é a mesma coisa de retornar um (NSObject *), ou seja, é o mais genérico possível
    self = [super init]; // Manter a herança com a classe mãe
    
    UIBarButtonItem *botaoForm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(exibeFormulario)];
    self.navigationItem.rightBarButtonItem = botaoForm;
    self.navigationItem.title = @"Contatos";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.linhaSelecionada = -1;
    
    self.dao = [ContatoDAO contatoDAOInstance];
    
    return self;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete){
        Contato *contato = [self.dao contatoDoIndice:indexPath.row];
        
        [self.dao removeContato: contato];
        
        // @[] cria um array
        // Primeiramente faz a deleção do item do array e depois deleta o item da própria tabela
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

// Quando clicar em uma linha da tabela
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.contatoSelecionado = [self.dao contatoDoIndice:indexPath.row];
    [self exibeFormulario];
    
}

-(void) exibeFormulario {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"Form-contato"];
    
    // Se for uma edição
    if (self.contatoSelecionado){
        form.contato = self.contatoSelecionado;
    }
    self.contatoSelecionado = nil;
    
    // Protocolo
    form.delegate = self;
    
    [self.navigationController pushViewController:form animated:YES];
}

// Número de linhas a ser exibido na TableView
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dao total];
}

// Determina o estilo básico da célula ou de uma row de uma TableView. Chamado somente uma vez na criação.
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identificador = @"Celula";
    
    // Célula reutilisável, como se fosse uma RecyclerView do Android
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    
    // Se não tiver uma célula para ser reaproveitada, então cria uma nova célula
    if(!cell){
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    
    Contato *contato = [self.dao contatoDoIndice:indexPath.row];
    cell.textLabel.text = contato.nome;
    
    return cell;
}

// Recarregar a tela
-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

-(void) contatoAdicionado: (Contato *) contato {
    self.linhaSelecionada = [self.dao indiceDoContato:contato];
    
    NSString *mensagem = [NSString stringWithFormat:@"Contato %@ adicionado com sucesso!", contato.nome];
    
    // Cria o alerta
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Contato adicionado!" message:mensagem preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok!" style:UIAlertActionStyleCancel handler:nil];
    [alerta addAction:ok];
    
    // Manda pra tela o alerta em forma de modal
    [self presentViewController:alerta animated:YES completion:nil];
    
    NSLog(@"Contato %@ adicionado com sucesso!", contato.nome);
}

-(void) contatoAtualizado: (Contato *) contato {
    self.linhaSelecionada = [self.dao indiceDoContato:contato];
    NSLog(@"Contato %@ editado com sucesso!", contato.nome);
}

-(void)viewDidAppear:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.linhaSelecionada inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    self.linhaSelecionada = -1;
}

@end
