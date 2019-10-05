﻿<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>

        body {
            overflow:hidden;
            }
            .body-content{
          margin-top: 80px;
        
         
        }
   .puuter{
       display:none;
   }
.cb-slideshow,
.cb-slideshow:after { 
 
    width: 100%;
    height: 100%;
    top: 0px;
    left: 0px;
    /*z-index: 0;*/ 
}
.cb-slideshow:after { 
    content:'';
}
.cb-slideshow li span { 
    width: 100%;
    height: 120vh;
    position: absolute;
    top: 0px;
    left: 0px;
    color: transparent;
    background-size: cover;
    background-position: 50% 50%;
    opacity: 0;

    /*z-index: 0;*/
	-webkit-backface-visibility: hidden;
    -webkit-animation: imageAnimation 36s linear infinite 0s;
    -moz-animation: imageAnimation 36s linear infinite 0s;
    -o-animation: imageAnimation 36s linear infinite 0s;

    animation: imageAnimation 36s linear infinite 0s; 
}
.cb-slideshow li div { 
    /*z-index: 2;*/
    position: absolute;
    bottom: 30vh;
    left: 0px;
    width: 100%;

    text-align: center;
    opacity: 0;
    color: #fff;
    -webkit-animation: titleAnimation 36s linear infinite;
    -moz-animation: titleAnimation 36s linear infinite;
    -o-animation: titleAnimation 36s linear infinite;

    animation: titleAnimation 36s linear infinite; 
}
.cb-slideshow li div h3 { 
    
    font-size: 90px;
    padding: 0;
    line-height: 200px; 
     color:#ffd800;
   
  -webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: black;
}
.cb-slideshow li:nth-child(1) span { 
    background-image: url(../images/1.jpg) ;
    
     
}
.cb-slideshow li:nth-child(2) span { 
    background-image: url(../images/2.jpg);
    -webkit-animation-delay: 6s;
      list-style-type: none;
    -moz-animation-delay: 6s;
    -o-animation-delay: 6s;
    
    animation-delay: 6s; 
}
.cb-slideshow li:nth-child(3) span { 
    background-image: url(../images/3.jpg);
    -webkit-animation-delay: 12s;
    -moz-animation-delay: 12s;
    -o-animation-delay: 12s;
  
    animation-delay: 12s; 
}
.cb-slideshow li:nth-child(4) span { 
    background-image: url(../images/4.jpg);
    -webkit-animation-delay: 6s;
    -moz-animation-delay: 6s;
    -o-animation-delay: 6s;

    animation-delay: 6s; 
}

.cb-slideshow li:nth-child(2) div { 
    -webkit-animation-delay: 6s;
    -moz-animation-delay: 6s;
    -o-animation-delay: 6s;
 
    animation-delay: 6s; 
}
.cb-slideshow li:nth-child(3) div { 
    -webkit-animation-delay: 12s;
    -moz-animation-delay: 12s;
    -o-animation-delay: 12s;
      list-style-type: none;
 
    animation-delay: 12s; 
}
.cb-slideshow li:nth-child(4) div { 
    -webkit-animation-delay: 6s;
    -moz-animation-delay: 6s;
    -o-animation-delay: 6s;
    
    animation-delay: 6s; 
}

/* Animation for the slideshow images */
@-webkit-keyframes imageAnimation { 
    0% { opacity: 0;
    -webkit-animation-timing-function: ease-in; }
    8% { opacity: 1;
         -webkit-animation-timing-function: ease-out; }
    17% { opacity: 1 }
    25% { opacity: 0 }
    100% { opacity: 0 }
}
@-moz-keyframes imageAnimation { 
    0% { opacity: 0;
    -moz-animation-timing-function: ease-in; }
    8% { opacity: 1;
         -moz-animation-timing-function: ease-out; }
    17% { opacity: 1 }
    25% { opacity: 0 }
    100% { opacity: 0 }
}
@-o-keyframes imageAnimation { 
    0% { opacity: 0;
    -o-animation-timing-function: ease-in; }
    8% { opacity: 1;
         -o-animation-timing-function: ease-out; }
    17% { opacity: 1 }
    25% { opacity: 0 }
    100% { opacity: 0 }
}
@-ms-keyframes imageAnimation { 
    0% { opacity: 0;
 }
    8% { opacity: 1;
       }
    17% { opacity: 1 }
    25% { opacity: 0 }
    100% { opacity: 0 }
}
@keyframes imageAnimation { 
    0% { opacity: 0;
    animation-timing-function: ease-in; }
    8% { opacity: 1;
         animation-timing-function: ease-out; }
    17% { opacity: 1 }
    25% { opacity: 0 }
    100% { opacity: 0 }
}
/* Animation for the title */
@-webkit-keyframes titleAnimation { 
    0% { opacity: 0 }
    8% { opacity: 1 }
    17% { opacity: 1 }
    19% { opacity: 0 }
    100% { opacity: 0 }
}
@-moz-keyframes titleAnimation { 
    0% { opacity: 0 }
    8% { opacity: 1 }
    17% { opacity: 1 }
    19% { opacity: 0 }
    100% { opacity: 0 }
}
@-o-keyframes titleAnimation { 
    0% { opacity: 0 }
    8% { opacity: 1 }
    17% { opacity: 1 }
    19% { opacity: 0 }
    100% { opacity: 0 }
}
@-ms-keyframes titleAnimation { 
    0% { opacity: 0 }
    8% { opacity: 1 }
    17% { opacity: 1 }
    19% { opacity: 0 }
    100% { opacity: 0 }
}
@keyframes titleAnimation { 
    0% { opacity: 0 }
    8% { opacity: 1 }
    17% { opacity: 1 }
    19% { opacity: 0 }
    100% { opacity: 0 }
}
/* Show at least something when animations not supported */
.no-cssanimations .cb-slideshow li span{
	opacity: 1;
}
.buttonslider{
 background-color:#00ff00;

  color: #fff;
  padding: 10px 40px;
  text-align: center;
  text-decoration: none;
  font-weight:700;
  margin: 4px 2px;
  cursor: pointer;

}
</style>

        <ul style="list-style: none;" class="cb-slideshow">
            <li><span>Image 01</span><div><h3>News & Events</h3><button class="buttonslider">VIEW</button></div></li>
            <li><span>Image 02</span><div><h3>Incident Report</h3><button class="buttonslider">VIEW</button></div></li>
            <li><span>Image 03</span><div><h3>Dashboard</h3><button class="buttonslider">VIEW</button></div></li>
            <li><span>Image 04</span><div><h3>Officials</h3><button class="buttonslider">VIEW</button></div></li>
        </ul>
 


</asp:Content>
