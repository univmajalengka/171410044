program Scanner;

uses crt;

type
	TokenType = ( tNone,			{tipe-tipe token}
			tIdentifier,
			tInteger,
			tReal,
			tCharConstant,
			tString,
			tPlus,
			tMin,
			tMult,
			tDiv,
			tAssignment,
			tTitikDua,
			tRange,
			tKoma,
			tTitik,
			tTitikKoma,
			tEqual,
			tInequal,
			tLess,
			tLessEqu,
			tGreater,
			tGreaterEqu,
			tKurungSikuBuka,
			tKurungSikuTutup,
			tKurungBuka,
			tKurungTutup,
			tKeyAND,		{keyword}
			tKeyARRAY,
			tKeyBEGIN,
			tKeyCASE,
			tKeyCONST,
			tKeyDIV,
			tKeyDO,
			tKeyDOWNTO,
			tKeyELSE,
			tKeyEND,
			tKeyFILE,
			tKeyFOR,
			tKeyFUNCTION,
			tKeyGOTO,
			tKeyIF,
			tKeyIN,
			tKeyLABEL,
			tKeyMOD,
			tKeyNIL,
			tKeyNOT,
			tKeyOR,
			tKeyOF,
			tKeyPACKED,
			tKeyPROCEDURE,
			tKeyPROGRAM,
			tKeyRECORD,
			tKeyREPEAT,
			tKeySET,
			tKeyTHEN,
			tKeyTO,
			tKeyTYPE,
			tKeyUNTIL,
			tKeyVAR,
			tKeyWHILE,
			tKeyWITH
	);

ScanErrorType = ( errNone,			{Tipe-tipe error}
			errScanUnexpChar,
			errScanFloat,
			errScanInt,
			errScanApostExp,
			errScanUnexpEOF
		);


CONST
	EndFile = #26;
JmlKeyword = 40;
Keyword : ARRAY [1..JmlKeyword] of string[9]= (
'AND',      'ARRAY', 'BEGIN',   'BOOLEAN', 'CASE',
'CONST',    'CHAR',  'DIV',     'DO',      'DOWNTO',
'ELSE',     'END',   'FILE',    'FOR',
'FUNCTION', 'GOTO',  'IF',      'IN',
'INTEGER',  'LABEL', 'MOD',     'NIL', 	   'NOT',
'OF',       'OR',    'PACKAGE', 'PROCEDURE',
'PROGRAM',  'REAL',  'RECORD',  'REPEAT',  'SET',
'STRING',   'THEN',  'TO',      'TYPE',    'UNTIL',
'VAR',      'WHILE', 'WITH'
);

eMax		= 38;		{Eksponen maksimal}
eMin		= -38;		{Eksponen minimal}
JmlSigDgt	= 5;		{Jumlsh digit yang signifikan}
ValMax		= 16383;	{2**14-1}
MaxInfo		= 128;

VAR
 ScanStr	: STRING;
 Token		: TokenType;
 inum		: LONGINT;
 rnum		: REAL;
 CC		: CHAR;

{ Nama file program sumber, dan file keterangan hasil kompilasi }
FileSource, FileRes : STRING;
{ File program sumber, dan file keterangan hasil kompilasi }
InFile, ResFile : TEXT;
ErrCounter : Integer;
LineCounter : Integer; { Baris yang sedang diproses }

lokasi : ARRAY {1..MaxInfo} of STRING;
jinfo : integer;

(************* PROSEDURE-PROSEDURE PENDUKUNG *************)

FUNCTION OpenFile:BOOLEAN;
{fungsi operasi file}
VAR i: Integer;
 Open1,Open2 : BOOLEAN;
Begin
	writeln; write('File will be parsed (.PAS) : ');
	readln(FileSource);
	i:=POS('.',FileSource);
If i<>0 Then FileSource:=copy(FileSource,1,i-1);

OpenFile:=True;
{$I-}
assign(InFile,FileSource+'.PAS');
reset(InFile);
{$I+}
if IOResult<>0 then
Begin
	writeln('File ',FileSource,' .PAS doesn''t exist...');
	OpenFile:=False;
