<%@ Page Title="Benutzer editieren" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BenutzerEditView.aspx.cs" Inherits="Spielverleih.BenutzerEditView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Profil bearbeiten</h4>
        <hr />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtVorname" CssClass="col-md-2 control-label">Vorname</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtVorname" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtVorname"
                    CssClass="text-danger" ErrorMessage="Der Vorname muss angegeben werden." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
                    CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtGeburtsdatum" CssClass="col-md-2 control-label">Geburtsdatum</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtGeburtsdatum" CssClass="form-control" />
<%--                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
                    CssClass="text-danger" ErrorMessage="Der Name muss angegeben werden." />--%>
            </div>
        </div>
                
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtStrasse" CssClass="col-md-2 control-label">Strasse</asp:Label>
            <div class="col-md-3">
                <asp:TextBox runat="server" ID="txtStrasse" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStrasse"
                    CssClass="text-danger" ErrorMessage="Die Strasse muss angegeben werden." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPlz" CssClass="col-md-2 control-label">PLZ</asp:Label>
            <div class="col-md-3">
                <asp:TextBox runat="server" ID="txtPlz" CssClass="form-control plz" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPlz"
                    CssClass="text-danger" ErrorMessage="Die Postleitzahl muss angegeben werden." />
            </div>
             <asp:Label runat="server" AssociatedControlID="txtOrt" CssClass="col-md-2 control-label">Ort</asp:Label>
            <div class="col-md-3">
                <asp:TextBox runat="server" ID="txtOrt" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtOrt"
                    CssClass="text-danger" ErrorMessage="Der Ort muss angegeben werden." />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="Speichern_Click" Text="Speichern" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
