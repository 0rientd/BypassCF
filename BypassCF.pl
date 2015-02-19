#!/usr/bin/perl 
#
# USE, EDITE, COMPILE. MAS SEMPRE DISTRIBUA O CÓDIGO FONTE!
# CONHECIMENTO DEVE SER LIVRE E DE TODOS! 
#
# CODED BY: HackerOrientado
#
# Me sigam no twitter -> @HackerOrientado
# Facebook -> facebook.com/CalsEvolution
# Página Ciência Hacker -> facebook.com/CienciaHacker
# Grupo Ciência Hacker -> facebook.com/groups/cienciahacker/
# Página no Facebook do Inurl Brasil -> facebook.com/InurlBrasil
# Blog Inurl Brasil -> blog.inurl.com.br/
#
# Obrigado ao GoogleINURL e ao @7mm5l pela força que me deram com a regex
#

use strict;
use warnings;
use WWW::Mechanize;
use utf8;
use Getopt::Long;

binmode(STDOUT, ":utf8"); # CODE PARA SAÍDA utf8

system 'clear'; # LIMPA A TELA

my ( $baner, $opt, $info, $url, $post, $site, $file, $conteudo, $ipreal ); # DECLARAÇÃO DE VIARIÁVEIS 

$post = WWW::Mechanize->new(); # INICIO DO Mechanize
$url = "http://www.crimeflare.com/cfs.html"; # SITE PARA FUTURO "get"
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
                                                                                                    v1.1";

$opt = GetOptions ( # CODE PARA ARGUMENTO "-info"
    'info'     => \$info,
);

if ( $info ) { # SE "info" IRÁ RETORNAR A SUB ROTINA "info()"
    return info();
}

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

#########################

print "Estabelecendo conexão com o servidor externo...\n";

$post->get ( $url ); # EMTRANDO NO SITE

if ( $post ) { # CASO O SITE RETORNE '200 OK' ELSE VAI SEGUIR
    print "Conexão estabelecida :D\n";
    sleep 2;
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

if ( $site !~ /www./ ) { # VERIFICAÇÃO SE A ENTRADA DO USUÁRIO CONTÉM O "www." CASO NÃO TENHA ELE IRÁ ADICIONAR AUTOMATICAMENTE
    $site = "www.".$site;
}
chomp $site;
    
$post->field('cfS', $site); # COLAGEM DA ENTRADA DO USUÁRIO NO CAMPO DE DIGITAÇÃO DO SITE
$post->submit(); # ENVIO DO FORMULÁRIO
print "\n";

$file = $post->content(format => 'text'); # CRIAÇÃO DE UMA VARIÁVEL PARA PEGAR O TEXTO E COLAR EM UM ARQUIVO DE TEXTO

open FILE, ">CFBypass.txt"; # CRIAÇÃO DO ARQUIVO DE TEXTO
print FILE $file; # COLAGEM DO RESULTADO DA PESQUISA NO SITE NO ARQUIVO TXT 
close FILE; # FECHAMENTO DO ARQUIVO TXT

if ( $post -> content =~ /aborted/ ) {
    print "Provavelmente o servidor não se utiliza dos serviços do CloudFlare";
    print "\n";
} elsif ( $post -> content =~ /Sorry, but the domain name is too short/ ) {
    print "Ops, algo deu errado...\n";
    print "Verifique o arquivo CFBypass.txt para saber mais sobre o erro\n";
    exit (0);
} else {
    open (ARQ, "<CFBypass.txt") or die "Nao foi possivel abrir o arquivo :/";
    $conteudo = <ARQ>;

    print "----------------------------\n";
    print "Parece que foi encontrado o verdadeiro IP do site :D\n\n";

    if ( $conteudo =~ /(\d{1,9}\.\d{1,9}\.\d{1,9}\.\d{1,9})/ ) {
        print "[\!] IP real do IP/HOST $site: $1 [\!]";
    }
        
    print "\n\n";
    print "Será criado um arquivo .txt que terá mais informações sobre o servidor\n";
    print "Será também criado um arquivo contendo as informações sobre a localização do IP/HOST\n\n";

    $post->get ("http://www.telize.com/geoip/".$1);
    $conteudo = $post->content(format => 'text');

    open (ARQ, ">GeoIP-Bypass.txt") or die "Não foi possível criar o arquivo txt\n";
    print ARQ $conteudo;
    close ARQ;
    exit (0);
}

# EoF #