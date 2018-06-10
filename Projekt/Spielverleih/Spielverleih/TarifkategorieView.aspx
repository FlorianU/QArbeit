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
                            CssClass="text-danger" ErrorMessage="Der Preis muss angegeben werden." />
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-11">
                    <asp:Button runat="server" OnClick="Hinzufügen_Click" Text="Hinzufügen" CssClass="btn btn-default" UseSubmitBehavior="false"/>
                </div>
            </div>
            <br />
            <br />
            <asp:ListView ID="lstTarifkategorien" runat="server" ItemType="Ludothek.Model.Tarifkategorie" OnItemEditing="OnItemEditing" OnItemCanceling="OnItemCanceling"
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
                                <tr>
                                    <div class="col-md-4"><%#: Item.Tarifname %></div>
                                    <div class="col-md-4"><%#: Item.Price.ToString("C2") %></div>
                                    <div class="col-md-2"><asp:Button ID="EditButton" CssClass="btn btn-default col-md-12" runat="server" Text="Editieren" CommandName="Edit" CausesValidation="false"/></div>
                                    <div class="col-md-2"><asp:Button ID="Delete" CssClass="btn btn-default col-md-12" runat="server" Text="Löschen" OnClick="Delete_Clicked" CausesValidation="false" CommandArgument="<%#: Item.ID %>"/></div>
                                </tr>  
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
                                        <div class="col-md-4">
                                            <asp:TextBox runat="server" ID="txtEditTarifname" CssClass="form-control" placeholder="Name" Text='<%# Item.Tarifname %>' />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditTarifname" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
                                        </div>
                                        <div class="col-md-4"
                                            ><asp:TextBox runat="server" ID="txtEditPrice" CssClass="form-control" placeholder="PLZ" Text='<%# Item.Price %>'/>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditPrice" CssClass="text-danger" ErrorMessage="Der Preis muss angegeben werden." ValidationGroup="EditValidation"/>
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
