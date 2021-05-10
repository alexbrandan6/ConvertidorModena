<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ConvertidorMoneda.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Bootstrap 5.0 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <!-- Estilos -->
    <link href="../css/styles.css" rel="stylesheet" />
    <!-- Funciones -->
    <script src="js/scripts.js"></script>
    <!-- Jquery 3.0.5 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <!-- DataTable -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/r-2.2.5/datatables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.21/r-2.2.5/datatables.min.js"></script>

    <title>Index</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="Page1">
            <div class="container pb-3">
                <div class="row d-flex justify-content-end">
                    <div class="col-12 d-flex justify-content-end">
                        <a href="#" class="btn btn-outline-dark" onclick="return show('Page2','Page1');">Mostrar página 2</a>
                    </div>
                </div>
            </div>
            
            <div class="container pt-2 pb-2 bg-light">
                <div class="row d-flex justify-content-center">
                    <div class="col-6">
                        <label class="form__label">Cantidad</label>
                        <asp:TextBox ID="txtMonedaIngresada" runat="server" CssClass="form__field allownumericwithdecimal"></asp:TextBox>
                    </div>
                    <div class="col-3">
                        <label class="form__label">Desde</label>
                        <asp:DropDownList ID="ddlMonedaDesde" runat="server" CssClass="form__field" DataTextField="Descripcion" DataValueField="id"></asp:DropDownList>
                    </div>
                    <div class="col-3">
                        <label class="form__label">A</label>
                        <asp:DropDownList ID="ddlMonedaA" runat="server" CssClass="form__field" DataTextField="Descripcion" DataValueField="id"></asp:DropDownList>
                    </div>
                </div>

                <div class="row pt-2">
                    <div class="col d-flex justify-content-center">
                        <asp:Button ID="btnConvertir" runat="server" CssClass="btn btn-outline-success" Text="Convertir" OnClick="btnConvertir_Click" />
                    </div>
                </div>
            </div>

            <div id="containerResultado" class="container pt-2 pb-2 bg-light" runat="server" visible="false">
                <div class="row justify-content-center">
                    <div class="col-6 d-flex justify-content-center border border-dark border-1 rounded-pill">
                        <label id="lblResultado" runat="server" class="p-2"></label>
                    </div>
                </div>
            </div>
        </div>

        <div id="Page2" style="display: none">
            <div class="container pb-3">
                <div class="row">
                    <div class="col-12">
                        <a href="#" class="btn btn-outline-dark" onclick="return show('Page1','Page2');">Mostrar página 1</a>
                    </div>
                </div>
            </div>
            
            <div class="container pt-2 pb-2 bg-light">
                <div class="row d-flex justify-content-center">
                    <table id="tblMonedaPorMoneda" class="table table-hover text-center table-responsive-lg" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Editar</th>
                                <th>Moneda</th>
                                <th>Descripción</th>
                                <th>Moneda Desde</th>
                                <th>Moneda A</th>
                                <th>Valor</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptMonedaPorMoneda" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <a href="Turnos.aspx?idTurno=<%# Eval("id") %>" class="btn btn-warning w-10">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                    <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                                                </svg>
                                            </a>
                                        </td>
                                        <td>
                                            <%# Eval("Moneda") %>
                                        </td>
                                        <td>
                                            <%# Eval("Descripcion") %>
                                        </td>
                                        <td>
                                            <%# Eval("idMonedaDesde") %>
                                        </td>
                                        <td>
                                            <%# Eval("idMonedaA") %>
                                        </td>
                                        <td>
                                            <%# Eval("Valor") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<script>
    $(document).ready(function () {
        tableEs($('#tblMonedaPorMoneda'));
    });

    $(".allownumericwithdecimal").on("keypress keyup blur", function (event) {
        $(this).val($(this).val().replace(/[^0-9\.]/g, ''));
        if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });
</script>
