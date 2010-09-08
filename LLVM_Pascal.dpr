program LLVM_Pascal;
{
Author: Wanderlan Santos dos Anjos, wanderlan.anjos@gmail.com
Author: Barbara A.B. dos Anjos, barbara.ab.anjos@gmail.com
Author: Paulo Guilherme Freire, freire.brasilia@gmail.com
Date: apr-2010
License: <extlink http://www.opensource.org/licenses/bsd-license.php>BSD</extlink>
Based on Dragon Book
}
{$APPTYPE CONSOLE}

uses
  SysUtils, Parser;

var
  Parser : TParser;

procedure CompilePath(Path : string);
var
  F : TSearchrec;
begin
  try
    if FindFirst(Path, faAnyFile, F) = 0 then
      repeat
        Parser.Compile(ExtractFilePath(Path) + F.Name);
      until FindNext(F) <> 0;
  finally
    FindClose(F)
  end;
end;

procedure CompileTree(Tree : string);
var
  Path, Ext : string;
  F : TSearchrec;
begin
  if pos('*', Tree) <> 0 then begin
    Path := ExtractFilePath(Tree);
    Ext  := ExtractFileName(Tree);
    writeln(^J, Path); 
  end;
  CompilePath(Tree);
  if pos('*', Tree) <> 0 then begin
    try
      if FindFirst(Path + '*', faDirectory, F) = 0 then begin
        while pos('.', F.Name) <> 0 do
          if FindNext(F) <> 0 then exit;
        repeat
          if pos('.', F.Name) = 0 then CompileTree(Path + F.Name + PathDelim + Ext);
        until FindNext(F) <> 0;
      end;
    finally
      FindClose(F)
    end;
  end;
end;

begin
  writeln('LLVM-Pascal Version 2010.9 pre-Alpha scanner/parser');
  writeln('(c)2010 by'^J,
          'Wanderlan Santos dos Anjos, Barbara A.B. dos Anjos and Paulo Guilherme Freire'^J,
          'New BSD license'^J,
          'http://llvm-pascal.googlecode.com'^J);
  Parser := TParser.Create(300);
  try
    CompileTree(ParamStr(1));
  finally
    Parser.Free;
    readln;
  end;
end.
