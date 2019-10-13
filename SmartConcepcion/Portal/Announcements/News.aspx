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

}
.capsule  + .capsule {
  border-top: none;
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
                <asp:Button runat="server" ID="btnPrev" Text="<<Prev" OnClick="btnPrev_Click" />
                <asp:Button runat="server" ID="btnNext" Text="Next>>" OnClick="btnNext_Click" />
            </div>
            <div class="col-md-3">
                <asp:GridView runat="server" ID="gvTopAnnouncement" AutoGenerateColumns="false" CssClass="container-fluid" style="border:transparent">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="hidden">
                            <ItemTemplate>
                                <div class="capsule">
                                    <div class="right-news">
                                        <h3><%# Eval("title") %></h3>
                                        <p><%# Eval("sneak_peak") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>
