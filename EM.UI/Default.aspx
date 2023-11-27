<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="EM.UI._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanelProject" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div>
                <h2>
                    <asp:Label ID="LabelTitle" runat="server" Text="Manage Employee" /></h2>
                <div class="row">
                    <div class="col-md-4 col-lg-3 col-sm-12">
                        <label>First Name</label>
                        <asp:TextBox CssClass="form-control w-100" ID="TextBoxFirstName" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4 col-lg-3 col-sm-12">
                        <label>Second Name</label>
                        <asp:TextBox CssClass="form-control w-100" ID="TextBoxSecondName" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4 col-lg-3 col-sm-12">
                        <label>Phone Number</label>
                        <asp:TextBox MaxLength="15"  CssClass="form-control w-100" ID="TextBoxPhoneNumber" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-md-4 col-lg-3 col-sm-12">
                        <label>Employee Type</label>
                        <asp:DropDownList CssClass="form-control w-100" ID="DropDownEmployeeType" runat="server"></asp:DropDownList>

                    </div>
                    <asp:HiddenField ID="EmployeeId" runat="server" />
                    <div class="col-md-12 col-lg-12 col-sm-12 mt-4 align-content-center">
                        <asp:Button ID="ButtonSubmit" CssClass="btn btn-primary" runat="server" Text="Add" OnClientClick="FormValidation('ButtonSubmit'); return false;" />
                        <asp:Button ID="ButtonSubmitEdition" CssClass="btn btn-primary" Visible="false" runat="server" Text="Update" OnClientClick="FormValidation('ButtonSubmitEdition'); return false;" />
                        <asp:Button ID="CancelButton" CssClass="btn btn-secondary" runat="server" Text="Cancel" OnClick="CancelButton_Click" />
                    </div>
                </div>
            </div>
            ​
        <br />
            <asp:GridView
                CssClass="table table-striped table-bordered table-hover"
                DataKeyNames="ID"
                ID="gvwEmployee"
                AutoGenerateColumns="False"
                runat="server"
                ShowHeaderWhenEmpty="true"
                EmptyDataText="No records found">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="SecondName" HeaderText="Second Name" SortExpression="SecondName" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="EmployeeTypeDefinition" HeaderText="Type" SortExpression="EmployeeTypeDefinition" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" CssClass="btn btn-warning" runat="server" CommandArgument='<%#Eval("ID")%>' OnCommand="btnEdit_Command" Text="Edit">
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" CssClass="btn btn-danger" runat="server" CommandArgument='<%#Eval("ID")%>' OnCommand="btnDelete_Command" Text="Delete">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
