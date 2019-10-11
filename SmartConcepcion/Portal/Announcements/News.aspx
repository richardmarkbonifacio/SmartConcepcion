<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.News" %>
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
}
.capsule {
  margin-left: auto;
  margin-right: auto;
  border: 1px solid lightpink;
}
hr{
    border:none;
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
                                            <h5><%# Eval("subtitle") %>,
                                            <i><%# Eval("datecreated", "{0:MMMM dd yyyy}") %></i></h5>

                                        </div>

                                        <p>
                                            <%# Eval("body_content") %>
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
            </div>
            <div class="col-md-3">
                <div class="capsule">
                    <div class="right-news">
                        <h3>Widget Headline</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
                <div class="capsule">
                    <div class="right-news">
                        <h3>Widget Headline</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
                <div class="capsule">
                    <div class="right-news">
                        <h3>Widget Headline</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>
