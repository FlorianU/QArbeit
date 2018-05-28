<%@ Page Title="Registrieren" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Spielverleih.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Erstelle einen Account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="Die Email muss angegeben werden." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Passwort</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="Das Passwort muss angegeben werden." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Passwort bestätigen</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger"  ErrorMessage="Das Bestätigungspasswort muss angegeben werden." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" ErrorMessage="Das Passwort und das Bestätigungs-Passwort stimmen nicht überein." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Vorname" CssClass="col-md-2 control-label">Vorname</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Vorname" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Vorname"
                    CssClass="text-danger" ErrorMessage="Der Vorname muss angegeben werden." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Nachname" CssClass="col-md-2 control-label">Nachname</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Nachname" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Nachname" 
                    CssClass="text-danger" ErrorMessage="Der Nachname muss angegeben werden." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Geburtsdatum" CssClass="col-md-2 control-label">Geburtsdatum</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Geburtsdatum" CssClass="form-control"/>
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Geburtsdatum"
                    CssClass="text-danger" ErrorMessage="Der Geburtsdatum muss angegeben werden." />--%>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Plz" CssClass="col-md-2 control-label">PLZ</asp:Label>
            <div class="col-md-3">
                <asp:TextBox runat="server" ID="Plz" CssClass="form-control" TextMode="Number"  />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Plz"
                    CssClass="text-danger" ErrorMessage="Die Postleitzahl muss angegeben werden." />
            </div>
             <asp:Label runat="server" AssociatedControlID="Ort" CssClass="col-md-2 control-label">Ort</asp:Label>
            <div class="col-md-3">
                <asp:TextBox runat="server" ID="Ort" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Ort"
                    CssClass="text-danger" ErrorMessage="Der Ort muss angegeben werden." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Strasse" CssClass="col-md-2 control-label">Strasse</asp:Label>
            <div class="col-md-3">
                <asp:TextBox runat="server" ID="Strasse" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Strasse"
                    CssClass="text-danger" ErrorMessage="Die Strasse muss angegeben werden." />
            </div>
            <asp:Label runat="server" AssociatedControlID="Strassennummer" CssClass="col-md-2 control-label">Strassennummer</asp:Label>
            <div class="col-md-3">
                <asp:TextBox runat="server" ID="Strassennummer" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Strassennummer"
                    CssClass="text-danger" ErrorMessage="Die Strassennummer muss angegeben werden." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Registrieren" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
