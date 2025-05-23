% Este é o formato da revista. Se buscas por qué tal cou cal cousa se ve como
% se ve, deberías mirar aquí. Intentei que esto estivese comentado na medida do
% posible, para facilitar o uso e modificación desto no futuro. Todo esto foi
% escrito de 0 por varios estudantes da facultade de física da universidade de
% Santiago de Compostela.  Se queres saber como contribuir, botalle un ollo ao
% arquivo README.md. Este é un proxecto libre, de uso e de responsabilidade. En
% ningún momento nos imos facer responsables se compilas esto e se che queima a
% CPU (dudo que pase).
%
% os comentarios con :FACER: están para usar con ferramentas como grep

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{revista}[2025/04/10 Clase para a revista de Fisica USC]

\LoadClass[11pt,a4paper,twoside]{extarticle}

% :FACER: buscar mellores tipografías
% Tipo de letra. Cortesía de LuaLaTeX. É extremadamente fácil:
\RequirePackage{fontspec}

% Tipografía monoespaciada
\setmonofont[
    Path      = ./fontes/LatinModern/,
    Extension = .otf,
]{lmmono10-regular}

% Tipografía Sans Serif
\setsansfont[
    Path      = ./fontes/LatinModern/,
    Extension = .otf,
]{lmsans10-regular}

% Tipografía xeral
\setmainfont[
    Path           = ./fontes/LatinModern/,
    Extension      = .otf,
    UprightFont    = *-regular,
    ItalicFont     = *-italic,
    BoldFont       = *-bold,
    BoldItalicFont = *-bolditalic,
]{lmroman10}
% A tipografía para as matemáticas seleccinámola logo de cargar o paquete
% 'unicode-math' máis abaixo. A cousa é que primeiro hai que cargar os paquetes
% de matemáticas e DESPOIS, unicode-math

% Esta é unha familia de fontes. Podemos activala facendo, dentro de parénteses
% { \FonteSimbolos bla bla bla ... }
% A peculiaridade é que esta fonte non ten letras, só símbolos. A idea é usala
% para sustituir as imaxes .PNG de cousas como mails,twitter,instagram, etc.
% Pra usar un símbolo so hai que copialo e pegalo nun entorno onde activásemos
% esta tipografía. Para buscar os iconos: https://www.nerdfonts.com/cheat-sheet
% É bastante posible que o editor que estedes usando non vos mostre o icono na
% pantalla correctamente. Non é problema, mentres sexa o icono correcto no PDF
% verase ben. Tamén é posible especificar o icono co seu código hexadecimal
% explícitamente, escribindo ^^^^eb2a Sí, os catro ^ son necesarios, 'eb2a' é o
% codigo hex.
\newfontfamily{\FonteSimbolos}[
    Extension   = .ttf,
    UprightFont = *-Regular,
    Path        = ./fontes/NerdFonts/,
]{SymbolsNerdFontMono}

% Usar galego (como debe ser)
\RequirePackage[galician]{babel}
% Usar babel pode fastidiar as citas con biblatex, asique hai que usar
% 'csquotes'
\RequirePackage{csquotes}

% :FACER: non temos un estilo concreto para a bibliografía
% Bibliografia
\RequirePackage[
    % style  = alphabetic,
    natbib = true,
]{biblatex}
\addbibresource{bibliografia.bib}

% Cores. En cada artigo usamos \definecolor{}{} pa coller o que queremos
\RequirePackage{xcolor}

% Graficos e tal. Se podes soñalo, podes facelo con TikZ
\RequirePackage{tikz}
\RequirePackage{wrapfig}
% para facer calculos cas posicions dos nodos, sumándolle cousas. Por exemplo,
% fixádevos que ás coordenadas (current page.west) 'súmaselle' (2.5,-5)
% \node[
%     rounded corners,
%     red!90,
%     draw,
%     regular polygon,
%     regular polygon sides=6,
%     minimum size=20 cm,
%     ultra thick
% ] at ($(current page.west)+(2.5,-5)$) {} ;
\usetikzlibrary{calc}

