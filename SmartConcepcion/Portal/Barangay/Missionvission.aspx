<%@ Page Title="Mission & Vision" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Missionvission.aspx.cs" Inherits="SmartConcepcion.Portal.Barangay.Missionvission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
.tab-tabs { border-bottom: 2px solid #DDD; }
.tab-tabs > li.active > a, .nav-tabs > li.active > a:focus, .tab-tabs > li.active > a:hover { border-width: 0; }
.tab-tabs > li > a { border: none; color: #ffffff;background: #5a4080; }
.tab-tabs > li.active > a, .tab-tabs > li > a:hover { border: none;  color: #5a4080 !important; background: #fff; }
.tab-tabs > li > a::after { content: ""; background: #5a4080; height: 2px; position: absolute; width: 100%; left: 0px; bottom: -1px; transition: all 250ms ease 0s; transform: scale(0); }
.tab-tabs > li.active > a::after, .nav-tabs > li:hover > a::after { transform: scale(1); }
.tab-nav > li > a::after { background: #5a4080 none repeat scroll 0% 0%; color: #fff; }
.tab-pane { padding: 15px 0; }
.tab-content{padding:20px}
.nav-tabs > li  {width:25%; text-align:center;}
.card {background: #FFF none repeat scroll 0% 0%;  margin-bottom: 30px; }


@media all and (max-width:724px){
.tab-tabs > li > a > span {display:none;}	
.tab-tabs > li > a {padding: 5px 5px;}
}
#bannermission {
  height: 100px;
  background-color: red; /* For browsers that do not support gradients */
 background-image: linear-gradient(to right, #43e97b 0%, #38f9d7 100%);
  margin-bottom:20px;
}
#bannermission h1{
    color:white;
    padding-top:30px;
    font-weight:600;
           }
#bannerabout {
  height: 100px;
  background-color: red; /* For browsers that do not support gradients */
background-image: linear-gradient(to right, #43e97b 0%, #38f9d7 100%);
  margin-bottom:20px;
}
#bannerabout h1{
    color:white;
    font-weight:600;
    padding-top:30px;
           }
.aboutbox {
  margin-right: 20px;
  background-color: #ffffff;
     
  padding-top: 3px;
    padding-bottom: 3px;
    height:60vh;
    
}
.aboutbox h1{
       padding-left: 38px;
       font-weight:600;
}

.aboutbox p {
  margin: 5%;

}
.aboutboxright {
    height:20vh;
     background-color: #ffffff;
 
  padding-top: 3px;
    padding-bottom: 3px;
        width: 52vh;
}
.aboutboxrightr {
    height:37vh;
        width: 52vh;
     background-color: #ffffff;

  padding-top: 3px;
    padding-bottom: 3px;
    margin-top:20px;
}

</style>
    <div class="row">
        
        <div id="bannerabout" style="text-align:center;"><h1>ABOUT US</h1></div>
    <div class="aboutbox col-md-8">
        <h1>What is Smart Concepcion?</h1>
    <p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac nulla at ex mattis molestie eu sit amet ante. Cras scelerisque turpis non imperdiet convallis. Pellentesque venenatis ligula felis, ut laoreet dolor eleifend eu. Etiam viverra aliquam lorem et eleifend. Vivamus non elit est. Nullam magna dui, bibendum eu sapien in, suscipit auctor lectus. Aliquam posuere varius auctor. Duis bibendum, nunc in fringilla finibus, justo nibh consectetur libero, vel convallis augue mi a orci. Donec imperdiet diam id arcu mollis, a dapibus tortor bibendum. Praesent at leo accumsan, suscipit neque non, vulputate quam. Interdum et malesuada fames ac ante ipsum primis in faucibus.
In hac habitasse platea dictumst. Nunc ac cursus nisi, sed facilisis ligula. Quisque tortor justo, congue id dapibus et, rutrum ut neque. Quisque sit amet odio erat. Morbi lacinia tristique sapien, ut porta mauris euismod at. Duis vestibulum ullamcorper ex nec aliquam. Curabitur neque magna, accumsan vitae eleifend eget, dapibus et orci. Morbi dignissim leo velit, eu tristique risus varius vestibulum. Curabitur est libero, ultricies ac magna eget, tempor dignissim metus. Ut vehicula justo et accumsan pharetra. Phasellus sit amet vulputate arcu, et suscipit velit. Aliquam sodales tincidunt ullamcorper. Sed eleifend odio arcu, volutpat tincidunt orci vehicula a. Vestibulum convallis dui eget diam fringilla sollicitudin vitae at nulla. Donec pharetra tristique tempus. Aliquam vulputate magna eget dolor euismod iaculis.

    </p>
  </div>
        <div class="aboutboxright col-md-3">

        </div>
        <div class="aboutboxrightr col-md-3">

        </div>
</div>


    <div id="bannermission" style="text-align:center;"><h1>OUR MISSION & VISION</h1></div>
<div class="container">
  <div class="row">
    <div class="col-md-12"> 
      <!-- Nav tabs -->
      <div class="card">
        <ul class="nav nav-tabs" role="tablist">
          <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-home"></i><span>MISSION</span></a></li>
          <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-user"></i>  <span>VISION</span></a></li>

        </ul>
        
        <!-- Tab panes -->
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="home">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</div>
          <div role="tabpanel" class="tab-pane" id="profile">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</div>
      
        </div>
      </div>
    </div>
  </div>
    <div class="core"></div>
</div>
</asp:Content>
