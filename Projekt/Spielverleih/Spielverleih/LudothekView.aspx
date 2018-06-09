<%@  Page Title="Ludotheken" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LudothekView.aspx.cs" Inherits="Spielverleih.LudothekView" %>
<%@ Register Src="~/Controls/StandortControl.ascx" TagPrefix="uc" TagName="StandortControl" %>  

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:updatepanel runat="server">
        <ContentTemplate>
            <h1><%: Title %></h1>
            <div class="form-horizontal">
                <h4>Füge einen neue Ludothek hinzu</h4>
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
                    <asp:Label runat="server" AssociatedControlID="lstVerbaende" CssClass="col-md-2 control-label">Verbände</asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList ID="lstVerbaende" runat="server"  CssClass="form-control"  />
                    </div>
                </div>

                <div class="col-md-offset-1 col-md-11">
                    <asp:Button runat="server" OnClick="Hinzufügen_Click" Text="Hinzufügen" CssClass="btn btn-default" UseSubmitBehavior="false"/>
                </div>
            </div>
                <asp:ListView ID="lstLudotheken" runat="server" ItemType="Ludothek.Model.Ludothek">
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
                                        <tr><div class="col-md-3"><%#: Item.Name %></div></tr>  
                                        <tr><div class="col-md-3"><%#: Item.Verband.Name %></div></tr>  
                                        <tr>
                                            <asp:Button runat="server" Text="+" CssClass="btn btn-default col-md-2" CausesValidation="false" CommandArgument="<%#: Item.ID %>"  OnClick="Expand_Click" />
                                        </tr>
                                        <tr>
                                            <asp:Panel ID="expandID" runat="server" Visible="false" >
                                                <uc:StandortControl runat="server" LudothekID='<%#: Item.ID %>'/>   
                                            </asp:Panel>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                    <td runat="server">
                        <div class="form-group">
                            <table>
                                <tr><div class="col-md-3"><b>Name</b></div></tr>
                                <tr><div class="col-md-3"><b>Verband</b></div></tr>
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
