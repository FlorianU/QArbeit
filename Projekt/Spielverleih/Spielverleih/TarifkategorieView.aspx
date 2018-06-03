<%@  Page Title="Tarifkategorien" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TarifkategorieView.aspx.cs" Inherits="Spielverleih.TarifKategorieView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:updatepanel runat="server">
        <ContentTemplate>
            <h1><%: Title %></h1>
            <div class="form-horizontal">
                <h4>Füge einen neue Tarifkategorie hinzu</h4>
                <hr />
                <asp:ValidationSummary runat="server" CssClass="text-danger" />

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label">Name</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
                            CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtPrice" CssClass="col-md-2 control-label">Preis</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="txtPrice" CssClass="form-control plz" TextMode="Number" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
                            CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." />
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-11">
                    <asp:Button runat="server" OnClick="Hinzufügen_Click" Text="Hinzufügen" CssClass="btn btn-default" UseSubmitBehavior="false"/>
                </div>
            </div>
            <asp:ListView ID="lstTarifkategorien" runat="server" ItemType="Ludothek.Model.Tarifkategorie">
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
                        <div class="form-group">
                            <table>
                                <tr>
                                    <div class="col-md-4"><%#: Item.Tarifname %></div>
                                    <div class="col-md-4"><%#: Item.Price %></div>
                                </tr>  
                            </table>
                        </div>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                <td runat="server">
                    <div class="form-group">
                        <table>
                            <tr><div class="col-md-4"><b>Name</b></div></tr>
                            <tr><div class="col-md-4"><b>Preis</b></div></tr>
                        </table>
                    </div>
                </td>
                <hr />
                <table style="width:100%;">
                    <tbody>
                        <td>
                            <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                <tr id="groupPlaceholder"></tr>
                            </table>
                        </td>
                    </tbody>
                </table>
                </LayoutTemplate>
            </asp:ListView>
        </ContentTemplate>
    </asp:updatepanel>
</asp:Content>
