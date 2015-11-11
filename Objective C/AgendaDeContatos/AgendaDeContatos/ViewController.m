//
//  ViewController.m
//  AgendaDeContatos
//
//  Created by Thiago Durante Pires on 09/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"


@implementation ViewController

-(id) initWithCoder: (NSCoder *) aDecoder { // retornar id é a mesma coisa de retornar um (NSObject *), ou seja, é o mais genérico possível
    self = [super initWithCoder:aDecoder];
    if(self){
        self.dao = [ContatoDAO contatoDAOInstance];
    }
    return self;
}

-(void) viewDidLoad {
    [super init];
    
    UIBarButtonItem *botao = nil;
    
    // Se já possuir um contato, trata-se de uma edição, e não de um novo contato
    if(self.contato) {
        botao = [[UIBarButtonItem alloc] initWithTitle:@"Alterar" style:UIBarButtonItemStylePlain target:self action:@selector(altera)];
        self.navigationItem.title = @"Editar Contato";
    } else {
        botao = [[UIBarButtonItem alloc] initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target:self action:@selector(adiciona)];
        self.navigationItem.title = @"Novo Contato";
    }
    
    self.navigationItem.rightBarButtonItem = botao;
    
    if (self.contato){
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.endereco.text = self.contato.endereco;
        self.email.text = self.contato.email;
        self.site.text = self.contato.site;
    }
}

-(void) adiciona {
    // Cria um novo objeto
    self.contato = [Contato new];
    
    [self pegaDadosDoFormulario];
    [self.dao adicionaContato:self.contato];
    
    // Volta para a tela de listagem assim que adiciona o contato
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    // Avisa a lista
    [self.delegate contatoAdicionado:self.contato];
}

-(void) altera {
    [self pegaDadosDoFormulario];
    
    // Avisa a lista
    [self.delegate contatoAtualizado:self.contato];
    
    // Volta para a tela de listagem assim que adiciona o contato
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) pegaDadosDoFormulario {
    self.contato.nome = self.nome.text;
    self.contato.telefone = self.telefone.text;
    self.contato.endereco = self.endereco.text;
    self.contato.email = self.email.text;
    self.contato.site = self.site.text;
}

@end
