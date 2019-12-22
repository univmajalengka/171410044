unit scanner;

interface

uses crt;
conts
        ALNG           = 30; {Number of sigificant chars in identifiers.}
        eof             = #26;
        tab             = #009;
        LineFeed        = #010;
        space           = #032;

type
Alfa = string[ALNG];
{Recognized symbol tokens.}
token =(
        t_int,t_add,t_sub,t_mul,t_rdiv,t_double_mul,
        t_assign {':='},
        t_lbrack {'['}, t_rbrack {']'},
        t_iparent {'('}, t_rparent {')'},
        t_id, t_else, t_if, t_then
);
const
        num_reserved_word = 3; {number of reserved.}
        {Recognized reserved word tokens.}
        keySym : array [1..num_reserved_word] of tokens = (
        t_else, t_if, t_then
        );
var
        FIn     :string[12]; {input file name.}
        FInput  :text; {input file ponter.}
        LookAhead :boolean; {true if had been read ahead , else FALSE.}
        Enum    :boolean; {true if an enumeration delimeter countered.}
        Ch      :char; {read from finput.}
        token   :tokens; {current token.}
        Id      :Alfa; {current identifier.}
        Inum    :longint; {integer number read, must be in -> integer;}
        Linumber :integer;
        procedure initialize; {membuka file}
        procedure scan;
        procedure terminate; {menutup file}

        implementation

        procedure Initialize; {initialize variables.}
        begin
        if (ParamCount <1)
        then repeat
                write('File Sumber (.pas):');
                ReadLn(FIn);
                until (Leght (FIn)<>0)
                else FIn :=FIn+ '.pas';
                {$I+}
                if (IOResult <> 0)
                then begin
                writeLn('Tidak Bisa Mengakres File : ''',FIn,'''');
                Halt;
                end;
        FIn :=Copy(FIn,1,Pos('.', FIn) - 1) + '.out';
             LookAhead := FALSE;
             Enum      := FALSE;
             Ch        := '';
             LineNumber :=1;
             end;
        procedure Terminate;
        begin
        close(FInput,Ch,);
        end;

        procedure error_report (id : byte);
        begin
        case id of
        1 :writeln('Error -> unknown character ''',Ch,''' Line :',LineNumber);
        2 :writeln('Error -> comment not limited Line',LineNumber);
        3 :writeln('Error -> integer overflow Line',LineNumber);
         end;
        end;
        procedure Scan;
        {scan input text, and send a token.}
        var
        Idx :integer;
        e   :integer;
        begin
                if (not LookAhead)
                then GetCh;
                LookAhead := FALSE;
                repeat
                case Ch of
                        tab,LineFeed,space : GetCh;
                        car_return;
                        begin
                        GetCh;
                        inc (LineNumber);
                        end;
                eof : (end of file)
                exit;
        'A',,'Z','a',,'z' : (identifier)
        begin
        Id := '';
        repeat
        Id := Id +Ch;

        GetCh;
        until (Ch in ['0'..'9'.'A'..'Z','a'..'z']));
        LookAhead := TRUE;
        Idx :=0;
        repeat
        Idx := Idx +1;
        until ((Idx = num_reserved_word) or (Id = KeyStr[Idx]));
        if (Id = KeyStr[Idx])
        then token := KeySym[Idx]
        else token := t_id;
        Exit;
        end;

        '0'..'9' : {number}
        begin
        Inum := 0;
        token := t_int;
        repeat
        Inum := *10 + (ord(Ch)- ord('0');
        GetCh;
        until (not (Ch in['0'..'9']));
        LookAhead := true;
        Exit;
        end;

        '+':
        begin
        token := t_add;
        exit;
        end;
        '-':
        begin
        token := t_sub;
        exit;
        end;
        '*':
        begin
        if (Ch = '*')
        then token := t_double_mul
        else begin
          token := t_mul;
          lookahead := true;
          end;
        exit;
        end;
        '/':
        begin
        token := t_rdiv;
        exit;
        end;
        ')':
        begin
        token := t_rparent;
        exit;
        end;
        '[':
        begin
        token := t_lbrack;
        exit;
        end;
        ']':
        begin
        token := t_rbrack;
        exit;
        end;
        ':':
        begin
        GetCh;
        if (Ch <> '*')
        then begin
         token := t_lparent;
         LookAhead := TRUE;
         Exit;
         end
         else begin
         GetCh;
         if(Ch = eof)
         then begin
         error_report (2);
         exit;
         end;
         repeat
          while (Ch <> '*')
          do begin
          GetCh;
          if (Ch = eof) then
          begin
          error_report(2);
          Exit;
          end;
         end;
         GetCh;
         if (Ch = eof)
         then begin
          error_report(2);
          exit;
          end;
          until (Ch =')');
          GetCh;
          end;
         end;
         else
         begin
           error_report(1);
           GetCh;
           end;
           end; {case}
           until FALSE;
         end;
        end.