end
else
begin
	{$I-}
	assign(ResFile,FileRes+'.TXT');
	rewrite(ResFile);
	{$I+}
	if IOResult<>0 then
	begin
		writeln(FileRes,'.TXT can''t be made...');
	end
end;
end;

function UpperCase(Str:string):string;
{ fungsi untuk mengubah kenhuruf kapital }
VAR
	i:integer;
begin
	for i:=1 to length(Str) do
	    Str[i]:=UpCase(Str[i]);
	UpperCase:=Str;
End;

Procedure Incline(var LineCounter : Integer);
{ Menampilkan nomor baris yang sedang diproses }
Begin
	gotoxy(1, WHEREY);
	LineCounter:=LineCounter+1;
	write('Processing line : ',LineCounter);
End;

Procedure ProsErr(err:ScanErrorType);
{ Prosedur penanganan kesalahan/error }
Begin
	gotoxy(25,WHEREY);
	write('*Error : ');
	Case  err Of
	errScanUnexpChar : begin write('Unexpected character',CC);
	End;
	errScanApostexp : Write(#39' expected ');
	errScanUnexpEOF : begin write('Unexpected End of File ');
	readln;
	halt;
	end;
	errScanFloat	: write('Floating point format error');
	errScanInt	: write('Integer value error ' );
end;
readln;
end;

procedure WriteFile;
{ Penulisan hasil scanning ke file keterangan }
var
	i	: integer;
	adainfo	: boolean;
begin
	write (ResFile,'     ');
	write (ResFile,Ord(Token):2);
	write (ResFile,'	');
	Case Token of
	tIdentifier :
 Begin
adainfo := false;
i:=0;
repeat
i:=i+1;
if lokasi[1]=ScanStr then adainfo := true;
until (adainfo) and (i>jinfo);
if (not adainfo) and (jinfo<maxinfo) then
begin
	jinfo:=jinfo+1;
	lokasi[jinfo]:=ScanStr;
	write(ResFile,jinfo:4);
end
else
	write(ResFile,i:4);
	write (ResFile,'	'+ScanStr);
end;
tInteger :
begin
	if (jinfo<maxinfo) then
	begin
		jinfo:=jinfo+1;
		lokasi[jinfo]:=ScanStr;
		write(ResFile,jinfo:4);
	end;
	write(ResFile,'		');
	write(ResFile, inum);
end;

tReal :
begin
	if (jinfo<maxinfo) then
	begin
		jinfo:=jinfo+1;
		lokasi[jinfo]:=ScanStr;
		write(ResFile,jinfo:4);
	end;
	write(ResFile,'		');
	write(ResFile,rnum);
  end;
tCharConstant, tString :
  Begin
	if (jinfo<maxinfo) then
	begin
		jinfo:=jinfo+1;
		lokasi[jinfo]:=ScanStr;
		write(ResFile,jinfo:4);
		write(ResFile,'		');
		write(ResFile,ScanStr);
	end;
  end;
else
begin
		write(ResFile,0:4);
		write(ResFile,'		');
		write(ResFile,ScanStr);
	end;
    end;
writeln(ResFile, ' ');
end;

(************* PROSEDURE SCAN *************)

procedure scan;
const
	space 	= #32;
	tab	= #9;
	cr	= #13;
	lf	= #10;

var 	AdaToken	: boolean;
	i,j,k,e		: integer;
	KeyToken	: TokenType ABSOLUTE k;
	TampStr		: string;
	Error		: ScanErrorType;
	Ex, Comment	: boolean;

	procedure GetExp;
	{ prosedure yang memberikan eksponen / bilangan di belakang 'e'|'E' }
	VAR
        pangkat, sign: Integer;
	begin
	  sign:=1;
          pangkat:=0;
	ReadChar; { Get Char after E|e}
	IF CC IN ['+','-'] then
 begin
	IF CC='-' then sign:=-1;
	ReadChar;
end;
IF NOT (CC IN ['0'..'9']) THEN Error:=errScanFloat
ELSE {there is a numeric char after E|e}
begin
   repeat
	pangkat:=10*pangkat+ORD(CC)-ORD('0');
	ReadChar;
   UNTIL NOT (CC IN ['0'..'9']);
   e:=e+pangkat*sign; {pangkat desimal total suatu bilangan real }
end;
end;

procedure KonverToReal;
{ Prosedur untuk memperoleh bil. real dalam format desimal berkoma }
var s: integer;
  d,t: real;
begin
	if k+e>eMax then Error:=errScanFloat
	else
	   if k+e<eMin then rnum:=0 { bilangan terlalu kecil, jadikan 0 }
	else
	begin
		s:=abs(e); t:=1.0; d:=10.0;
		repeat
			while not ODD(s) do
			begin s:=s DIV 2; d:=sqr(d); end;
			s:=s-1; t:=d*t;
		until s=0;
		if e>=0 then rnum:=rnum*t else rnum:=rnum/t;
	end;
end;

begin {scan}
 AdaToken := false;
 while CC IN [CR, LF, TAB, SPACE] DO
begin
	if CC=LF then IncLine(LineCounter);
	ReadChar; { Skip WhiteSpace}
end;
	{ CC NOT IN WhiteSpace }
	IF CC=EndFile then exit; {Ketemu EOF}
	{CC bukan EOF}
	CASE CC OF
		'a'..'z','A'..'Z': { Identifier}
begin
	ScanStr:=' ';
	repeat
		ScanStr:=ScanStr+CC;
		ReadChar;
	UNTIL NOT (CC IN ['a'..'z','A'..'Z','0'..'9','_']);
	{ Test keyword }
	TampStr:=UpperCase(ScanStr);
	i:=1; j:=JmlKeyword; { Index untuk pencarian dalam table )
	repeat
		k:=(i+j) DIV 2;
		if TampStr<=KeyWord[k] then j:=k-1;
		if TampStr>=KeyWord[k] then i:=k+1;
	UNTIL i>j;

	if i-j>1 then
	begin k:=k+ORD(tKurungTutup); Token := KeyToken; end
	else
	begin Token := tIdentifier;
	ScanStr:= COPY (ScanStr,1,10); END;
	end; { Identifier }

   '0'..'9':{ konstanta numerik }
   begin
	k:=0; inum:=0; Token:=tInteger;
	repeat
		inum:=inum*10 + ORD(CC) - ORD('0');
		k:=k+1;
		ReadChar;
	UNTIL NOT (CC IN ['0'..'9']);
	{ Uji error numerik }
	if (k>JmlSigDgt) or (inum>ValMax) then ( bilangan melebihi batas)
	begin Error:=errScanInt; k:=0; inum:=0; end;
	
	if CC='.' then { real atau range }
	begin
		ReadChar;
		if CC='.' then { range }
		begin ScanStr:='..'; ( CC:=':'; ) end
		else { real }
		begin
			if NOT (CC IN ['0'..'9']) then { setelah bukan angka }
		begin
			Error:=errScanFloat;
			IF CC IN ['e','E'] then GetExp;
		end
		else
		begin
			Token:=tReal; rnum:=inum; e:=0;
			repeat
		e:=e-1; { untuk menentukan posisi titik bilangan real }
		rnum:=rnum*10 + ORD(CC) - ORD('0');
		ReadChar;
	UNTIL NOT (CC IN ['0'..'9']);
	if CC IN ]'e','E'] then GetExp;
	if (Error<>errScanFloat) and (e<>0) then konverToReal;
	end;
