<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SmartConcepcion.Portal.Profile" %>
<asp:Content ID="Profile" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        .img-profile{
            width:400px; 
            height: 400px;
            background-position:center
            
        }
    </style>

    <asp:UpdatePanel runat="server" ID="upProfile" >
        <ContentTemplate>
            <div class="container">
        <div class="col-md-4">
            <div class="container-fluid">
                <%--<img id="imgpreview" class="img-responsive" src="http://placehold.it/180" alt="your image" height="300" />--%>
                <div id="imgpreview" class="img-profile" runat="server">

                </div>
                <asp:FileUpload runat="server" accept="image/*" multiple="false" ID="fuBanner" ClientIDMode="Static"  CssClass="form-control-file" onchange="readURL(this)" />
            </div>
        </div>
        <div class="col-md-8">
            <div class="container-fluid">
                <label class="col-md-3">Email</label>
                <div class="col-md-9">
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="form-control" autocomplete="off" />
                </div>
            </div>
            <div class="container-fluid">
                <label class="col-md-3">Current Password</label>
                <div class="col-md-9">
                    <asp:TextBox runat="server" ID="txtCurrPassword" placeholder="Current Password" CssClass="form-control" TextMode="Password" autocomplete="off" />
                </div>
            </div>
            <div class="container-fluid">
                <label class="col-md-3">Password</label>
                <div class="col-md-9">
                    <asp:TextBox runat="server" ID="txtNewPassword" placeholder="Password" CssClass="form-control" TextMode="Password" autocomplete="off" />
                </div>
            </div>
            <div class="container-fluid">
                <label class="col-md-3">Confirm Password</label>
                <div class="col-md-9">
                    <asp:TextBox runat="server" ID="txtConfirm" placeholder="Confirm Password" CssClass="form-control" TextMode="Password" autocomplete="off"/>
                </div>
            </div>
            <asp:Label runat="server" ID="lblErrorMessage" />
            <div class="container-fluid">
                <div class="col-md-12">
                    <asp:Button runat="server" ID="btnUpdate" Text="Update Profile" CssClass="btn btn-warning pull-right" OnClick="btnUpdate_Click" />
                </div>
            </div>
        </div>
    </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUpdate" />
        </Triggers>
    </asp:UpdatePanel>
    
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#MainContent_imgpreview').css('background-image', 'url(' + e.target.result + ')');
                        //.attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
