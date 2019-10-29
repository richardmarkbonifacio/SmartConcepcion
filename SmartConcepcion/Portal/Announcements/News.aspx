<%@ Page Title="News and Announcement" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.News" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <style>
        .ajax__html_editor_extender_popupDiv {
                display:none;
            }
        
        .panelRow{
            padding-bottom: 1.5em;
        }
        .img-responsive{
            height:30vh;
            width:100%;
        }
        h2 {
            font-size: 20pt;
            font-weight: 400;
            color: indianred;
        }
        p {
            margin: 0;
            word-break:break-all
        }
        p + p {
            margin-top: .75em;
        }
        
        body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
        article {
          padding: 1.5em;
          background: white;
          border-radius: 3px;
        }
        article p {
          color: indianred;
          line-height: 1.5;
          word-break:break-all;
          text-align:justify;
        }
        .capsule {
          margin-left: auto;
          margin-right: auto;

        }
        .capsule  + .capsule {
          border-top: none;
        }
        .right-news {
            padding: 1.5em;
            background: white;
            
        }
        .right-news i{
        text-align:justify;
        }
        .capsule:first-of-type {
          border-top-left-radius: 5px;
          border-top-right-radius: 5px;
        }
        .capsule:last-of-type {
          border-bottom-left-radius: 5px;
          border-bottom-right-radius: 5px;
        }
        hr{
            border:none;
        }
        .btn-nav{
            background:#f99827;
            color:#fff;
            font-weight:600;
            border-radius:0px;
            margin-bottom:10px;
        }
        .btn-nav:hover{
             background:#f19429;
            color:#fff;
            font-weight:600;
            border-radius:0px;
            margin-bottom:10px;
        }
        .widget-topnews{
            font-weight:800;
            text-align:center;
            padding:15px;
            font-size:15px;
        }
        .fast-fact{
        min-height: 100%;
    background-size: cover;
   
    background: url(../../images/Abstract-Envelope.svg)no-repeat center center fixed;
        }
        .fast-fact h2{
        font-weight:800;
        text-align:center;
        color:#fff;
        margin-bottom:20px;

        }
        .fast-fact h4{
             font-weight:600;
             color:#fff;
             line-height: 30px;

        }

    </style>
    <asp:UpdatePanel ID="upAnnouncements" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <script src="../../Scripts/custom/sidenav.js"></script>
            <div class="col-md-9">
                <asp:GridView runat="server" AutoGenerateColumns="false" OnRowDataBound="gvAnnouncements_RowDataBound" ID="gvAnnouncements" CssClass="gvAnnouncements">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image runat="server" ID="imgbanner" ToolTip='<%#Eval("ID") %>' CssClass="hidden"  />
                                <asp:Panel runat="server" ID="panelRow" CssClass="panelRow">
                                    <asp:Panel runat="server" ID="panelbgContainer" />
                                    <article>
                                        <h2><%# Eval("title") %></h2>
                                        
                                        <div class="container-fluid">
                                            <h5><%# Eval("createdByName") %>,
                                            <i><%# Eval("datecreated", "{0:MMMM dd yyyy}") %></i></h5>

                                        </div>

                                        <p>
                                            <%# Eval("preview") %>
                                        </p>
                                    </article>
                                    <div class="container-fluid">
                                        <div class="col-md-6 ">
                                            <a href='View?ID=<%# Eval("ID") %>' class="btn btnload btn-lg">Read More</a>
                                            <%--<asp:button runat="server" id="btnLoadmore" Text="Read More" CssClass="btn btnload btn-lg"/>--%>
                                        </div>
                                        <div class="col-md-6 ">
                                            <h3 class="text-right">Comments</h3>
                                        </div>
                                    </div>
                                    
                                    
                                </asp:Panel>
                                <hr />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                <asp:Button runat="server" CssClass="btn btn-nav" ID="btnPrev" Text="PREV" OnClick="btnPrev_Click" />
         <asp:Button runat="server" CssClass="btn btn-nav" ID="btnNext" Text="NEXT" OnClick="btnNext_Click" /> 
            </div>
            <div class="col-md-3">
                <asp:GridView runat="server" ID="gvTopAnnouncement" AutoGenerateColumns="false" CssClass="container-fluid" style="border:transparent; margin-top:20px;">
                    <Columns>
              <asp:TemplateField HeaderText="TOP NEWS"  HeaderStyle-BackColor="lightgray" HeaderStyle-CssClass="widget-topnews hidden-xs">
                            <ItemTemplate>
                                <div class="capsule hidden-xs">
                                    <div class="right-news">
                                        <h3><a href='View?ID=<%# Eval("ID") %>'> <%# Eval("title") %></a></h3>
                                        <p><%# Eval("sneak_peak") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <hr />
                <div class="capsule hidden-xs">
                                    <div class="container-fluid fast-fact">
                                        <h2>FAST FACTS</h2>
                                        <hr />
                                          <h4>Country:</h4> 

                                        <h4>Region:</h4>
                                        <h4>District:</h4>
                                        <h4>Province:</h4>
                                        <h4>Area:</h4>
                                        <h4>Demonym:</h4>
                                          <h4>Founded:</h4>
                                          <h4>Total Population:</h4>
                                        <h4>Zip-code:</h4>
                                        
                                         
                                    </div>
                                </div>
            </div>
      <script>
   
      </script>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
