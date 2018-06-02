<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StandortControl.ascx.cs" Inherits="Spielverleih.StandortControl" %>

<div class="form-horizontal" >
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="txtStrasse" CssClass="col-md-2 control-label">Strasse</asp:Label>
        <div class="col-md-3">
            <asp:TextBox runat="server" ID="txtStrasse" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStrasse" CssClass="text-danger" ErrorMessage="Die Strasse muss angegeben werden." ValidationGroup="StandortValidation"/>
        </div>
    </div>
    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="txtPLZ" CssClass="col-md-2 control-label">PLZ</asp:Label>
        <div class="col-md-3">
            <asp:TextBox runat="server" ID="txtPLZ" CssClass="form-control" TextMode="Number"  />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPLZ"
                CssClass="text-danger" ErrorMessage="Die Postleitzahl muss angegeben werden." ValidationGroup="StandortValidation" />
        </div>
            <asp:Label runat="server" AssociatedControlID="txtOrt" CssClass="col-md-2 control-label">Ort</asp:Label>
        <div class="col-md-3">
            <asp:TextBox runat="server" ID="txtOrt" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtOrt"
                CssClass="text-danger" ErrorMessage="Der Ort muss angegeben werden." ValidationGroup="StandortValidation"/>
        </div>
    </div>

    <div class="col-md-offset-1 col-md-11">
        <asp:Button runat="server" OnClick="StandortHinzufügen_Click" Text="Hinzufügen" CommandArgument="<%#: LudothekID %>" ValidationGroup="StandortValidation" CssClass="btn btn-default" UseSubmitBehavior="false"/>
    </div>
</div>

<asp:ListView ID="lstStandorte" runat="server" ItemType="Ludothek.Model.Standort">
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
                        <div class="col-md-2"><%#: Item.Name %></div>
                    </tr>
                    <tr>
                        <div class="col-md-2"><%#: Item.PLZ %></div>
                    </tr>
                </table>
            </div>
        </td>
    </ItemTemplate>
    <LayoutTemplate>
    <td runat="server">
        <div class="form-group">
            <table>
                <tr>
                    <div class="col-md-2"><b>Ort</b></div>
                    <div class="col-md-2"><b>PLZ</b></div>
                </tr>
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