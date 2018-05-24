<%@ Page Title="Spiele" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SpieleView.aspx.cs" Inherits="Spielverleih.SpieleView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: Title %></h1>
    <div class="form-horizontal">
        <h4>Unsere Spiele</h4>
        <hr />
    </div>
    <asp:ListView ID="lstSpiele" runat="server" 
        DataKeyNames="Id" GroupItemCount="2"
        ItemType="Ludothek.Model.Spiel" SelectMethod="GetSpiele">
        <EmptyDataTemplate>
            <table >
                <tr>
                    <td>Es wurden keine Daten zurückgegeben.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td/>
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td runat="server">
                <table>
                    <tr>
                        <h2><%#: Item.Name %></h2
                        <p>Beschreibung: <%#: Item.Beschreibung %></p>
                        <p>Altersempfehlung: <%#: Item.FSK %></p>

                    </tr>
                </table>
                </p>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                <tr id="groupPlaceholder"></tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
