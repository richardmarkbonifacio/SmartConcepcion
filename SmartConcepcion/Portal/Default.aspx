<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.WebForm1" %>
<asp:Content ID="main" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="upPostAnnouncement" >
        <ContentTemplate>
            <div class="container-fluid">
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Large Modal</button>

                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Create Announcement</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <div class="img-banner" runat="server" id="imgbanner">

                                    </div>
                                    <asp:TextBox runat="server" CssClass="form-control" placeholder="Title" ID="txtTitle" />
                                    <asp:TextBox runat="server" CssClass="form-control" placeholder="Subtitle" ID="txtSubtitle"/>
                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="txtDate" />

                                    <asp:TextBox runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Write something" ID="txtContent" />
                                    <asp:Image runat="server" ID="imgPreview" Height="300px" Width="100%"/>
                                    <asp:FileUpload runat="server" accept="image/*" multiple="false" ID="fuBanner" ClientIDMode="Static"  />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button runat="server" CssClass="btn btn-default" Text="POST" ID="btnPost" OnClick="Unnamed_Click" />
                                <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>

            

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPost" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:GridView runat="server" AutoGenerateColumns="false" ID="gvAnnouncements">
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="hidden">
                        <ItemTemplate>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
</asp:Content>
