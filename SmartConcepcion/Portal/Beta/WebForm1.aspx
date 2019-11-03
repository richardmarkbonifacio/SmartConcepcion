<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SmartConcepcion.Portal.Beta.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <video id="video" width="215" height="150" autoplay="autoplay" style="margin-top: 10vh; background-color: none; z-index: 2 !important;"></video>
<canvas id="canvas" width="205" height="150" style="background-color: none;"></canvas>
<button id="snap" class="sexyButton" style="height: 30px; width: 100px; border: 0px; border-radius: 3px; margin-top: 8vh; margin-left: 13vw">Snap Photo</button>
<script>

// Put event listeners into place
window.addEventListener("DOMContentLoaded", function () {
// Grab elements, create settings, etc.
var canvas = document.getElementById("canvas"),
context = canvas.getContext("2d"),
video = document.getElementById("video"),
videoObj = { "video": true },
errBack = function (error) {
console.log("Video capture error: ", error.code);
};

// Put video listeners into place
if (navigator.getUserMedia) { // Standard
navigator.getUserMedia(videoObj, function (stream) {
video.src = stream;
video.play();
}, errBack);
} else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
navigator.webkitGetUserMedia(videoObj, function (stream) {
video.src = window.webkitURL.createObjectURL(stream);
video.play();
}, errBack);
} else if (navigator.mozGetUserMedia) { // WebKit-prefixed
navigator.mozGetUserMedia(videoObj, function (stream) {
video.src = window.URL.createObjectURL(stream);
video.play();
}, errBack);
}

// Trigger photo take
document.getElementById("snap").addEventListener("click", function () {
context.drawImage(video, 0, 0, 220, 150);
});
}, false);

</script>


</asp:Content>
