<%@ Page Title="Ausleihe" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AusleiheView.aspx.cs" Inherits="Spielverleih.AusleiheView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:updatepanel runat="server">
    <ContentTemplate>
        <h2><%: Title %></h2>
        <div class="form-horizontal">
            <h4>Leihe ein neues Spiel aus</h4>
            <hr />
            <asp:ValidationSummary runat="server" CssClass="text-danger" />
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="lstVerfuegbareSpiele" CssClass="col-md-1 control-label">Spiel</asp:Label>
                <div class="col-md-11">
                    <asp:DropDownList ID="lstVerfuegbareSpiele" runat="server"  CssClass="form-control"  />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="lstVerfuegbareSpiele" CssClass="text-danger" ErrorMessage="Ein Spiel muss ausgewählt werden." />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="lstVerfuegbareSpiele" CssClass="text-danger" Text="Alle Spiele sind verliehen" />
                </div>
                <div class="col-md-offset-1 col-md-11">
                    <asp:Button runat="server" OnClick="Ausleihen_Click" Text="Ausleihen" CssClass="btn btn-default" UseSubmitBehavior="false"/>
                </div>
            </div>
        </div>
        <asp:ListView ID="lstAusleihe" runat="server" ItemType="Ludothek.Model.Ausleihe">
            <EmptyDataTemplate>
                <table >
                    <tr>
                        <td>Bisher haben Sie noch nichts ausgeliehen.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
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
                            <tr><div class="col-md-2"><%#: Item.SpielBezeichnung %></div></tr>
                            <tr><div class="col-md-1"><%#: Item.Verlag %></div></tr>
                            <tr><div class="col-md-2"><%#: Item.Ausleihdatum %></div></tr>
                            <tr><div class="col-md-2"><%#: Item.Rueckgabedatum %></div></tr>
                            <tr><div class="col-md-1"><%#: Item.AnzVerlängerungen %></div></tr>
                            <tr><asp:Button runat="server" Text="Verlängern" CssClass="btn btn-default col-md-2" CausesValidation="false"  CommandArgument="<%#: Item.ID %>" Visible='<%# !(Item.Zurueckgegeben || (Item.AnzVerlängerungen == 3))  %>' OnClick="Verlaengern_Click" ViewStateMode="Enabled"/></tr>
                            <tr><asp:Button runat="server" Text="Zurückgeben" CssClass="btn btn-default col-md-2" CausesValidation="false"  CommandArgument="<%#: Item.ID %>" Visible='<%# !Item.Zurueckgegeben %>' OnClick="Zurueckgeben_Click"/></tr>
                        </table>
                    </div>
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                 <td runat="server">
                    <div class="form-group">
                        <table>
                            <tr><div class="col-md-2"><b>Spiel</b></div></tr>
                            <tr><div class="col-md-1"><b>Verlag</b></div></tr>
                            <tr><div class="col-md-2"><b>Ausleihdatum</b></div></tr>
                            <tr><div class="col-md-2"><b>Rückgabedatum</b></div></tr>
                            <tr><div class="col-md-1"><b>Verlängerungen</b></div></tr>
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