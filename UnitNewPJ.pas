unit UnitNewPJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TnewPJ = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    PJ_path: TLabeledEdit;
    PJ_name: TLabeledEdit;
    TrackPath: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Bevel1: TBevel;
    ListBox1: TListBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TBitBtn;
    Button1: TButton;
    Memo1: TMemo;
    procedure TrackPathClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
    my_Template_Dir : string;
  public
    { Public declarations }
    _ProgramDir, _Dir, _File, _Template : string;
    _OK : boolean;
    MyDir : string;
    procedure load ;
  end;

var
  newPJ: TnewPJ;

implementation

uses UnitDir, UnitG ;

{$R *.dfm}

procedure TnewPJ.TrackPathClick(Sender: TObject);
var
  FDir: TDir;
begin
  FDir := TDir.Create(Nil);
  FDir._dir := PJ_path.Text ;
  FDir.ShowModal;
  MyDir := FDir._dir ;
  FDir.Free;
  PJ_path.Text := MyDir;
end;

procedure TnewPJ.Button1Click(Sender: TObject);
var s : string;
begin
  if Length(PJ_name.Text)=0 then
      begin
        MessageDlg('工程名称未填写！', mtError, [mbOK], 0) ;
        exit;
      end;
  if not IsValidFileName(PJ_name.Text) then
      begin
        MessageDlg('工程名称不符合命名方式！', mtError, [mbOK], 0) ;
        exit;
      end;
  if ListBox1.itemIndex = -1 then
      begin
        MessageDlg('模版未选定！', mtError, [mbOK], 0) ;
        exit;
      end;
  if not DirectoryExists(PJ_path.Text) then
      begin
       if MessageDlg('路径不存在，需要创建路径吗？',
               mtWarning, [mbYes, mbNo], 0) = mrNo then  exit;
       CreateDir(PJ_path.Text);
      end;
  s := PJ_path.Text + PJ_name.Text + '\' + PJ_name.Text + '.vk5';
  if fileExists(s) then
      begin
       if MessageDlg('工程已存在，需要覆盖吗？原工程将不能恢复，你要继续吗？',
               mtWarning, [mbYes, mbNo], 0) = mrNo then  exit;
      end;
   _Template := my_Template_Dir + ListBox1.Items[ListBox1.itemIndex];
   _Dir := PJ_path.Text + PJ_name.Text + '\';
   _File := PJ_name.Text ;
   _OK := true;
   close;
end;

procedure TnewPJ.FormClose(Sender: TObject; var Action: TCloseAction);
begin     //[ok]
  Action := caHide;
end;

procedure TnewPJ.load ;
var
   f:TStringList;
begin
  MyDir := _ProgramDir + '_Project\';
  PJ_path.Text := MyDir;
  my_Template_Dir := _ProgramDir + '_Template\';
  f := TStringList.Create;
  SearchAllDirectory(my_Template_Dir,f);
  ListBox1.Items.AddStrings(f);
  f.Free;
  if ListBox1.Items.Count > 0 then
   begin
    ListBox1.ItemIndex := 0;
    ListBox1Click(self);
   end;

end;

procedure TnewPJ.FormCreate(Sender: TObject);
begin
  _OK := false;
end;

procedure TnewPJ.Button2Click(Sender: TObject);
begin  //[ok] 取消
  _OK := false;
  close;
end;

procedure TnewPJ.ListBox1Click(Sender: TObject);
var s : string;
begin //选择模版
if ListBox1.Items.Count > 0 then
   begin
     Label4.Caption := ListBox1.Items[ListBox1.ItemIndex];
     s := Label4.Caption;
     s := copy(s,1,length(s)-1);
     s := my_Template_Dir+s+'\'+s+'.txt';
     if FileExists(s) then  Memo1.Lines.LoadFromFile(s)
       else Memo1.Clear;
   end;
end;

end.
