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
                <asp:ListView ID="lstSpiele" runat="server" ItemType="Ludothek.Model.Spiel" OnItemEditing="OnItemEditing" OnItemCanceling="OnItemCanceling"
                ItemPlaceholderID="itemPlaceHolder1">
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
                    <tr>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                    </tr>
                </GroupTemplate>
                    <ItemTemplate>
                        <td runat="server">
                                <div class="form-group">
                                    <table>
                                        <tr><div class="col-md-1"><%#: Item.Spielnummer %></div></tr>   
                                        <tr><div class="col-md-1"><%#: Item.Name %></div></tr>   
                                        <tr><div class="col-md-2"><%#: Item.Beschreibung %></div></tr>   
                                        <tr><div class="col-md-2"><%#: Item.FSK %></div></tr>   
                                        <tr><div class="col-md-2"><%#: Item.Kategorie %></div></tr>   
                                        <tr><div class="col-md-1"><%#: Item.Verlag?.Name %></div></tr>   
                                        <tr><div class="col-md-1"><%#: Item.Tarifkategorie?.Tarifname %></div></tr>
                                        <div class="col-md-2"><asp:Button ID="EditButton" CssClass="btn btn-default col-md-12" runat="server" Text="Editieren" CommandName="Edit" CausesValidation="false" Visible='<%# User.IsInRole("Administrator") || User.IsInRole("Mitarbeiter")  %>'/></div>
                                        <div class="col-md-2"><asp:Button ID="Delete" CssClass="btn btn-default col-md-12" runat="server" Text="Löschen" OnClick="Delete_Clicked" CausesValidation="false" CommandArgument="<%#: Item.ID %>" Visible='<%# User.IsInRole("Administrator") || User.IsInRole("Mitarbeiter")  %>' /></div>
                                    </table>
                                </div>
                            </td>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <td runat="server">
                            <div class="form-group">
                                <table>
                                    <tr>
                                        <asp:Panel runat="server" ID="editPanel">
                                            <div class="col-md-2">
                                                <asp:TextBox runat="server" ID="txtEditName" CssClass="form-control" placeholder="Name" Text='<%# Item.Name %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditName" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                            </div>                                   
                                            <div class="col-md-2">
                                                <asp:TextBox runat="server" ID="txtEditBeschreibung" CssClass="form-control" placeholder="Beschreibung" Text='<%# Item.Beschreibung %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditBeschreibung" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                            </div>
                                            <div class="col-md-2">
                                                <asp:TextBox runat="server" ID="txtEditFSK" CssClass="form-control" placeholder="Altersbeschränkung" Text='<%# Item.FSK %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditFSK" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                            </div>                                   
                                            <div class="col-md-2">
                                                <asp:TextBox runat="server" ID="txtEditKategorie" CssClass="form-control" placeholder="Kategorie" Text='<%# Item.Kategorie %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditKategorie" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                            </div>                                            
                                            <div class="col-md-2">
                                                <asp:TextBox runat="server" ID="txtEditVerlag" CssClass="form-control" placeholder="Verlag" Text='<%# Item.Verlag?.Name %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditVerlag" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                            </div>                                            
                                            <div class="col-md-2">
                                                <asp:TextBox runat="server" ID="txtEditTarifkategorie" CssClass="form-control" placeholder="Tarif" Text='<%# Item.Tarifkategorie?.Tarifname %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditTarifkategorie" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                            </div>
                                            <div class="col-md-2">
                                                <asp:Button CssClass="btn btn-default col-md-12" ID="UpdateButton" runat="server" Text="Update" ValidationGroup="EditValidation" OnClick="Update_Click" CommandArgument="<%#: Item.ID %>"/>

                                            </div>
                                            <div class="col-md-2">
                                                <asp:Button CssClass="btn btn-default col-md-12" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false"/>
                                            </div>
                                        </asp:Panel>
                                    </tr>  
                                </table>
                            </div>
                        </td>
                    </EditItemTemplate>
                    <LayoutTemplate>
                    <td runat="server">
                        <div class="form-group">
                            <table>
                                <tr><div class="col-md-1"><b>Nummer</b></div></tr>
                                <tr><div class="col-md-1"><b>Name</b></div></tr>
                                <tr><div class="col-md-2"><b>Beschreibung</b></div></tr>
                                <tr><div class="col-md-2"><b>Kategorie</b></div></tr>
                                <tr><div class="col-md-1"><b>Verlag</b></div></tr>
                                <tr><div class="col-md-1"><b>Tarif</b></div></tr>
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
