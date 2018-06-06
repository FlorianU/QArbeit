<%@ Page Title="Spiele" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SpieleView.aspx.cs" Inherits="Spielverleih.SpieleView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:updatepanel runat="server">
        
        <ContentTemplate>
            <h1><%: Title %></h1>
            <div class="form-horizontal">
                <h4>Unsere Spiele</h4>
                <hr />
                <asp:LoginView runat="server" ID="loginView">
                    <RoleGroups>
                        <asp:RoleGroup Roles="Mitarbeiter,Administrator">
                            <ContentTemplate>
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
                                    <asp:Label runat="server" AssociatedControlID="txtBeschreibung" CssClass="col-md-2 control-label">Beschreibung</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="txtBeschreibung" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBeschreibung"
                                            CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="txtFSK" CssClass="col-md-2 control-label">Altersbeschränkung</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="txtFSK" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFSK"
                                            CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="lstSpielKategorien" CssClass="col-md-2 control-label">Kategorie</asp:Label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="lstSpielKategorien" runat="server"  CssClass="form-control"  />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="lstSpielKategorien" CssClass="text-danger" ErrorMessage="Ein Spiel muss ausgewählt werden." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="lstVerlaege" CssClass="col-md-2 control-label">Verlag</asp:Label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="lstVerlaege" runat="server"  CssClass="form-control"  />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="lstVerlaege" CssClass="text-danger" ErrorMessage="Ein Spiel muss ausgewählt werden." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="lstTarifKategorien" CssClass="col-md-2 control-label">Tarifkategorie</asp:Label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="lstTarifKategorien" runat="server"  CssClass="form-control"  />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="lstTarifKategorien" CssClass="text-danger" ErrorMessage="Ein Spiel muss ausgewählt werden." />
                                    </div>
                                </div>
                                <div class="col-md-offset-1 col-md-11">
                                    <asp:Button runat="server" OnClick="Hinzufügen_Click" Text="Hinzufügen" CssClass="btn btn-default" UseSubmitBehavior="false"/>
                                </div>
                                <br />
                                <br />
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>
            </div>
                <asp:ListView ID="lstSpiele" runat="server" ItemType="Ludothek.Model.Spiel">
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
                                        <tr><div class="col-md-2"><%#: Item.Spielnummer %></div></tr>   
                                        <tr><div class="col-md-2"><%#: Item.Name %></div></tr>   
                                        <tr><div class="col-md-3"><%#: Item.Kategorie %></div></tr>   
                                        <tr><div class="col-md-3"><%#: Item.Verlag.Name %></div></tr>   
                                        <tr><div class="col-md-2"><%#: Item.Tarifkategorie.Tarifname %></div></tr>
                                    </table>
                                </div>
                            </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                    <td runat="server">
                        <div class="form-group">
                            <table>
                                <tr><div class="col-md-2"><b>Spielnummer</b></div></tr>
                                <tr><div class="col-md-2"><b>Name</b></div></tr>
                                <tr><div class="col-md-3"><b>Kategorie</b></div></tr>
                                <tr><div class="col-md-3"><b>Verlag</b></div></tr>
                                <tr><div class="col-md-2"><b>Tarif</b></div></tr>
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
