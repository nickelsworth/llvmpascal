LLVM-Pascal 2010.9.21 Pre-Alpha III

Principal implementa��o deste release: Scanner e Parser

Home: http://llvm-pascal.googlecode.com
Forum: http://groups.google.com/group/llvm-pascal
License: BSD, http://www.opensource.org/licenses/bsd-license.php

- Por enquanto a "compila��o" s� faz an�lise l�xica e sint�tica.
- Compil�vel com qualquer Delphi at� vers�o XE e Free Pascal 2.4.
- Fonte extremamente pequeno e simples usando Orienta��o a Objetos com Object Pascal.
- "Compila" fontes do dialeto Delphi at� a vers�o XE, n�o suporta operator overload no dialeto Delphi.
- "Compila" fontes do Lazarus at� a vers�o 0.9.28.2 e Free Pascal at� a vers�o 2.4, 
   suporta macros, generics, operator overload e literais bin�rios.
- "Compila" ~123 klps (mil linhas por segundo) em um Intel E2200 Dual Core II 2.2 GHz com 2 GB de RAM e Windows XP SP3, 
   compilado com Turbo Delphi, com FPC 2.4 ~50 klps.
- Essa diferen�a se refere �s fun��es Pos() e PosEx() que s�o extensivamente usadas no compilador, 
  que em Delphi s�o implementadas em Assembly e em FPC s�o implementadas em Pascal.
- O LLVM-Pascal substitui essas fun��es, apenas se compilado com FPC, por vers�es otimizadas em Pascal do site FastCode, 
  o FPC ent�o vai para ~90 klps e o Turbo Delphi para ~120 klps usando FastCode.
- A performance n�o � t�o boa (~75 klps) em Delphi 2009/2010/XE e as rotinas Pascal do FastCode n�o funcionam nessas vers�es do Delphi. 
- A manipula��o de strings nas vers�es Unicode do Delphi parece ter piorado consideravelmente... :(
- "Compile" seu projeto com LLVM-Pascal e reporte suas quest�es no f�rum: http://groups.google.com/group/llvm-pascal

Para "compilar" use:
LLVM_Pascal *.pas


linha de comando para compara��o de performance: llvm_pascal"C:\Arquivos de programas\CodeGear\RAD Studio\6.0\source\*.pas" -se1000 -v1