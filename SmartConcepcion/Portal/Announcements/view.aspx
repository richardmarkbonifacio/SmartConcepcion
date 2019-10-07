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
  padding: 1.5em;
  background: white;
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
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
 
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
    margin: 10px;
}
.newsimg{
   
  width: 100%;
  height: auto;
 
  margin-top: 20px;
}
.imgwidget{
     
width:90px;
height:90px;

}
</style>

    

<main>
  <section>
    <article>
        
        <img src="../../images/BANNER.jpg" alt="Nature" class="newsimg">
      <h2>Title</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec venenatis orci in ex iaculis, nec scelerisque mauris dapibus. Mauris sagittis imperdiet sem laoreet commodo. Phasellus malesuada id odio sed efficitur. Ut laoreet tincidunt neque ut mattis. Pellentesque et risus nisl. Phasellus et elit non quam scelerisque molestie non in enim. Fusce ut dui ut lorem suscipit consectetur nec sit amet ipsum. Cras rhoncus sem in fermentum semper. Sed ac venenatis ex, vel tempus mauris. In et porttitor purus, vitae faucibus nisi. Maecenas eleifend, neque vitae aliquet pretium, metus ante ullamcorper nibh, quis congue libero sem eu tellus.
        Etiam facilisis ipsum eget leo dapibus commodo. Morbi ac elit nec elit efficitur luctus tempor et libero. Sed ullamcorper tristique tortor id feugiat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut in eros vitae nisl laoreet viverra. Ut id nibh sodales, faucibus tellus quis, euismod dolor. Cras sodales velit in elit molestie gravida. Fusce ac diam hendrerit felis dignissim convallis.
        Sed ullamcorper molestie mauris, eget tincidunt libero tempor ut. In feugiat ante mi, nec tempor diam bibendum at. Integer aliquet, tortor at ultrices ullamcorper, est nisi auctor eros, eget lacinia ex ante in dolor. In eget vulputate nulla. Donec sit amet laoreet lectus. Morbi tempus sem ultrices porta mollis. Donec ac turpis in orci facilisis feugiat vitae eu dui.</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec venenatis orci in ex iaculis, nec scelerisque mauris dapibus. Mauris sagittis imperdiet sem laoreet commodo. Phasellus malesuada id odio sed efficitur. Ut laoreet tincidunt neque ut mattis. Pellentesque et risus nisl. Phasellus et elit non quam scelerisque molestie non in enim. Fusce ut dui ut lorem suscipit consectetur nec sit amet ipsum. Cras rhoncus sem in fermentum semper. Sed ac venenatis ex, vel tempus mauris. In et porttitor purus, vitae faucibus nisi. Maecenas eleifend, neque vitae aliquet pretium, metus ante ullamcorper nibh, quis congue libero sem eu tellus.
        Etiam facilisis ipsum eget leo dapibus commodo. Morbi ac elit nec elit efficitur luctus tempor et libero. Sed ullamcorper tristique tortor id feugiat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut in eros vitae nisl laoreet viverra. Ut id nibh sodales, faucibus tellus quis, euismod dolor. Cras sodales velit in elit molestie gravida. Fusce ac diam hendrerit felis dignissim convallis.
        Sed ullamcorper molestie mauris, eget tincidunt libero tempor ut. In feugiat ante mi, nec tempor diam bibendum at. Integer aliquet, tortor at ultrices ullamcorper, est nisi auctor eros, eget lacinia ex ante in dolor. In eget vulputate nulla. Donec sit amet laoreet lectus. Morbi tempus sem ultrices porta mollis. Donec ac turpis in orci facilisis feugiat vitae eu dui.</p>

    </article>
      <hr />
       <label for="subject">Leave a Comment</label>
    <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>

    <input type="submit" value="Submit" class="btn-formsubmit">
     
  </section>
  <aside>
    <div class=capsule>
        
        <div class="right-news">
      <h3>Widget Title</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
        </div>
     
    <div class=capsule>

         <div class="right-news">
      <h3>Widget Headline</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
        </div>
    <div class=capsule>
         <div class="right-news">
      <h3>Widget Headline</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
        </div>
 
    
       </aside>
</main>
  
     
</asp:Content>
