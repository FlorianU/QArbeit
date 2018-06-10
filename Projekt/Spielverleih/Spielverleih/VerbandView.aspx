<%@  Page Title="Verbände" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerbandView.aspx.cs" Inherits="Spielverleih.VerbandView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:updatepanel runat="server">
        <ContentTemplate>
            <h1><%: Title %></h1>
            <div class="form-horizontal">
                <h4>Füge einen neuen Verband hinzu</h4>
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
                <div class="col-md-offset-1 col-md-11">
                    <asp:Button runat="server" OnClick="Hinzufügen_Click" Text="Hinzufügen" CssClass="btn btn-default" UseSubmitBehavior="false"/>
                </div>
            </div>
            <br />
            <br />
            <asp:ListView ID="lstVerbaende" runat="server" ItemType="Ludothek.Model.Verband" OnItemEditing="OnItemEditing" OnItemCanceling="OnItemCanceling"
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
                                    <div class="col-md-8"><%#: Item.Name %></div>
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
                                        <div class="col-md-8">
                                            <asp:TextBox runat="server" ID="txtEditName" CssClass="form-control" placeholder="Name" Text='<%# Item.Name %>' />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditName" CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." ValidationGroup="EditValidation" />
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
                            <tr><div class="col-md-8"><b>Name</b></div></tr>
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
