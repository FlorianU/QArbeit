<%@ Page Title="Ausleihe-Übersicht" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UebersichtView.aspx.cs" Inherits="Spielverleih.UebersichView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:updatepanel runat="server">
    <ContentTemplate>
        <h2><%: Title %></h2>
        <div class="form-horizontal">
            <h4>Hier werden alle Ausleihen angezeigt</h4>
            <hr />
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtFilter" CssClass="col-md-2 control-label">Suchen:</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtFilter" CssClass="form-control" OnTextChanged="Filter_Changed" AutoPostBack="true"/>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <div style="height:630px;overflow:auto;">
            <asp:ListView ID="lstAusleihe" runat="server" ItemType="Ludothek.Model.Ausleihe" >
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>Es wurden keine Daten gefunden.</td>
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
                                <tr><div class="col-md-1"><%#: Item.Nummer%></div></tr>  
                                <tr><div class="col-md-2"><%#: Item.SpielBezeichnung %></div></tr>
                                <tr><div class="col-md-1"><%#: Item.Verlag %></div></tr>
                                <tr><div class="col-md-1"><%#: Item.Ausleihdatum.ToShortDateString() %></div></tr>
                                <tr><div class="col-md-1"><%#: (Item.Rueckgabedatum.HasValue) ? Item.Rueckgabedatum.Value.ToShortDateString() : "" %></div></tr>
                                <tr><div class="col-md-1"><%#: Item.AnzVerlängerungen %></div></tr>
                                <tr><div class="col-md-2"><%#: Item.Benutzer.Vorname + " " + Item.Benutzer.Nachname %></div></tr>
                                <tr><div class="col-md-2"><%#: Item.Benutzer.Strasse %></div></tr>
                                <tr><div class="col-md-1"><%#: Item.Benutzer.Ort + " " + Item.Benutzer.PLZ %></div></tr>
                            </table>
                        </div>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                     <td runat="server">
                        <div class="form-group">
                            <table>
                                <tr><div class="col-md-1"><b>Ausleihnr.</b></div></tr>
                                <tr><div class="col-md-2"><b>Spiel</b></div></tr>
                                <tr><div class="col-md-1"><b>Verlag</b></div></tr>
                                <tr><div class="col-md-1"><b>Ausleihe</b></div></tr>
                                <tr><div class="col-md-1"><b>Rückgabe</b></div></tr>
                                <tr><div class="col-md-1"><b>Verlänger.</b></div></tr>
                                <tr><div class="col-md-2"><b>Kunde</b></div></tr>
                                <tr><div class="col-md-2"><b>Strasse</b></div></tr>
                                <tr><div class="col-md-1"><b>Ort</b></div></tr>
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
        </div>
    </ContentTemplate>
    </asp:updatepanel>
</asp:Content>