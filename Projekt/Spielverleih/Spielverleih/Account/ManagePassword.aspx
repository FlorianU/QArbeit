<%@ Page Title="Passwortverwaltung" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePassword.aspx.cs" Inherits="Spielverleih.Account.ManagePassword" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <div class="form-horizontal">
        <section id="passwordForm">
            <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                <p>
                    Sie haben kein lokales Passwort für diese Seite. Fügen Sie ein lokales Passwort hinzu, damit Sie sich ohne externe Anmeldung anmelden können.
                </p>
                <div class="form-horizontal">
                    <h4>Passwort setzen Formular</h4>
                    <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                    <hr />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-2 control-label">Passwort</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                CssClass="text-danger" ErrorMessage="Das Passwortfeld ist erforderlich."
                                Display="Dynamic" ValidationGroup="SetPassword" />
                            <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                CssClass="text-danger" SetFocusOnError="true" />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">Bestätige das Passwort</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="Das Bestätigungsfeld ist erforderlich."
                                ValidationGroup="SetPassword" />
                            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="Das Passwort und das Bestätigungs-Passwort stimmen nicht überein."
                                ValidationGroup="SetPassword" />

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" Text="Set Password" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                <div class="form-horizontal">
                    <h4>Passwort ändern</h4>
                    <hr />
                    <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                    <div class="form-group">
                        <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="col-md-2 control-label">Aktuelles Passwort</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                CssClass="text-danger" ErrorMessage="Das Feld für das aktuelle Passwort ist erforderlich."
                                ValidationGroup="ChangePassword" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">Neues Passwort</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                CssClass="text-danger" ErrorMessage="Das neue Passwort ist erforderlich."
                                ValidationGroup="ChangePassword" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">Neues Passwort bestätigen</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="Das Feld für das Passwort bestätigen ist erforderlich."
                                ValidationGroup="ChangePassword" />
                            <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="Das neue Passwort und das Bestätigungspasswort stimmen nicht überein."
                                ValidationGroup="ChangePassword" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" Text="Passwort ändern" ValidationGroup="ChangePassword" OnClick="ChangePassword_Click" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            </asp:PlaceHolder>
        </section>
    </div>
</asp:Content>
