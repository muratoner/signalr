<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MHG.SignalR.Chat.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<form id="form1" runat="server">
    <div>
        <input type="text" id="message"/>
        <input type="button" id="sendmessage" value="Send"/>
        <input type="hidden" id="displayname"/>
        <ul id="discussion">

        </ul>
    </div>
</form>
<script src="Scripts/jquery-1.6.4.min.js"></script>
<script src="Scripts/jquery.signalR-2.2.1.min.js"></script>
<script src='<%: ResolveClientUrl("~/signalr/hubs") %>'></script>
<script>
    $(function() {
        var chat = $.connection.chatHub;
        chat.client.addNewMessageToPage = function(name, message) {
            $('#discussion').append('<li><strong>' + htmlEncode(name)
                + '</strong>: ' + htmlEncode(message) + '</li>');
        };
        $("#displayname").val(prompt("Enter your name:", ''));
        $("#message").focus();
        $.connection.hub.start().done(function() {
            $("#sendmessage").click(function() {
                chat.server.send($("#displayname").val(), $("#message").val());
                $("#message").val("").focus();
            });
        });
    });

    function htmlEncode(value) {
        var encodedValue = $('<div />').text(value).html();
        return encodedValue;
    }
</script>
</body>
</html>