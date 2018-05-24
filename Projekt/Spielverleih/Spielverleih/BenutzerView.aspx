<%@ Page Title="Profil" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BenutzerView.aspx.cs" Inherits="Spielverleih.BenutzerView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="productDetail" runat="server" ItemType="Spielverleih.Models.Kunde" SelectMethod ="GetKunde" RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <h1><%#:Item.Vorname +  " " + Item.Name%></h1>
            </div>
            <div class="form-horizontal">
                <h4>Mein Profil</h4>
                <hr />
            </div>
            <table>
                <tr>
                    <td>
                        <div class="form-group">
                            <div class="col-md-12"><b>PLZ: </b><%#:Item.Plz  %></div>
                            <br />
                            <div class="col-md-12"><b>Ort: </b><%#:Item.Ort  %></div>
                            <br />
                            <div class="col-md-12"><b>Strasse: </b><%#:Item.Strasse + " " + Item.Strassennummer %></div>
                            <br />
                            <asp:Button runat="server" OnClick="Editieren_Click" Text="Editieren" CssClass="btn btn-default col-md-12" />
                        </div>
                    </td>
                </tr>
            </table>        
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