% Para poder usar os marxes de referencia para colocar nodos. Usase na portada
% con 'text area'. NOTA: xa non fai falta, pero deixoo aquí como informacion
% \RequirePackage{tikzpagenodes}

% Pa ter fondos con \AddToShipoutPictureBG, usase na contraportada
\RequirePackage{eso-pic}

% Pa ter alphas (transparencia), por exemplo no fondo do botafumeiro. Úsase o
% switch e.g. \transparent{0.3}
\RequirePackage{transparent}

% E pos codigos QR da contraportada, con \qrcode{}. Ralentizan moito a
% compilación
\RequirePackage{qrcode}

% Para recuadros, fondos, etc.
\RequirePackage{tcolorbox}

% Xeometria do documento. Na portada e na contraportada sobreescribimos a
% xeometría con \newgeometry e volvemos a esta con \restoregeometry
\RequirePackage{geometry}
\geometry{
    paper       = a4paper, % tamaño do papel
    top         = 20mm,    % marxe superior
    left        = 10mm,    % marxe esquerdo
    right       = 10mm,    % marxe dereito
    bottom      = 25mm,    % marxe inferior
    nomarginpar = true,    % desactivar marxe para notas
    % showframe,            % mostra estructura, moi util
}

% Esto é pa mostrar as box, hyphenation points, glues, etc. Útil para depurar
% \RequirePackage{lua-visual-debug}

% E xa que falamos de depuración, está o comando este pa mostrar todos os
% paquetes que se usan (implícita e explícitamente) e súas versións. Toda esa
% info gárdase no *.log, de cara ao final logo dunha liña que pon *File List*
% \listfiles

% Para colocar cousas en 2 (ou 3 ou 4...) columnas. É preferible á opcion da
% clase 'twocols' porque esa da moitísimos problemas no caso de que queiramos
% ter partes que non teñan 2 columnas. Aparte de que se pode configurar menos
\RequirePackage{multicol}
%\RequirePackage{enumitem}
% E aumentamos a separación entre as columnas
\setlength{\columnsep}{5mm}

% Pa cambiar interlineados no momento usando \setstrech{}
\usepackage{setspace}
\setlength\parindent{5mm} % tamaño da indentación

% Para graficos
\RequirePackage{graphicx}
% \RequirePackage{svg}

% Mates e todo eso
\RequirePackage{mathtools}  % mates xerais
\RequirePackage{amssymb}    % simbolos adicionais
\RequirePackage{amsthm}     % definir teoremas
\RequirePackage{diffcoeff}  % derivadas
\RequirePackage{esint}      % integrais diferentes
\RequirePackage{mathrsfs}   % letras reviradas \mathcal
\RequirePackage{polynomial} % polinomios simples
\RequirePackage{tensor}     % indices e eso
\RequirePackage{braket}

\RequirePackage{svrsymbols} % simbolos variados
\RequirePackage{adforn}     %

\RequirePackage{unicode-math}
% :FACER: escoller outra tipografia para as mates, esta non ten varios simbolos
% \setmathfont[
%     Path      = ./fontes/EulerMath/,
%     Extension = .otf,
% ]{Euler-Math}

% Para o índice
\RequirePackage{tocloft}    % Para modificar algunos valores de contentsline, espaciados etc
\RequirePackage{adjustbox}  % Para ajustar tablas
\RequirePackage{etoolbox}   % Para hacer condicionales
\RequirePackage{trimspaces}

% Esto pa cambiar facilmente o estilo das 'captions' das cousas. Queremos que
% este justificada. singlelinecheck=false: evita que LaTeX centre pies de una
% sola línea (por defecto, lo hace aunque hayas pedido justificación).
\RequirePackage{caption}
\captionsetup{
    font            = footnotesize,
    justification   = justified,
    skip            = 6pt,
    singlelinecheck = false,
    labelfont       = {bf,small},
    textfont        = {small}
}

