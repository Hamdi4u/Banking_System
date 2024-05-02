<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccountManagement.aspx.cs" Inherits="Banking_System.CreateAccount" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <style>
        .modal-dialog {
    max-width: 95%;
   
}

 

    </style>
       <section id="main" class="coloured-section">
  
 
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <%--<div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Account Management</h5>
                  
                </div>--%>
                <div class="modal-body">
                  
                            <div class="input-group mb-3">
                           

   <select runat="server" name="ddlAccountType" id="ddlAccountType" class="form-control" placeholder="Select Account Type" aria-label="Select Account Type">
  <option value="Select Account Type">Select Account Type</option>
  <option value="Personal">Personal</option>
  <option value="Business">Business</option>

</select>




                         <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"></span>
                            </div>
                               
                                  <input type="text" runat="server" id="txtUserName" class="form-control" placeholder="User Name"
                                aria-label="User Name">

                                   <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"></span>
                            </div>
   
                                 <input type="text" runat="server" id="txtFirstName" class="form-control" placeholder="First Name" aria-label="First Name"/>

                             <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"></span>
                            </div>

                              
                            <input type="text" runat="server" id="txtLastName" class="form-control" placeholder="Last Name"
                                aria-label="Amount"/>
                        </div>

                          
                          <div class="input-group mb-3">
                           
                                <input type="text" runat="server" id="txtPhoneNumber" class="form-control" placeholder="Phone Number"
                                aria-label="Phone Number">
                               <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"></span>
                            </div>
                                <input type="text" runat="server" id="txtEmail" class="form-control" placeholder="Email"
                                aria-label="Email">

                               <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"></span>
                            </div>
                        
                            <input type="text" runat="server" id="txtAddress" class="form-control" placeholder="Address"
                                aria-label="Address">

                              <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"></span>
                            </div>
                        
                               <input type="text" runat="server" id="txtInitialBalance" class="form-control" placeholder="Initial Balance"
                                aria-label="Initial Balance" >

                        </div>
                      


             
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                   <asp:Button ID="btnCreate" runat="server" Text="Create" CssClass="btn btn-success" data-dismiss="modal" OnClick="btnCreate_Click" />

                </div>
            </div>
        </div>




      

    <!-- table  -->
      <div class="container divtable">
        <div class="table-responsive">
        <%--    <table class="table table-hover table-bordered">
                <thead>
                    <tr class="table-success">
                        <th scope="col">SR. No.</th>
                        <th scope="col">Name</th>
                        <th scope="col">E-mail ID</th>
                        <th scope="col">Bank Balance</th>
                    </tr>
                </thead>
                <tbody>
                    <tr >
                        <td scope="row">1</td>
                        <td>Ayush sharma</td>
                        <td>ayush@email.com</td>
                        <td>
                            <p id="ayushBankBalance">20000</p>
                        </td>
                    </tr>
                    <tr >
                        <td scope="row">2</td>
                        <td>Aman</td>
                        <td>aman@email.com</td>
                        <td>
                            <p id="amanBankBalance">68000</p>
                        </td>
                    </tr>
                    <tr >
                        <td scope="row">3</td>
                        <td>Neeraj</td>
                        <td>neeraj@email.com</td>
                        <td>
                            <p id="neerajBankBalance">25000</p>
                        </td>
                    </tr>
                    <tr >
                        <td scope="row">4</td>
                        <td>sam</td>
                        <td>sam@email.com</td>
                        <td>
                            <p id="samBankBalance">96000</p>
                        </td>
                    </tr>
                    <tr >
                        <td scope="row">5</td>
                        <td>Nilima</td>
                        <td>nilima@email.com</td>
                        <td>
                            <p id="nilimaBankBalance">12000</p>
                        </td>
                    </tr>
                    <tr >
                        <td scope="row">6</td>
                        <td>Raj</td>
                        <td>raj@email.com</td>
                        <td>
                            <p id="rajBankBalance">650000</p>
                        </td>
                    </tr>
                    <tr >
                        <td>7</td>
                        <td>Jasmin</td>
                        <td>jasmin@email.com</td>
                        <td>
                            <p id="jasminBankBalance">84000</p>
                        </td>
                    </tr>
                    <tr >
                        <td scope="row">8</td>
                        <td>Shreya</td>
                        <td>shreya@email.com</td>
                        <td>
                            <p id="shreyaBankBalance">59000</p>
                        </td>
                    </tr>
                    <tr >
                        <td scope="row">9</td>
                        <td>Om</td>
                        <td>om@email.com</td>
                        <td>
                            <p id="omBankBalance">35055</p>
                        </td>
                    </tr>
                    <tr >
                        <td scope="row">10</td>
                        <td>Zoya</td>
                        <td>zoya@email.com</td>
                        <td>
                            <p id="zoyaBankBalance">58000</p>
                        </td>
                    </tr>
                    <tr >
                        <td scope="row">11</td>
                        <td>arjit</td>
                        <td>arjit@email.com</td>
                        <td>
                            <p id="arjitBankBalance">35055</p>
                        </td>
                    </tr>
                    <tr >
                        <td scope="row">12</td>
                        <td>Shiva</td>
                        <td>shiva@email.com</td>
                        <td>
                            <p id="shivaBankBalance">35055</p>
                        </td>
                    </tr>
                </tbody>
            </table>--%>


<asp:GridView ID="GVaccount" runat="server" CssClass="table GridView table-hover table-bordered"  allowpaging="True" AutoGenerateColumns="False" OnPageIndexChanging="GVaccount_PageIndexChanging" OnRowDataBound="GVaccount_RowDataBound"  >
    <HeaderStyle CssClass="table-success" />
     <Columns>
      <asp:BoundField DataField="CustomerID" HeaderText="Customer.NO"  />
        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
          <asp:BoundField DataField="LastName" HeaderText="Last Name" />
        <asp:BoundField DataField="Email" HeaderText="Email"/>
        <asp:BoundField DataField="Balance" HeaderText="Balance" />

            <asp:TemplateField HeaderText="Edit" SortExpression="Edit">
   
    <ItemTemplate>
        <asp:LinkButton ID="lnkEdit" runat="server"  Text="Edit" CssClass="btn btn-info"  CommandArgument='<%# Eval("AccountID") %>' CommandName='<%# Eval("CustomerID") %>' NavigateUrl='<%# String.Format("~/AccountManagement.aspx?CustomerID={0}", Eval("CustomerID"))%>' OnCommand="lnkEdit_Command"   />
    </ItemTemplate>
</asp:TemplateField>

           <asp:TemplateField>
   
    <ItemTemplate>
        <asp:LinkButton ID="lnkDelete" runat="server"  Visible="false" Text="Close Account" CssClass="btn btn-info"  CommandArgument='<%# Eval("AccountID") %>' CommandName='<%# Eval("AccountID") %>' OnCommand="lnkDelete_Command"   />
    </ItemTemplate>
</asp:TemplateField>

    </Columns>

    <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="gridview" />

</asp:GridView>
 
  
            <div runat="server" id="divWarning" class="warning" visible="false">
        <asp:Label ID="lblWarning" runat="server" ></asp:Label>
	</div>
     

        </div>
    </div>
    </section>
</asp:Content>
