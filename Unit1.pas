unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Bluetooth, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation,
  FMX.StdCtrls,  System.Bluetooth.Components, FMX.Layouts, FMX.ListBox;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    fbtmanager : TBluetoothManager;
    fbtdevices : TBluetoothDeviceList;
    procedure doDiscoveryEnd(const Sender: TObject;const Fbtdevices:TBluetoothDeviceList);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
 fbtmanager.StartDiscovery(5000);
end;

procedure TForm1.doDiscoveryEnd(const Sender: TObject;
  const Fbtdevices: TBluetoothDeviceList);
  var i:integer;
begin
  for I := 0 to fbtdevices.Count -1 do
  begin
    ListBox1.Items.Add(Fbtdevices[i].DeviceName);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fbtmanager := TBluetoothManager.Current;
  fbtmanager.OnDiscoveryEnd := doDiscoveryEnd;
End;
end.