% Uns paquetes varios que non organicei
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{comment}
\RequirePackage{lettrine}
\RequirePackage{ragged2e}
\RequirePackage[scr]{rsfso}
\RequirePackage{adjustbox}
\RequirePackage{ragged2e} % Para justificar minipages
\RequirePackage{float}
\RequirePackage[small, unboxed]{cwpuzzle}
\RequirePackage{soul}

% Encabezados e pe de paxina
% Pa facilitar a creacion cun par de comandos
\RequirePackage{fancyhdr}

% O comando pa xerar o logo onde sexa, pode usarse con \fontsize
\newcommand{\LogoM}{
    \begin{tikzpicture}
        \node[
            shape     = circle,
            draw      = Resalte,        % Hai que definir estas cores en cada
            fill      = Resalte,        % revista
            text      = TextoEnResalte, %
            inner sep = 0pt,
            radius    = 0.5,
            inner sep = 1pt,
        ]
        at (00.05,-0.05)
        {$\overrightarrow{m}$};
    \end{tikzpicture}
}

% Esto e pa poñer o logo do momento no encabezado
\renewcommand\headrule{
    \vspace{-6pt}
    \hrulefill
    \raisebox{-15pt}
    {\huge\quad\LogoM\quad}
    \hrulefill
}

% ESTILOS DE PÁXINA E ÍNDICES.
% Estos estilos cambian os encabezados das páxinas e engaden 
% os correspondetes indices dependendo dos artigos que haxa.

