LLVM-Pascal 2010.9.24 Pre-Alpha IV

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
- "Compila" ~148 klps (mil linhas por segundo) em um Intel E2200 Dual Core II 2.2 GHz com 2 GB de RAM e Windows XP SP3, 
   compilado com Turbo Delphi, com FPC 2.4 ~98 klps.
- Parte dessa diferen�a se refere �s fun��es Pos, PosEx, UpperCase e LowerCase que s�o usadas no compilador, 
  que em Delphi s�o implementadas em Assembly e em FPC s�o implementadas em Pascal.
- O LLVM-Pascal substitui essas fun��es, apenas se compilado com FPC, por vers�es otimizadas em Pascal do site FastCode, 
  o FPC ent�o vai para ~118 klps e o Turbo Delphi para ~147 klps usando FastCode.
- A performance n�o � t�o boa (~95 klps) em Delphi 2009/2010/XE, pois nosso compilador � baseado em AnsiStrings e n�o em Unicode, gerando muita convers�o na VCL. 
- "Compile" seu projeto com LLVM-Pascal e reporte suas quest�es no f�rum: http://groups.google.com/group/llvm-pascal

Para "compilar" use:
LLVM_Pascal *.pas


linha de comando para compara��o de performance: LLVM_Pascal "C:\Arquivos de programas\Borland\BDS\4.0\source\*.pas" -fi"C:\Arquivos de programas\Borland\BDS\4.0\source\dunit\contrib\dunitwizard\source\common\" -v1 -vmE130,E139