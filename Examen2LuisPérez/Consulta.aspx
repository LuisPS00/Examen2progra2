<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="Examen2LuisPérez.Consulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <br />
            <br />
            <br />
            <div class="auto-style1">
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Cajero:"></asp:Label>
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TCajero" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Maquina: "></asp:Label>
&nbsp;<asp:TextBox ID="TMaquina" runat="server"></asp:TextBox>
                <br />
                <br />
                Prodcuto:&nbsp;
                <asp:TextBox ID="TProducto" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
                <br />
                <br />
                <asp:Button ID="Bingresar" runat="server" OnClick="Bingresar_Click" Text="ingresar Venta:" />
            </div>
        </div>
    </form>
</body>
</html>
