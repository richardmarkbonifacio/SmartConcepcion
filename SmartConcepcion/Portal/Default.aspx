<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<style>


input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}





.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

 h2 {
    font-size: 24px;
    text-transform: uppercase;
    color: #303030;
    font-weight: 600;
    margin-bottom: 30px;
  }
  h4 {
    font-size: 19px;
    line-height: 1.375em;
    color: #303030;
    font-weight: 400;
    margin-bottom: 30px;
  }  
  .jumbotron {
    background-color: #f4511e;
    color: #fff;
    padding: 100px 25px;
    font-family: Montserrat, sans-serif;
  }
  .container-fluid {
    padding: 60px 50px;
  }
  .bg-grey {
    background-color: #f6f6f6;
  }
  .icoabout-small {
    color: green;
    font-size: 50px;
  }
  .icoabout {
    color: green;
    font-size: 200px;
  }
  .btn-default{
      border-width: 0;
    outline: none;
    border-radius: 2px;
    box-shadow: 0 1px 4px rgba(0, 0, 0, .6);
    background-color: #f99827;
    color: #ecf0f1;
    transition: background-color .3s;
    padding-right: 35px;
    padding-left: 35px;
    font-weight: 600;
    margin: 10px;
  }
  .btn-default:hover, .btn-default:active{
    border-width: 0;
    outline: none;
    border-radius: 2px;
    box-shadow: 0 1px 4px rgba(0, 0, 0, .6);
    background-color: #f19429;
    color: #ecf0f1;
    transition: background-color .3s;
    padding-right: 35px;
    padding-left: 35px;
    font-weight: 600;
    margin: 10px;
  }
  .btn-send{
      border-width: 0;
    outline: none;
    border-radius: 2px;
    box-shadow: 0 1px 4px rgba(0, 0, 0, .6);
    background-color: #f99827;
    color: #ecf0f1;
    transition: background-color .3s;
    padding-right: 35px;
    padding-left: 35px;
    font-weight: 600;
   margin-bottom:10px;
  }
 .btn-send:hover{
      border-width: 0;
    outline: none;
    border-radius: 2px;
    box-shadow: 0 1px 4px rgba(0, 0, 0, .6);
    background-color: #f19429;
    color: #ecf0f1;
    transition: background-color .3s;
    padding-right: 35px;
    padding-left: 35px;
    font-weight: 600;
   
 }
 .cntc-home{
     background-color:#f6f6f6;
     width:100%;
     margin-bottom:15px;
 }
 #subject{
     resize:none;
 }
</style>
  <div id="about" class="container-fluid">
  <div class="row text-justify">
    <div class="col-sm-8">
      <h2>About Smart Concepcion</h2><br>
      <h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</h4><br>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <br><%--<button class="btn btn-default btn-lg">Get in Touch</button>--%>
    <button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="right" data-content="Email Us: Loremipsum@gmail.com">
Get In Touch
</button>

    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-dashboard icoabout"></span>
    </div>
  </div>
</div>

<div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-globe icoabout slideanim"></span>
    </div>
    <div class="col-sm-8 text-justify">
      <h2>Our Values</h2><br>
      <h4><strong>MISSION:</strong> Our mission lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</h4><br>
      <p><strong>VISION:</strong> Our vision Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
  </div>
</div>

<!-- Container (Services Section) -->
<div id="services" class="container-fluid text-center">
  <h2>SERVICES</h2>
  <h4>What we offer</h4>
  <br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-list-alt icoabout-small"></span>
      <h4>NEWS</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-heart icoabout-small"></span>
      <h4>HEALTHCARE</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-lock icoabout-small"></span>
      <h4>BUSINESS</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-exclamation-sign icoabout-small"></span>
      <h4>INFORMATION</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-certificate icoabout-small"></span>
      <h4>CERTIFICATE</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-wrench icoabout-small"></span>
      <h4 style="color:#303030;">HARD WORK</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
  </div>
</div>
    <div class="container fluid cntc-home">
        <h2 class="text-center">CONTACT US</h2>
        <h4 class="text-center">Vestibulum ante ipsum primis in faucibus orci </h4>
    <div class="col-md-6">
     <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3854.6004740002945!2d120.89718731466922!3d14.959335989574784!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x339700017b31427f%3A0x3fe088c333e6ff7!2sBaliwag%20Municipal%20Hall!5e0!3m2!1sen!2sph!4v1570946889223!5m2!1sen!2sph" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
    </div>
        <div class="col-md-6">
        
  <div class="row">
    <div class="col-25">
      <label for="fname">First Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="fname" name="firstname" placeholder="Your name..">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="lname">Last Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="lname" name="lastname" placeholder="Your last name..">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="Email">Email</label>
         
    </div>
        <div class="col-75">
      <input type="text" id="mail" name="email" placeholder="Email">
            </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="subject">Subject</label>
    </div>
    <div class="col-75">
      <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>
    </div>
  </div>
  <div class="row">
 
  <button type="button" class="btn btn-send pull-right" data-container="body">
Send
</button>
  </div>
 
</div>
        </div>
        
    <script>
$(function () {
  $('[data-toggle="popover"]').popover()
        })

     
    </script>


</asp:Content>
