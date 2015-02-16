#!/usr/bin/perl 
#
# USE, EDITE, COMPILE. MAS SEMPRE DISTRIBUA O CÓDIGO FONTE!
# CONHECIMENTO DEVE SER LIVRE E DE TODOS! 
#
# CODED BY: HackerOrientado
# sigam no twitter -> @HackerOrientado
# Facebook -> facebook.com/CalsEvolution
# Página Ciência Hacker -> facebook.com/CienciaHacker
# Grupo Ciência Hacker -> facebook.com/groups/cienciahacker/
# 
# SEJA UM ETHICAL HACKING
#

use strict;
use warnings;
use WWW::Mechanize;
use utf8;
use Getopt::Long;

binmode(STDOUT, ":utf8"); # CODE PARA SAÍDA utf8

system 'clear'; # LIMPA A TELA

my ( $opt, $info, $url, $post, $baner, $site, $file ); # DECLARAÇÃO DE VIARIÁVEIS 
$baner = "
██████╗ ██╗   ██╗██████╗  █████╗ ███████╗███████╗     ██████╗██╗      ██████╗ ██╗   ██╗██████╗ ███████╗██╗      █████╗ ██████╗ ███████╗
██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝    ██╔════╝██║     ██╔═══██╗██║   ██║██╔══██╗██╔════╝██║     ██╔══██╗██╔══██╗██╔════╝
██████╔╝ ╚████╔╝ ██████╔╝███████║███████╗███████╗    ██║     ██║     ██║   ██║██║   ██║██║  ██║█████╗  ██║     ███████║██████╔╝█████╗  
██╔══██╗  ╚██╔╝  ██╔═══╝ ██╔══██║╚════██║╚════██║    ██║     ██║     ██║   ██║██║   ██║██║  ██║██╔══╝  ██║     ██╔══██║██╔══██╗██╔══╝  
██████╔╝   ██║   ██║     ██║  ██║███████║███████║    ╚██████╗███████╗╚██████╔╝╚██████╔╝██████╔╝██║     ███████╗██║  ██║██║  ██║███████╗
╚═════╝    ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝     ╚═════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
 ██████╗██╗███████╗███╗   ██╗ ██████╗██╗ █████╗     ██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗                                    
██╔════╝██║██╔════╝████╗  ██║██╔════╝██║██╔══██╗    ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗                                   
██║     ██║█████╗  ██╔██╗ ██║██║     ██║███████║    ███████║███████║██║     █████╔╝ █████╗  ██████╔╝                                   
██║     ██║██╔══╝  ██║╚██╗██║██║     ██║██╔══██║    ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗                                   
╚██████╗██║███████╗██║ ╚████║╚██████╗██║██║  ██║    ██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║                                   
 ╚═════╝╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝                                   
                                                                                                    v1.0";

$opt = GetOptions ( # CODE PARA ARGUMENTO "-info" 
    'info'     => \$info,
);

if ( $info ) { # SE "info" IRÁ RETORNAR A SUB ROTINA "info()"
    return info();
}

$url = "http://www.crimeflare.com/cfs.html"; # SITE PARA FUTURO "get"
$post = WWW::Mechanize->new(); # INICIO DO Mechanize

print "Estabelecendo conexão com o servidor externo...\n";

$post->get ( $url ); # EMTRANDO NO SITE

if ( $post ) { # VERIFICAÇÃO CASO O SITE TENHA SIDO RETORNADO
    print "Conexão estabelecida :D\n";
    sleep 2.5;
    system 'clear';
    print $baner;
    print "\n\n";
}

print "Digite um site para saber se ele possue CloudFlare e 'Bypassear' ele, descobrindo o verdadeiro IP do site.\n";
print "-> ";
$site = <STDIN>; chomp $site; # ENTRADA DO USUÁRIO

if ( $site !~ /www./ ) { # VERIFICAÇÃO SE A ENTRADA DO USUÁRIO CONTÉM O "www." CASO NÃO TENHA ELE IRÁ ADICIONAR AUTOMATICAMENTE
    $site = "www.".$site;
}

print "\n";

$post->field('cfS', $site); # COLAGEM DA ENTRADA DO USUÁRIO NO CAMPO DE DIGITAÇÃO DO SITE
$post->submit(); # ENVIO DO FORMULÁRIO
print $post->dump_text(); # PEGA TUDO QUE FOR TEXTO DO SITE E O 'PRINTA' NA TELA
print "\n";

$file = $post->content(format => 'text'); # CRIAÇÃO DE UMA VARIÁVEL PARA PEGAR O TEXTO E COLAR EM UM ARQUIVO DE TEXTO

open FILE, ">CFBypass.txt"; # CRIAÇÃO DO ARQUIVO DE TEXTO 
print FILE $file; # COLAGEM DO RESULTADO DA PESQUISA NO SITE NO ARQUIVO TXT 
close FILE; # FECHAMENTO DO ARQUIVO TXT

sub info { # SUB ROTINA PARA INFORMAÇÃO DO QUE SE TRATA O SCRIPT
    print $baner;
    print "\n\n";
    print "\t[\?] O Bypass CloudFlare é um script feito para verificar se um determinado site utiliza-se desse serviço.\n\n";
    print "\t[\?] O CloudFlare é um serviço que esconde o IP real do site impedindo assim uma série de ataques ao site, como ataques DoS ou DDoS\n\n";
    print "\t[\?] Este script foi feito usando o módulo WWW::Mechanize, simulando assim um navegador browser e simplesmente se utilizando do serviço de terceiros\n\n";
    print "\t[\?] O site em que o script acessa é o www.crimeflare.com\n\n";
    print "\t[\?] Se quiser saber mais entre no site e veja melhor o que é CloudFlare e como o www.crimeflare.com funciona\n\n";
    exit (0);
}

# EoF #