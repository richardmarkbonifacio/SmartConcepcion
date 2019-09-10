<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    
    <link href='https://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext' rel='stylesheet' type='text/css'/>

    <style>
        html, 
        body {
            height: 100%;
            overflow:hidden;
            font-family:Lato;
        }
        .signup{
            background: lightblue url("/images/signup_backgroud.jpg") no-repeat fixed center;
            background-size:cover;
            height:100vh;
            color:#fff;
        }
        .sign-up-ctrl{
            margin:10px 0px 10px 0px;
        }
        .form-control{
            border-radius:10px;
            height:5vh;
        }
        .btn-acct{
            background-color:#06d96b;
            width: 150px;
            height: 5vh;
            border-radius: 10px;
            margin-top: 15px;
        }
        .features{
            border: 5px solid #fff;
            height:30vh;
            width: 30%;
            margin: 1.665%;
            margin-top:60px;
        }
        .features-icon{
            width: 100px;
            height: 100px;
            margin-top: -50px;
            background-color: #25685e;
            border-radius: 50%;
        }
        .logo{
             display: block;
            margin-left: auto;
            margin-right: auto;

        }
    </style>
</head>
<body>
    <form id="main" runat="server">
        <div class="row">
            <div class="container-fluid">
                <div class="col-md-8 signup">
                    <div class="container-fluid">
                    <img src="images/logo_smart_pinakafi.png" class="logo"/>
                        <h1><b>SIGN UP</b></h1>
                        <label><i>Its quick and easy</i></label>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-md-4">
                            <asp:TextBox runat="server" ID="txtFnam" placeholder="Firstname" CssClass="form-control sign-up-ctrl" />
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" ID="txtMnam" placeholder="Middlename" CssClass="form-control sign-up-ctrl" />
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" ID="txtLnam" placeholder="Lastname" CssClass="form-control sign-up-ctrl" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="form-control sign-up-ctrl" TextMode="Email" />
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" ID="txtContact" placeholder="Contact No." CssClass="form-control sign-up-ctrl" />
                        </div>
                        <div class="col-md-4">
                            <asp:DropDownList runat="server" ID="ddBrgy" placeholder="Barangay" CssClass="form-control sign-up-ctrl" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <asp:TextBox runat="server" ID="txtBday" placeholder="Birthdate" CssClass="form-control sign-up-ctrl" TextMode="Date" />
                        </div>
                        <div class="col-md-3">
                            <asp:DropDownList runat="server" ID="ddGender" placeholder="Gender" CssClass="form-control sign-up-ctrl">
                                <asp:ListItem Text="Male" />
                                <asp:ListItem Text="Female" />
                                <asp:ListItem Text="Alien" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox runat="server" ID="txtRUserpass" placeholder="Password" CssClass="form-control sign-up-ctrl" TextMode="Password" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12 text-center">
                          <asp:Button runat="server" CssClass="btn btn-acct" Text="Sign Up" OnClick="btnSignUp" />
                        </div>
                        
                    </div>
                    <div class="container-fluid">
                        <div class="row text-center">
                            <div class="col-md-4 features">
                                <span>
                                    <img src="images/eng.png" class="features-icon"/>
                                    <br />
                                    Lorem ipsum dolor 
                                    amet, consectetur 
                                    adipiscing elit.
                                </span>
                            </div>
                            <div class="col-md-4 features ">
                                 <span>
                                     <img src="images/newsfinal.png" class="features-icon" />
                                     <br />
                                    Lorem ipsum dolor 
                                    amet, consectetur 
                                    adipiscing elit.
                                </span>
                            </div>
                            <div class="col-md-4 features">
                                 <span>
                                    <img src="images/testingfinal.png" class="features-icon" />
                                     <br />
                                    Lorem ipsum dolor 
                                    amet, consectetur 
                                    adipiscing elit.
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center" style="height: 40vh;margin-top:30vh">
                    <div class="container-fluid">
                        <h1>Sign in to your account</h1>
                        <asp:TextBox runat="server" ID="txtUserid" placeholder="User ID" CssClass="form-control sign-up-ctrl" />
                        <asp:TextBox runat="server" ID="txtUserpass"  placeholder="Password" TextMode="Password" CssClass="form-control sign-up-ctrl" />
                        <div class="col-md-12 text-left">
                            <asp:CheckBox runat="server" Text="Remember me" />
                        </div>
                        <div class="col-md-12 text-left">
                            <asp:Label runat="server" ID="lblErr" Font-Size="12px" Font-Italic="true" ForeColor="Red" />
                        </div>

                        <asp:Button runat="server" CssClass="btn btn-acct" Text="Sign in" OnClick="btnSignIn" />
                    </div>
                </div>
            </div>
            
        </div>
    </form>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</body>
</html>

