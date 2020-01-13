<%@ Page Title="Brgy Official" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Official.aspx.cs" Inherits="SmartConcepcion.Portal.Officials.Official" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
.card-capt {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;

 
  margin-left: auto;
  margin-right: auto;
  width: 50%;

}

.card-capt:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
.card-kagawad {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;

    display: block;
  margin-left: auto;
  margin-right: auto;
  width: 100%;

}

.card-kagawad:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
.official-name{
    background-color:transparent;
    border:none;
}

@media only screen and (max-width: 600px) {
  .card-capt {
    width:100%;
  }
}
</style>
    <div class="container-fluid">
        <div class="col-md-6  col-md-offset-3 ">
            <div class="card-capt">
                <img src="../../images/user.png" id="imgcaptain" runat="server" alt="Avatar" style="width: 100%">
                <div class="container-fluid">
                    <div class="middle">
                    </div>
                    <h4><b><asp:Label runat="server" ID="lblCaptain"/></b></h4>
                    <p>Barangay Captain</p>
                </div>
            </div>
        </div>
    </div>
    
    <hr />
    
    <div class="container-fluid">
        <asp:ListView runat="server" ID="lvCouncilor">
            <ItemTemplate>
                <div class="col-md-3">
                    <div class="card-kagawad">
                        <img src='<%# "../community/ProfilePicture/" + Eval("userID") + Eval("profile_ext") %>' alt="Avatar" style="width: 100%">
                        <div class="container-fluid">
                            <h4><b><%# Eval("officialName") %></b></h4>
                            <p><%# Eval("position") %></p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>

    <hr />
</asp:Content>
