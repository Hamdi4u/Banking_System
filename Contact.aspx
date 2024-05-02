<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Banking_System.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    

<div id="frm" class="col-6" action="https://formspree.io/f/mjvjaelv" method="POST">
    <div class="form-group">
        <label for="formGroupExampleInput">Name</label>
        <input type="text" class="form-control" id="formGroupExampleInput" name="name" placeholder="Input Full Name">
      </div>
    <div class="form-group">
      <label for="exampleFormControlInput1">Email address</label>
      <input type="email" class="form-control" id="exampleFormControlInput1" name="email" placeholder="name@example.com">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput">Number</label>
        <input type="text" class="form-control" id="formGroupExampleInput" name="mobile" placeholder="Input Number">
      </div>
    <div class="form-group">
      <label for="exampleFormControlTextarea1">Message</label>
      <textarea class="form-control" id="exampleFormControlTextarea1" name="Message" rows="3"></textarea>
    </div>
    <button id="myBtn" type="submit" value="send" class="btn btn-primary">Submit</button>
  </div>

</asp:Content>
