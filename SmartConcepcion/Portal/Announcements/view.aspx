<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
h2 {
  font-size: 20pt;
  font-weight: 400;
  color: #303030;
}
p {
  margin: 0;
 
}
p + p {
  margin-top: .75em;
}
.right-news {
  padding: 3em;
  background: white;

}
.right-news i{
      text-align:justify;
}
div h3 {
  color: #303030;
}
div p {
  color: #333333;
}
main {
 
  padding-bottom: 1.5em;
}
main section,
main aside {
  padding: 1.5em;
  padding-bottom: 0;
}
main article {
  padding: 1.5em;
  background: white;
  border-radius: 3px;
}
main article p {
  color: #303030;
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
@media (min-width: 800px) {
  header,
  main {
    overflow: hidden;
  }
  main section,
  main aside {
    float: left;
    width: 40%;
  }
  main section {
    width: 60%;
    padding-right: 0;
  }
  header h1 {
    float: left;
  }
  header nav {
    float: right;
  }
}

input[type=text], select, textarea {
  width: 100% !important;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
}

input[type=submit] {
    border-width: 0;
    outline: none;
    border-radius: 2px;
    box-shadow: 0 1px 4px rgba(0, 0, 0, .6);
    background-color: #f99827;
    color: #ecf0f1;
    transition: background-color .3s;
   padding: 5px 35px 5px 35px;
    font-weight: 600;
margin-bottom:10px;
}

input[type=submit]:hover {
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
.newsimg{
   
  width: 100% !important;
  height: auto;
 
  margin-top: 20px;
}
.imgwidget{
     
width:90px;
height:90px;

}
.widget-topnews{
    font-weight:800;
    text-align:center;
    padding:15px;
     font-size:15px;
}
.table-comment{
    border-color:transparent;
}
.commentcount{
    color:#00ff00
}
.btn-comment{
    font-size:2rem;
}
.img-profile{
    
}
</style>

    

    <main>
        <section>
            <article>
                <asp:Image runat="server" AlternateText="Default" ID="imgBanner" CssClass="newsimg" />
                <%--<img src="../../images/BANNER.jpg" alt="Nature" class="newsimg">--%>
                <h2 runat="server" id="txtTitle">Title</h2>
                                     
                <asp:Label runat="server" ID="lblContent" CssClass="text-justify" />

            </article>

            <div class="container-fluid text-center">
                
                
                <asp:UpdatePanel runat="server" ID="upCommentSection" UpdateMode="Conditional">
                    <ContentTemplate>
                        <h3><i class="fa fa-comments" aria-hidden="true"></i>Comments
                        <asp:Label runat="server" ID="txtCommentCount" class="commentcount" />
                        </h3>
                        <div class="form-inline">
                            <div class="col-md-1">
                               
                                            <img class="profile-pic" id="profilepic" src="~/images/boy.png" runat="server"/>
                            </div>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="txtComment" placeholder="Write your comment.." CssClass="form-control form-control-sm" TextMode="MultiLine" Columns="1" />
                            </div>
                            <div class="col-md-1">
                                <asp:LinkButton runat="server" OnClick="btnComment_Click" CssClass="btn-comment"><i class="fa fa-paper-plane" aria-hidden="true"></i></asp:LinkButton>
                            </div>
                        </div>

                        <hr />

                        <asp:GridView runat="server" ID="gvCommentSection" AutoGenerateColumns="false" PageSize="20"
                            CssClass="table-responsive table-comment" style="width:100%">
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="hidden">
                                    <ItemTemplate>
                                        <div class="panel-heading"><b><%# Eval("submittedby") %> </b>, <i><%# Eval("datecreated", "{0:MMMM dd yyyy hh:mm tt}") %></i></div>
                                        <div class="panel-body"><%# Eval("comment") %></div>
                                        <hr />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <asp:Button runat="server" CssClass="btn btn-nav" ID="btnLoad" Text="Load More" OnClick="btnLoad_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            


        </section>

        <aside>
            <asp:GridView runat="server" ID="gvTopAnnouncement" AutoGenerateColumns="false" CssClass="container-fluid" style="border:transparent">
                    <Columns>
                        <asp:TemplateField HeaderText="TOP NEWS"  HeaderStyle-BackColor="lightgray" HeaderStyle-CssClass="widget-topnews hidden-xs">
                            <ItemTemplate>
                                <div class="capsule hidden-xs">
                                    <div class="right-news">
                                        <h3><a href='View?ID=<%# Eval("ID") %>'><%# Eval("title") %></a></h3>
                                       <b> <i><%# Eval("datecreated", "{0:MMMM dd yyyy}") %></i></b>
                                         
                                                   <p><%# Eval("sneak_peak") %></p>
                                      
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
        </aside>
    </main>
  
     
</asp:Content>
