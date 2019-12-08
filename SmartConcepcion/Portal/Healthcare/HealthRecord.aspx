<%@ Page Title="Health Records" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HealthRecord.aspx.cs" Inherits="SmartConcepcion.Portal.Healthcare.HealthRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <div class="header-banner">HEALTH RECORD</div>
    <asp:UpdatePanel ID="upIncidentReport" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <%--<asp:LinkButton runat="server" OnClientClick="openNav()" OnClick="lnkCreate_Click" Text="New User Profile" CausesValidation="false" />--%>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-9 col-xs-9">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtUserSearch" />
                    </div>
                        <div class="col-md-3 col-xs-3">
                            <asp:Button runat="server" CssClass="btn btn-send" Text="search" ID="healthbtnSearchUser" OnClick="btnSearchUser_Click" CausesValidation="false" />
                        </div>
                    </div>
                </div>
                
                
                <hr />
                <%--<asp:LinkButton runat="server" Text="New Incident Report" ID="lnkCreate" OnClick="lnkCreate_Click"/>--%>
                <div style="overflow-x: scroll">
                    <asp:GridView runat="server" AutoGenerateColumns="false"
                        ID="gvUserProfiles" CssClass="table table-default table-hover table-responsive table-dark table-striped" PageSize="20"
                        AllowPaging="true" AllowCustomPaging="true" OnPageIndexChanging="gvUserProfiles_PageIndexChanging">

                        <Columns>
                            <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />
                            
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Fullname" DataField="fullname" />

                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Birthday" DataFormatString="{0:MMMM dd yyyy}" DataField="birthday"  />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Contact No." DataField="contactno" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Height" DataField="height" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Weight" DataField="weight" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Age" ItemStyle-CssClass="text-center" DataField="age" />


                            <asp:TemplateField HeaderStyle-CssClass="thead-dark" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ToolTip='<%# Eval("ID") %>' CssClass="glyphicon glyphicon-edit" OnClick="Unnamed_Click" OnClientClick="openNav()" CausesValidation="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerTemplate>
                                
                            <ul class="pagination pagination-md">
                                <li class="page-item">
                                    <asp:LinkButton runat="server" CssClass="page-item" CommandName="Page" CommandArgument="Prev" Text="Previous" CausesValidation="false" /></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <asp:LinkButton runat="server" CssClass="page-item" CommandName="Page" CommandArgument="Next" Text="Next" CausesValidation="false" /></li>
                            </ul>

                        </PagerTemplate>
                        <PagerSettings Mode="NextPrevious" Position="Bottom" PreviousPageText="Previous" NextPageText="Next" FirstPageText="First" LastPageText="Last" />
                        <PagerStyle HorizontalAlign="Right" />
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <asp:UpdatePanel runat="server" ID="upHealthInfo" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="col-md-6 col-md-offset-3" style="min-height: 100vh; background: white;">
                    <div class="container-fluid">
                        <h2 runat="server" id="header">Create Incident Report</h2>
                        <asp:HiddenField runat="server" ID="hfFrom" />
                        <div class="container-fluid">
                            <div class="form-group">
                                <label class="col-md-4 text-right" for="txtHeight">Height</label>
                                <div class="col-md-8 text-center">
                                    <asp:TextBox runat="server" ID="txtHeight" TextMode="Number" placeholder="Height" CssClass="form-control sign-up-ctrl" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 text-right" >Weight</label>
                                <div class="col-md-8 text-center">
                                    <asp:TextBox runat="server" ID="txtWeight" TextMode="Number" placeholder="Weight" CssClass="form-control sign-up-ctrl" />
                                </div>
                            </div>
                        </div>
                        <div class="text-right container-fluid">
                            <asp:Button runat="server" CssClass="btn btn-send" Text="SAVE" ID="btnPostIR" OnClick="btnPostIR_Click" OnClientClick="closeNav()" />
                        </div>
                        
                        <hr />

                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-3">
                                    <a onclick="openHealthRecord()" >Add health record</a>
                                </div>
                                <div class="col-md-9">
                                    <div class="col-md-9 col-xs-9">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="TextBox1" />
                                    </div>
                                
                                    <div class="col-md-3 col-xs-3">
                                        <asp:Button runat="server" CssClass="btn btn-send" Text="SEARCH" ID="Button1" OnClick="btnSearchUser_Click" CausesValidation="false" />
                                    </div>
                                       
                                </div>
                            </div>

                            <div style="overflow-x: scroll">
                                <asp:GridView runat="server" AutoGenerateColumns="false"
                                    ID="gvMedicalRecord" CssClass="table table-default table-hover table-responsive table-dark" PageSize="5"
                                    AllowPaging="true" AllowCustomPaging="true" OnPageIndexChanging="gvMedicalRecord_PageIndexChanging">

                                    <Columns>
                                        <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />

                                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Findings" DataField="findings" />
                                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Remarks" DataField="remarks" />

                                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Medication start" DataFormatString="{0:MMMM dd yyyy}" DataField="med_date_from" />
                                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Medication end" DataFormatString="{0:MMMM dd yyyy}" DataField="med_date_to" />

                                    </Columns>
                                    <PagerTemplate>

                                        <ul class="pagination pagination-md">
                                            <li class="page-item">
                                                <asp:LinkButton runat="server" CssClass="page-item" CommandName="Page" CommandArgument="Prev" Text="Previous" CausesValidation="false" /></li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item">
                                                <asp:LinkButton runat="server" CssClass="page-item" CommandName="Page" CommandArgument="Next" Text="Next" CausesValidation="false" /></li>
                                        </ul>

                                    </PagerTemplate>
                                    <PagerSettings Mode="NextPrevious" Position="Bottom" PreviousPageText="Previous" NextPageText="Next" FirstPageText="First" LastPageText="Last" />
                                    <PagerStyle HorizontalAlign="Right" />
                                </asp:GridView>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div id="dlgHealthRecord" title="Add Health Record" class="" style="display:none;">
        <asp:UpdatePanel runat="server" ID="upHealtRecord" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="container-fluid">
                    <label class="col-md-4 text-right" for="txtHeight">Findings</label>
                    <div class="col-md-8 text-center">
                        <asp:TextBox runat="server" ID="txtFindings" placeholder="Findings" CssClass="form-control sign-up-ctrl" />
                    </div>
                </div>
                <div class="container-fluid">
                    <label class="col-md-4 text-right" for="txtHeight">Remarks</label>
                    <div class="col-md-8 text-center">
                        <asp:TextBox runat="server" ID="txtRemarks" placeholder="Height" CssClass="form-control sign-up-ctrl" />
                    </div>
                </div>
                <div class="container-fluid">
                    <label class="col-md-4 text-right" for="txtHeight">Start date</label>
                    <div class="col-md-8 text-center">
                        <asp:TextBox runat="server" ID="txtFrom" TextMode="Date" placeholder="Height" CssClass="form-control sign-up-ctrl" />
                    </div>
                </div>
                <div class="container-fluid">
                    <label class="col-md-4 text-right" for="txtHeight">End date</label>
                    <div class="col-md-8 text-center">
                        <asp:TextBox runat="server" ID="txtTo" TextMode="Date" placeholder="Height" CssClass="form-control sign-up-ctrl" />
                    </div>
                    <i><label style="color:darkred">NOTE: If medication is on going leave the end date blank</label></i>
                </div>

                <div class="container-fluid text-right">
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="SAVE" ID="btnSaveHealthReocrd" OnClick="btnSaveHealthReocrd_Click" />
                </div>
               
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    
    <script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="../../Scripts/custom/sidenav.js"></script>
    <script src="../../Scripts/custom/jquery-dialog.js"></script>
</asp:Content>
