<%@ Page Title="Community" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Community.Default" %>
<asp:Content ID="content_report" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        .fa-check-circle-o{
            color:green;
        }
        .fa-times-circle{
            color:red;
        }
        .filter{
            display:none;
        }
        /* Mark input boxes that gets an error on validation: */
        input.invalid {
            background-color: #ffdddd;
        }

        /* Hide all steps by default: */
        .tab {
            display: none;
        }

        /* Make circles that indicate the steps of the form: */
        .step {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbbbbb;
            border: none;
            border-radius: 50%;
            display: inline-block;
            opacity: 0.5;
        }

        /* Mark the active step: */
        .step.active {
            opacity: 1;
        }

        /* Mark the steps that are finished and valid: */
        .step.finish {
            background-color: #4CAF50;
        }
    </style>
    
    <div class="header-banner">COMMUNITY</div>
    <asp:UpdatePanel ID="upIncidentReport" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <i class="fa fa-sliders" aria-hidden="true" style="cursor:pointer" onclick="FilterBox()" >Filter</i>
                    </div>
                    <div class="col-md-6 text-right">
                        <asp:LinkButton runat="server" OnClientClick="openNav()" OnClick="lnkCreate_Click" Text="New User Profile" CausesValidation="false" />
                    </div>
                </div>
                <div class="row filter">
                    <div class="col-md-3 col-xs-12 col-md-offset-3">
                        <asp:DropDownList runat="server" ID="ddVerified" CssClass="form-control">
                            <asp:ListItem Text="Select One" Value="-1" />
                            <asp:ListItem Text="Verified" Value="1" />
                            <asp:ListItem Text="Not Verified" Value="0" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 col-xs-12">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtUserSearch" autocomplete="false" placeholder="Search for name" />
                    </div>
                    <div class="col-md-3 col-xs-12">
                        <asp:Button runat="server" CssClass="btn btn-send" Text="SEARCH" ID="btnSearchUser" OnClick="btnSearchUser_Click" CausesValidation="false" />
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
                            <asp:TemplateField HeaderStyle-CssClass="thead-dark" ItemStyle-CssClass="text-center" HeaderText="Verified">
                                <ItemTemplate>
                                    <i class='<%# ((bool)Eval("verified")) ? "fa fa-check-circle-o" : "fa fa-times-circle" %>'></i>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Email" DataField="email" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Fullname" DataField="fullname" />

                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Birthday" DataFormatString="{0:d}" DataField="birthday" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Contact No." DataField="contactno" />

                            <asp:TemplateField HeaderStyle-CssClass="thead-dark" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ToolTip='<%# Eval("ID") %>' CssClass="glyphicon glyphicon-edit" OnClick="Unnamed_Click" OnClientClick="showSidenav_wAccount();" CausesValidation="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerTemplate>

                            <ul class="pagination pagination-md">
                                <li class="page-item">
                                    <asp:LinkButton runat="server" CssClass="page-item" CommandName="Page" CommandArgument="Prev" Text="Previous" CausesValidation="false" />
                                </li>
                                <li class="page-item">
                                    <asp:LinkButton runat="server" CssClass="page-item" CommandName="Page" CommandArgument="Next" Text="Next" CausesValidation="false" />
                                </li>
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
        <asp:UpdatePanel runat="server" ID="upIncidentInfo" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="col-md-6 col-md-offset-3" style="min-height: 100vh; background: white;">
                    <div class="container-fluid">
                        <h2 runat="server" id="header">Create new profile</h2>
                        <asp:HiddenField runat="server" ID="hfFrom" />
                        <h3><asp:Label runat="server" ID="lblAccountNo" /></h3>

                        <div class="container-fluid">
                            <div class="tab">
                                <h3>Personal Information</h3>
                                <div class="form-group">
                                    <label class="col-md-4 text-right">Firstname</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtFnam" placeholder="Firstname" CssClass="form-control sign-up-ctrl required" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 text-right">Middlename</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtMnam" placeholder="Middlename" CssClass="form-control sign-up-ctrl" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 text-right">Lastname</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtLnam" placeholder="Lastname" CssClass="form-control sign-up-ctrl required" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 text-right">Suffix</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtSuffix" placeholder="Suffix" CssClass="form-control sign-up-ctrl" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 text-right">Birthddate</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtBday" placeholder="Birthdate" autocomplete="off" CssClass="form-control sign-up-ctrl" TextMode="Date" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 text-right">Gender</label>
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddGender" placeholder="Sex" CssClass="form-control sign-up-ctrl">
                                            <asp:ListItem Text="Male" Value="male" />
                                            <asp:ListItem Text="Female" Value="female" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 text-right">Voter's ID</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtVotersID" placeholder="Voter's ID" autocomplete="off" CssClass="form-control sign-up-ctrl required" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 text-right">Nationality</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtNationality" placeholder="Nationality" CssClass="form-control sign-up-ctrl required" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 text-right">Civil Status</label>
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddCivilStatus" CssClass="form-control sign-up-ctrl">
                                            <asp:ListItem Text="Single" />
                                            <asp:ListItem Text="Married" />
                                            <asp:ListItem Text="Widowed" />
                                            <asp:ListItem Text="Seperated" />
                                            <asp:ListItem Text="Divorced" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="tab">
                                <h3>Present Address</h3>
                                
                                <div class="form-group">
                                    <label class="col-md-4 text-right">Zone/Purok</label>
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddZone" placeholder="Barangay" CssClass="form-control sign-up-ctrl"
                                            DataValueField="ID" DataTextField="Description" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 text-right">St. Bldg No.</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtStbldgno" placeholder="St. Bldg No." CssClass="form-control sign-up-ctrl" />
                                    </div>
                                </div>
                                <h3>Contact Information</h3>
                                <div class="form-group">
                                    <label class="col-md-4 text-right">Email</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="form-control sign-up-ctrl" TextMode="Email" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 text-right">Contact No.</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtContact" placeholder="Contact No." CssClass="form-control sign-up-ctrl required" />
                                    </div>
                                </div>

                            </div>

                            <div class="tab">
                                <h3>Educational Attainment</h3>
                                <!-- Preschool -->
                                <div class="container-fluid">
                                    <label class="col-md-4 text-right">Preschool</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtPreschool" placeholder="Preschool" CssClass="form-control sign-up-ctrl" />
                                    </div>
                                </div>
                                <div class="container-fluid">
                                    <label class="col-md-4 text-right">Preschool Date</label>
                                    <div class="col-md-8">
                                        <div class="input-daterange input-group" style="z-index: 0">
                                            <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtPreFrom" />
                                            <span class="input-group-addon">to</span>
                                            <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtPreTo" />
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Elementary -->
                                <div class="container-fluid">
                                    <label class="col-md-4 text-right">Elementary</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtElem" placeholder="Elementary" CssClass="form-control sign-up-ctrl" />
                                    </div>
                                </div>
                                <div class="container-fluid">
                                    <label class="col-md-4 text-right">Elementary Date</label>
                                    <div class="col-md-8">
                                        <div class="input-daterange input-group" style="z-index: 0">
                                            <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtElemStart" />
                                            <span class="input-group-addon">to</span>
                                            <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtElemEnd" />
                                        </div>
                                    </div>
                                </div>

                                <!-- Highschool -->
                                <div class="container-fluid">
                                    <label class="col-md-4 text-right">Highschool</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtHS" placeholder="Highschool" CssClass="form-control sign-up-ctrl" />
                                    </div>
                                </div>
                                <div class="container-fluid">
                                    <label class="col-md-4 text-right">Highschool Date</label>
                                    <div class="col-md-8">
                                        <div class="input-daterange input-group" style="z-index: 0">
                                            <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtHSStart" />
                                            <span class="input-group-addon">to</span>
                                            <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtHSEnd" />
                                        </div>
                                    </div>
                                </div>

                                <!-- College -->
                                <div class="container-fluid">
                                    <label class="col-md-4 text-right">College</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtCollege" placeholder="College" CssClass="form-control sign-up-ctrl" />
                                    </div>
                                </div>
                                <div class="container-fluid">
                                    <label class="col-md-4 text-right">Course</label>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtCourse" placeholder="Course" CssClass="form-control sign-up-ctrl" />
                                    </div>
                                </div>
                                <div class="container-fluid">
                                    <label class="col-md-4 text-right">College Date</label>
                                    <div class="col-md-8">
                                        <div class="input-daterange input-group" style="z-index: 0">
                                            <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtCollegeStart" />
                                            <span class="input-group-addon">to</span>
                                            <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtCollegeEnd" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab">
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <asp:CheckBox runat="server" ID="chkIndigent" CssClass="form-check-input" Checked="true" />
                                        <label class="form-check-label" for="chkIndigent">Indigent</label>
                                    </div>
                                    <div class="col-md-3">

                                        <asp:CheckBox runat="server" ID="chkSenir" Checked="true" />
                                        <label class="form-check-label" for="chkSenir">Senior Citizen</label>
                                    </div>
                                    <div class="col-md-3">

                                        <asp:CheckBox runat="server" ID="chkPwd" Checked="true" />
                                        <label class="form-check-label" for="chkPwd">PWD</label>

                                    </div>
                                    <div class="col-md-3">

                                        <asp:CheckBox runat="server" ID="chk4ps" Checked="true" />
                                        <label class="form-check-label" for="chk4ps">4PS</label>
                                    </div>
                                </div>
                            </div>

                            <div class="container-fluid">
                                <div style="float: right;">
                                    <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                                    <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
                                </div>
                            </div>

                            <!-- Circles which indicates the steps of the form: -->
                            <div style="text-align: center; margin-top: 40px;">
                                <span class="step"></span>
                                <span class="step"></span>
                                <span class="step"></span>
                                <span class="step"></span>
                            </div>
                        </div>
                        
                        <div class="text-right container-fluid">
                            <asp:Button runat="server" CssClass="btn btn-red" Text="Print Certificate" ID="brgyCertificate" OnClick="btnBrgyCert_Click" OnClientClick="closeNav()" />
                            <asp:Button runat="server" CssClass="btn btn-red" Text="Print Indigency" OnClientClick="openGeneric()" />
                            <asp:Button runat="server" CssClass="btn btn-send" Text="VERIFY" ID="btnVerify" OnClick="btnVerify_Click" OnClientClick="closeNav()" />
                            <asp:Button runat="server" CssClass="btn btn-send" Text="SAVE" ID="btnPostIR" OnClick="btnPostIR_Click" OnClientClick="closeNav()" />
                            
                        </div>
                        
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>

    <div id="dlgGeneric" title="Certificate of Indigency" class="" style="display:none;">
        <asp:UpdatePanel runat="server" ID="upHealtRecord" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="container-fluid">
                    <label class="col-md-4 text-right" >Reason</label>
                    <div class="col-md-8 text-center">
                        <asp:TextBox runat="server" ID="txtReason" placeholder="Reason" CssClass="form-control sign-up-ctrl" />
                    </div>
                </div>
                
                <div class="container-fluid text-right">
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="INDIGENCY" ID="brgyIndigency" OnClick="brgyIndigency_Click" OnClientClick="closeNav()" />
                    
                </div>
               
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    
    <%--<script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>--%>
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    
    <script src="../../Scripts/custom/sidenav.js"></script>
    <script src="../../Scripts/custom/jquery-dialog.js"></script>
    <script>
        function FilterBox() {
            $(".filter").toggle(500, "linear");
        }
    </script>
    <script>
        function pageLoad(){ showTab(0); }  
    </script>
    
    
</asp:Content>
