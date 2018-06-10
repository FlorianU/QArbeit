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
                                            CssClass="text-danger" ErrorMessage="Die Beschreibung muss angegeben werden." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="txtFSK" CssClass="col-md-2 control-label">Altersbeschränkung</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="txtFSK" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFSK"
                                            CssClass="text-danger" ErrorMessage="Die Altersbeschränkung muss angegeben werden." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="lstSpielKategorien" CssClass="col-md-2 control-label">Kategorie</asp:Label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="lstSpielKategorien" runat="server"  CssClass="form-control"  />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="lstSpielKategorien" CssClass="text-danger" ErrorMessage="Eine Kategorie muss ausgewählt werden." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="lstVerlaege" CssClass="col-md-2 control-label">Verlag</asp:Label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="lstVerlaege" runat="server"  CssClass="form-control"  />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="lstVerlaege" CssClass="text-danger" ErrorMessage="Ein Verlag muss ausgewählt werden." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="lstTarifKategorien" CssClass="col-md-2 control-label">Tarifkategorie</asp:Label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="lstTarifKategorien" runat="server"  CssClass="form-control"  />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="lstTarifKategorien" CssClass="text-danger" ErrorMessage="Eine Tarifkategorie muss ausgewählt werden." />
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
                        <td>
                            <div class="form-horizontal" style="border:1px solid #eeeeee;" >
                                <table>
                                    <div class="form-group">                                        
                                        <div class="col-md-5">
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Spielnummer:</b></asp:Label>
                                                <asp:Label runat="server" CssClass="col-md-10 control-label"><%#: Item.Spielnummer %></asp:Label>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Name:</b></asp:Label>
                                                <asp:Label runat="server" CssClass="col-md-10 control-label"><%#: Item.Name %></asp:Label>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Beschreibung:</b></asp:Label>
                                                <asp:Label runat="server" CssClass="col-md-10 control-label"><%#: Item.Beschreibung %></asp:Label>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Altersbeschränkung:</b></asp:Label>
                                                <asp:Label runat="server" CssClass="col-md-10 control-label"><%#: Item.FSK %></asp:Label>
                                            </div>
                                        </div>  
                                        <div class="col-md-5">
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Kategorie:</b></asp:Label>
                                                <asp:Label runat="server" CssClass="col-md-10 control-label"><%#: Item.Kategorie %></asp:Label>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Verlag:</b></asp:Label>
                                                <asp:Label runat="server" CssClass="col-md-10 control-label"><%#: Item.Verlag?.Name %></asp:Label>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Tarifkategorie:</b></asp:Label>
                                                <asp:Label runat="server" CssClass="col-md-10 control-label"><%#: Item.Tarifkategorie?.Tarifname  %></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <br />
                                            <asp:Button ID="EditButton" CssClass="btn btn-default col-md-12" runat="server" Text="Editieren" CommandName="Edit" CausesValidation="false" Visible='<%# User.IsInRole("Administrator") || User.IsInRole("Mitarbeiter")  %>'/>
                                            <asp:Button ID="Delete" CssClass="btn btn-default col-md-12" runat="server" Text="Löschen" OnClick="Delete_Clicked" CausesValidation="false" CommandArgument="<%#: Item.ID %>" Visible='<%# User.IsInRole("Administrator") || User.IsInRole("Mitarbeiter")  %>' />
                                        </div>
                                    </div>
                                </table>
                            </div>
                        </td>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <td runat="server">
                            <div class="form-horizontal" style="border:1px solid #eeeeee;" >
                                <table>
                                    <div class="form-group">                                        
                                        <div class="col-md-5">
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Spielnummer:</b></asp:Label>
                                                <asp:Label runat="server" CssClass="col-md-10 control-label"><%#: Item.Spielnummer %></asp:Label>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Name:</b></asp:Label>
                                                <asp:TextBox runat="server" ID="txtEditName" CssClass="col-md-10 form-control" placeholder="Name" Text='<%# Item.Name %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditName" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                            </div>
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Beschreibung:</b></asp:Label>
                                                <asp:TextBox runat="server" ID="txtEditBeschreibung" CssClass="col-md-10 form-control" placeholder="Beschreibung" Text='<%# Item.Beschreibung %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditBeschreibung" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                            </div>
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Altersbeschränkung:</b></asp:Label>
                                                <asp:TextBox runat="server" ID="txtEditFSK" CssClass="col-md-10 form-control" placeholder="Altersbeschränkung" Text='<%# Item.FSK %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditFSK" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                            </div>
                                        </div>  
                                        <div class="col-md-5">
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Kategorie:</b></asp:Label>
                                                <asp:TextBox runat="server" ID="txtEditKategorie" CssClass="col-md-10 form-control" placeholder="Kategorie" Text='<%# Item.Kategorie %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditKategorie" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                            
                                            </div>
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Verlag:</b></asp:Label>
                                                <asp:TextBox runat="server" ID="txtEditVerlag" CssClass="col-md-10 form-control" placeholder="Verlag" Text='<%# Item.Verlag?.Name %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditVerlag" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                            
                                            </div>
                                            <div>
                                                <asp:Label runat="server" CssClass="col-md-2 control-label"><b>Tarifkategorie:</b></asp:Label>
                                                <asp:TextBox runat="server" ID="txtEditTarifkategorie" CssClass="col-md-10 form-control" placeholder="Tarif" Text='<%# Item.Tarifkategorie?.Tarifname %>' />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditTarifkategorie" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                            
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <br />
                                            <asp:Button ID="UpdateButton" CssClass="btn btn-default col-md-12" runat="server" Text="Update" ValidationGroup="EditValidation" OnClick="Update_Click" CommandArgument="<%#: Item.ID %>"/>
                                            <asp:Button ID="CancelButton" CssClass="btn btn-default col-md-12" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                                        </div>
                                    </div>
                                </table>
                            </div>
                        </td>
                    </EditItemTemplate>
                    <LayoutTemplate>
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