end; { Real }
end
else { CC<>'.' }
	if CC IN ['e'.'E'] then { untuk bentuk spt 1E+2 }
	begin
		Token:=tReal; rnum:=inum; e:=0 getExp;
		if ((Error<>errScanFloat) and (e<>0)) then KonertoReal;
	end;
end; { end konstanta numerik }

'(': {komentar1 atau kurung buka }
 begin
	ScanStr:=CC;
	ReadChar;
	if CC<>'*' then Token:=tKurungBuka
	else { '(*', komentar, harus dibuang }
	begin
		comment:= true;
		ReadChar;
		if CC<>EndFile then
		begin
 	 		repeat
				while not (CC IN ['*',EndFile]) do
				begin
					if CC=LF then Incline(LineCounter);
					ReadChar; { skip }
				end;
				{ CC='*' atau CC=EOF }
				if CC='*' then ReadChar;
				if CC=LF then IncLine(LineCounter);
			UNTIL CC IN [')',EndFile];

			if CC=')' then ReadChar else
			Error:=errScanUnexpEOF;
			end
			else Error:=errScanUnexpEOF;
		end;
	end; { end komentar 1 }

  '(': { komentar 2 }
	begin
		comment:=true;
		repeat
			ReadChar;
if CC=LF then IncLine(LineCounter);
UNTIL CC IN ['}', EndFile];
if CC='}' then ReadChar else Error:=errScanUnexpEOF;
end; { komentar 2 }

