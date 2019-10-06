<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
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
.right-news {
  padding: 1.5em;
  background: white;
}
div h3 {
  color: indianred;
}
div p {
  color: lightcoral;
}
main {
  background: lavenderblush;
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
  color: indianred;
  line-height: 1.5;
}
.capsule {
  margin-left: auto;
  margin-right: auto;
  border: 1px solid lightpink;
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
</style>



<main>
  <section>
    <article>
      <h2>Headline</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec venenatis orci in ex iaculis, nec scelerisque mauris dapibus. Mauris sagittis imperdiet sem laoreet commodo. Phasellus malesuada id odio sed efficitur. Ut laoreet tincidunt neque ut mattis. Pellentesque et risus nisl. Phasellus et elit non quam scelerisque molestie non in enim. Fusce ut dui ut lorem suscipit consectetur nec sit amet ipsum. Cras rhoncus sem in fermentum semper. Sed ac venenatis ex, vel tempus mauris. In et porttitor purus, vitae faucibus nisi. Maecenas eleifend, neque vitae aliquet pretium, metus ante ullamcorper nibh, quis congue libero sem eu tellus.

Etiam facilisis ipsum eget leo dapibus commodo. Morbi ac elit nec elit efficitur luctus tempor et libero. Sed ullamcorper tristique tortor id feugiat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut in eros vitae nisl laoreet viverra. Ut id nibh sodales, faucibus tellus quis, euismod dolor. Cras sodales velit in elit molestie gravida. Fusce ac diam hendrerit felis dignissim convallis.

Sed ullamcorper molestie mauris, eget tincidunt libero tempor ut. In feugiat ante mi, nec tempor diam bibendum at. Integer aliquet, tortor at ultrices ullamcorper, est nisi auctor eros, eget lacinia ex ante in dolor. In eget vulputate nulla. Donec sit amet laoreet lectus. Morbi tempus sem ultrices porta mollis. Donec ac turpis in orci facilisis feugiat vitae eu dui.</p>
    </article>
  </section>
  <aside>
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
    <div class=capsule>
         <div class="right-news">
      <h3>Widget Headline</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
        </div>
  </aside>
</main>
    
</asp:Content>