\newcommand{\definirEstiloEIndice}[2]{%
  \fancypagestyle{#1}{%
    \fancyhf{} % Limpa as cabeceiras e pés de páxina
    \renewcommand{\headrulewidth}{0.4pt} % Engade liña no cabeceiro
    \fancyhead[LE,RO]{\MakeUppercase{#2}} % Nome da sección
    \fancyfoot[LE,RO]{\thepage} % Páxina
    \fancyfoot[LO,RE]{\imprimeTitulo} % Título
    \renewcommand{\footrulewidth}{0pt} % Sen liña no pé de páxina
    \headsep = 1cm % Espazo no cabeceiro
    %\headsep = 1.5cm % Espazo no cabeceiro
  }
  \expandafter\newcommand\csname Indice#1\endcsname{%
    \begin{tikzpicture}%
      \node (c) at (5.5,0) {\textbf{#2}};%
      \draw[thick] (0,0) -- ([xshift=-5pt]c.west);%
      \draw[thick] ([xshift=+5pt]c.east) -- (11,0);%
    \end{tikzpicture}%
  }
}

% SECCIÓNS DA REVISTA.
% Engadir aquí novas seccións !!

\definirEstiloEIndice{divulgacion}{Divulgación}
\definirEstiloEIndice{historia}{Historia}
\definirEstiloEIndice{actualidadeFacultade}{Actualidade da Facultade}
\definirEstiloEIndice{actualidadeCientifica}{Actualidade Científica}
\definirEstiloEIndice{filosofia}{Filosofía}
\definirEstiloEIndice{profesorado}{Recuncho do Profesorado}
\definirEstiloEIndice{entrevistas}{Entrevistas}
\definirEstiloEIndice{programacion}{Programación}
\definirEstiloEIndice{pasatempos}{Pasatempos}
\definirEstiloEIndice{anuncios}{Anuncios}

\newcommand{\SeccionTOC}[1]{%
\csname Indice#1\endcsname
}

% Este macro pode invocarse con ou sen asterisco, ousexa \EngadeAoTOC*
% Co asterisco, aparte do titulo, tamén engade unha seccion ao TOC
%
% Argumentos:
%
% #1 (asterisco) crear unha seccion no TOC ou no
% #2 -> Nome do artigo
% #3 -> Nome do autor
% #4 -> Estilo da páxina (TIPO de artigo)
\NewDocumentCommand\EngadeAoTOC{ s m m m }{%
    % Primeiro, engadimos seccion ao TOC ou no? Depende de se o macro
    % se usou cun asterisco ou no
    \IfBooleanTF{#1}%
    {% No caso de usar asterisco, angadir unha seccion ao TOC
        \addtocontents{toc}{%
            \begingroup%
                \setlength{\parindent}{0pt}%
                \protect\SeccionTOC{#4}\protect\par%
            \endgroup%
        }%
    }%
    {% No caso de non telo, non engadir seccion ao toc
        \addtocontents{toc}{%
            \begingroup%
                \setlength{\parindent}{0pt}%
                \vspace{-5mm}%
            \endgroup%
        }
    }

    % Engadimos o nome do artigo
    \addcontentsline{toc}{section}{\protect{#2}}

    % Engadimos o nome do autor. Pa que quede ben metese nunha minipage
    \addtocontents{toc}{%
        % Definindo largura fixa para a minipage de texto com alinhamento
        % superior
        \begin{minipage}[t][.3cm][t]{9cm}
            % Ajuste fino para alinhar o resumo do texto com o topo da figura
            % (altere de acordo com o topo da figura)
            \protect{\small #3}%
            % Ajuste fino para alinhar o nome do autor do texto com el resumen
            \protect\vfill%
            % Ajuste fino para espaçamento entre figura e resumo e próximo
            % artigo do sumário
            \protect\vspace{1cm}%
            \protect%
        \end{minipage}
        \vfill
    }
    \addtocontents{toc}{\vspace{2em}}
}

% Un dos comandos máis importantes. Debe usarse ao comezo de cada artigo.
\NewDocumentCommand\Titular{ s m m m m }{%
    % #1: (asterisco). Poñelo engade seccion ao TOC
    % #2: nome do artigo,
    % #3: nome do autor,
    % #4: estilo da páxina, cambia os encabezados (e no futuro pode que mais
    %     cousas) A escoller entre:
    %     divulgacion,historia,actualidadeFacultade,actualidadeCientifica,
    %     filosofia,entrevistas,programacion,pasatempos,anuncios,profesorado
    % #5: subtítulo
    %
    % engadimos unha sección 'baleira'
    \phantomsection%
    % Mostramos o propio titular, como sempre
    \begin{center}
        \vspace*{-5mm}
        % Esto es para que cuando el texto ocupe más de dos líneas, se amplie
        \begingroup
            \setstretch{2}%
            \noindent{\color{Resalte}\Huge \textbf{#2}} \\ % TITULO
        \endgroup
        \vspace{3mm}
        {\Large #3} \\ % AUTOR
        \vspace{3mm}
        \textit{#5}  % SUBTITULO
        \vspace{-3mm}
    \end{center}
    % Comprobamos se o comando \Titular se usou con un asterisco ou no
    \IfBooleanTF{#1}% recordade que #1 é o asterisco do comando
        {% no caso de ter o asterisco, engadimos unha seccion ao TOC.
            \EngadeAoTOC*{#2}{#3}{#4}% metemoslle (#2)TITULO, (#3)AUTOR, (#4)ESTILO
        }%
        {% se non temos asterisco, non engadimos seccion
            \EngadeAoTOC{#2}{#3}{#4}%
        }
    % Aplicamos o estilo de páxina
    \pagestyle{#4}%
    % Aprobeito pa meter esto aquí. Resetea números nas ecuacións e
    % figuras
    \setcounter{equation}{0}
    \setcounter{figure}{0}
}

% Tipografia preciosa. Xoga cos espaciados moi ben para xustificar o texto.
\RequirePackage{microtype}

% Texto de proba.
% \RequirePackage{lipsum}

% :FACER: cores desto..?
\RequirePackage{hyperref}
\hypersetup{
    hidelinks,
    colorlinks,  % Colorear os links
    linkcolor = {Resalte!55!black},   % links internos
    citecolor = {green!45!black}, % citas bibliográficas
    urlcolor  = {blue!80!black}   % URLs e links externos
}

%% MACROS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter

% NUMERO
\def\Numero#1{\def\@Numero{#1}}
\newcommand{\imprimeNumero}{Núm.\@Numero}

% DATA
\def\Data#1{\def\@Data{#1}}
\newcommand{\imprimeData}{\@Data}

% Artigos. Orixinalmente pensamos en engadir o nomer dalgún (ou varios) artigo
% á portada. Deixoos aquí comentados polo pronto
%
% \def\PrimeiroArtigo#1{\def\@PrimeiroArtigo{#1}}
% \newcommand{\imprimePrimeiroArtigo}{\@PrimeiroArtigo}
% \def\SegundoArtigo#1{\def\@SegundoArtigo{#1}}
% \newcommand{\imprimeSegundoArtigo}{\@SegundoArtigo}
% \def\TerceiroArtigo#1{\def\@TerceiroArtigo{#1}}
% \newcommand{\imprimeTerceiroArtigo}{\@TerceiroArtigo}

% :FACER: este texto pode non verse se a imaxe da portada ten cores moi claras
% Tal vex deberíamos cambiar de sitio dito texto? Ou cambiarlle a cor? Máis
% macros?
%
% O texto que aparece na imaxe da portada
\def\ComentarioImaxePortada#1{\def\@ComentarioImaxePortada{#1}}
\newcommand{\imprimeComentarioImaxePortada}{\@ComentarioImaxePortada}
\ComentarioImaxePortada{}

% TITULO REVISTA
\newcommand{\imprimeTitulo}{MOMENTUM}
\newcommand{\FormateaTitulo}[1]{%
    {\color{#1}$\overrightarrow{\text{\textbf{M}}}$}\textbf{OMENTUM}%
}

% RUTA PARA A IMAXE DA PORTADA
\def\ImaxePortada#1{\def\@ImaxePortada{#1}}
\newcommand{\imprimeImaxePortada}{\@ImaxePortada}
\setlength{\headheight}{20pt} % :FACER: POR QUÉ ESTÁ ISTO AQUÍ??????

% PARTICIPANTES DO PROXECTO. Usase no índice, no lado dereito ca cor de resalte
\def\Participantes#1{\def\@Participantes{#1}}
\newcommand{\imprimeParticipantes}{\textcolor{TextoEnResalte}{\@Participantes}}
\Participantes{}

% Texto do indice que presenta a revista
\def\SobreMomentum#1{\def\@SobreMomentum{#1}}
\newcommand{\imprimeSobreMomentum}{\@SobreMomentum}
\SobreMomentum{}

% LINK para o REPOSITORIO
\def\LinkRepositorio#1{\def\@LinkRepositorio{#1}}
\newcommand{\imprimeLinkRepositorio}{\@LinkRepositorio}
\LinkRepositorio{DAF-USC/revista}

% CORREO
\def\Correo#1{\def\@Correo{#1}}
\newcommand{\imprimeCorreo}{\@Correo}
\Correo{revistafisicausc@gmail.com}

% Texto de DESPEDIDA, na contraportada
\def\Despedida#1{\def\@Despedida{#1}}
\newcommand{\imprimeDespedida}{%
\begin{center}%
\Huge Un Momentum!\par%
\end{center}%
\vspace{1.1\baselineskip}
\@Despedida}%
\Despedida{}

% AGRADECEMENTOS, na contraportada
\def\Agradecementos#1{\def\@Agradecementos{#1}}
\newcommand{\imprimeAgradecementos}{%
\begin{center}%
\Large Agradecementos:\par%
\end{center}%
\@Agradecementos}
\Agradecementos{}

% Link para o DRIVE
\def\EdicionsAnteriores#1{\def\@EdicionsAnteriores{#1}}
\newcommand{\imprimeEdicionsAnteriores}{\@EdicionsAnteriores}
\EdicionsAnteriores{https://www.usc.gal/gl/centro/facultade-fisica/revista-estudantil-momentum}

% Link para o grupo de WHATSAPP
\def\WhatsApp#1{\def\@WhatsApp{#1}}
\newcommand{\imprimeWhatsApp}{\@WhatsApp}
\WhatsApp{https://chat.whatsapp.com/E900g1Bq7QT5ZKeuiIpxTk}

% CORES de resalte. Non fai falta definir estos comandos, pero así podemos usar
% na revista '\CorResalte{ff0000}' en vez de
% '\definecolor{Resalte}{HTML}{ff0000}'. Algo máis limpo. Ollo, hai que meter o
% de \hypersetup aquí para que as cores dos links cambien en cada revista. Na
% clase, definimos as cores (nunhas liñas máis adiante), e se non metesemos o
% hypersetup no macro este, na revista non poderíamos cambiar as cores dos
% links
\newcommand{\CorResalte}[1]{%
    \definecolor{Resalte}{HTML}{#1}%
    \hypersetup{linkcolor = {Resalte!55!black}}%
}%

\newcommand{\CorTextoEnResalte}[1]{
    \definecolor{TextoEnResalte}{HTML}{#1}
}

% Inicializo as coreas agora. En cada artigo é necesario cambialas cos macros anteriores
\definecolor{Resalte}{HTML}{ff0000}
\definecolor{TextoEnResalte}{HTML}{ffffff}

\makeatother
% Todos esos comandos teñen a info da revista. Gardase o valor nunha variable,
% e imprimese no PDF con outro comando diferente. Esto da bastante
% flexibilidade

% En cada revista hai que usar estos comandos ao comezo.
%
% \Numero{001}
% \Data{Xaneiro do 1900}
% \ImaxePortada{./revistas/001/imaxes/cern.png}
% \ComentarioImaxePortada{ Imaxe da portada }
% \CorResalte{ff0000} % cores especificos de cada revista, con codigos HTML hex
% \CorTextoEnResalte{000000}
% \LinkRepositorio{ guthib.com }
% \Correo{ correo@correo.correo }
% \SobreMomentum{ Esta é a revista momentum! }
% \Participantes{
%     {\Large \textbf{Dirección:}}     \\[0.5cm]
%         Carl Sagan                   \\[0.2cm]
%     {\Large \textbf{Edición}}        \\[0.5cm]
%         Albert Einstein              \\[0.2cm]
%     {\Large \textbf{Diseño de Logo}} \\[0.5cm]
%         Dirac                        \\[0.2cm]
% }
% \Despedida{ Adeus! }
% \Agradecementos{ Grazas a Todos! }
% \Drive{ https://linkaodrive.com }
% \WhatsApp{ https://link grupo whatsapp }

% Os comandos anteriores definen as variables. Pa mostralas no pdf hai que usar:
%
% \imprimeTitulo          Titulo da revista
% \imprimeNumero          Numero da revista
% \imprimeData            Data de creacion
% \imprimeImaxePortada    ruta para a imaxe de portada, debe especificarse en cada revista
% \color{Resalte}         Para colorear cousas ca cor específica de cada revista
% \color{TextoEnResalte}  Para colorear texto que esté sobre fondo ca cor do resalte
% \imprimeParticipantes   Nomes dos participantes
% \imprimeSobreMomentum
% \imprimeLinkRepositorio
% \imprimeDespedida
% \imprimeAgradecementos
% \imprimeDrive
% \imprimeWhatsApp

% :FACER: remirar estos conteos...
% \pagenumbering{arabic}\setcounter{page}{1}


% outros macros e definicions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% para os diferenciais inexactos
\newcommand*{\dbar}{\ensuremath{\text{\dj}}}