'''': { string literal atau konstanta karakter }
	begin
		ScanStr:=''; ex:=false;
		while not ex do
		begin
			repeat 	
				ScanStr:=ScanStr+CC;
				ReadChar;
			UNTIL (CC IN ['''',LF,EndFile]);
			if CC IN [LF, EndFile] then
			begin
				ex:=true;
				if CC=LF then
				begin
				  IncLine(LineCounter);
		Error:=errScanApostExp;
				end
				else Error:=errScanUnexpEOF;
			end
			else (')
			begin
				ScanStr:=ScanStr+CC;
				ReadChar;
				if CC<>'''' then ex:=true;
			end;
			end;
			if not (Error In [errScanApostExp,errScanUnexpEOF]) then
			begin { konstanta string atau karakter }
				delete(ScanStr,length(ScanStr),1);
				delete(ScanStr,1,1);
				if length(ScanStr)>1 then Token:=tString
				else
				begin inum:=ORD(ScanStr[1]);
	Token:=tCharConstant; End;
			end;
		end; { string literal atau konstanta karakter }

   ':' : { titik dua
	begin
		ScanStr:=CC;
		ReadChar;
		if CC='=' then {assignment}
		begin
			Token:=tAssignment; ScanStr:=ScanStr+CC;
		ReadChar;
			end
			else
				if ScanStr='..' then Token:=tRange
			else Token:=tTitikDua
		end; { titik dua }

	'<' : { lebih kecil, kecil sama, tidak sama }
		begin
		ScanStr:=CC;
		ReadChar;
		if CC='=' then
		begin Token:=tLessEqu; ScanStr:=ScanStr+CC;
		ReadChar; end
		else
			if CC='>' then
			begin
				Token:= tInequal; ScanStr:=ScanStr+CC;
		ReadChar;
			end
			else Token:=tLess;
		end; { lebih kecil, kecil sama, tidak sama }

	'>' : { lebih besar, besar sama }
		begin
			ScanStr:=CC;
			ReadChar;
			if CC='=' then
			begin
				token:=tGreaterEqu; ScanStr:=ScanStr=CC
			ReadChar;
			end
			else Token:=tGreater;
			end; { lebih besar, besar sama }

	'.' : { titik atau range }
		begin
			ReadChar;
			if ScanStr='..' then
			   Token:= tRange			
			else
			begin
			Token:=tTitik;
			ScanStr:='.';
		end;
			end; { titik atau range }

	'+', '-', '*', '/', ',', ';', '=', ')', '(', '[', ']',:
		begin
			ScanStr:=CC;
			CASE CC OF
			  '+' : Token:=tPlus;
			  '-' : Token:=tMin;
			  '*' : Token:=tMult;
			  '/' : Token:=tDiv;
			  ',' : Token:=tKoma;
			  ';' : Token:=tTitikKoma;
			  '=' : Token:=tEqual;
			  ')' : Token:=tKurungTutup;
			  '(' : Token:=tKurungBuka;
			  '[' : Token:=tKurungSikuBuka;
			  ']' : Token:=tKurungSikuTutup;
		end;
		ReadChar;
	end;

else Error:=errScanUnexpChar;
end; { EndCase }
if ((NOT Comment) and (Error<>errScanUnexpChar))
	or (CC=EndFile)) then
	AdaToken:=true;
if Error<>errNone then ProsErr(Error);
end; { EndWhile }
end; { SCAN }

{**************************** PROGRAM UTAMA ****************************}
begin
 if OpenFile then
 begin
	readchar;
	jinfo:= 0;
	writeln(ResFile,'Internal Number Lokasi Token');
	writeln(ResFile,'----------------');
	while (CC<>EndFile) do
	begin
	  Scan;
	  WriteFile;
	end;
     end;
	
	Close(ResFile);
END.
