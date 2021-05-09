﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ConvertidorMoneda.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Bootstrap 5.0 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link href="../css/styles.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title>Index</title>
</head>
<body>
    <form id="form1" runat="server">
            <div class="container pt-4">
                <div class="row d-flex justify-content-center">
                    <div class="col-6">
                        <label class="form__label">Cantidad</label>
                        <asp:TextBox ID="txtMonedaIngresada" runat="server" CssClass="form__field allownumericwithdecimal"></asp:TextBox>
                    </div>
                    <div class="col-6">
                        <label class="form__label">Moneda</label>
                        <asp:DropDownList ID="ddlMoneda" runat="server" CssClass="form__field" DataTextField="Descripcion" DataValueField="Valor"></asp:DropDownList>
                    </div>
                </div>

                <div class="row pt-2">
                    <div class="col d-flex justify-content-center">
                        <asp:Button ID="btnConvertir" runat="server" CssClass="btn btn-outline-success" Text="Convertir" OnClick="btnConvertir_Click" />
                    </div>
                </div>
            </div>

            <div class="container pt-2">
                <div class="row d-flex justify-content-center">
                    <div class="col-6">
                        <div id="alertResultado" runat="server" class="alert alert-success" role="alert" visible="false">
                            La conversion es de: 
                            <strong>
                                <label id="lblResultado" runat="server" class="form-label"></label>
                            </strong>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>

<script>
    $(".allownumericwithdecimal").on("keypress keyup blur", function (event) {
        $(this).val($(this).val().replace(/[^0-9\.]/g, ''));
        if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });
</script>