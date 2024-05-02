<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccountServices.aspx.cs" Inherits="Banking_System.AccountServices" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


      <style>
       .warning {
	color: #9F6000;
	background-color: #FEEFB3;
	background-image: url('https://i.imgur.com/Z8q7ww7.png');
}
   

          .auto-style1 {
              height: 24px;
          }
   

          </style>


<section id="main" class="coloured-section">
    
  
    <div runat="server" id="divWarning" class="warning" visible="false">
        <asp:Label ID="lblWarning" runat="server" ></asp:Label>
	</div>
    <!-- Deposit cash -->
   <%-- <div class="modal fade" id="Depositcash" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
        aria-hidden="true">--%>
 
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupDepositcash" runat="server" TargetControlID="btnDeposit" PopupControlID="PanelDepositcash" DropShadow="true" CancelControlID="CloseDeposit" >
         
         </ajaxToolkit:ModalPopupExtender>
       <asp:Button id="btnDeposit" runat="server" style="display:none;" />
     
   <asp:Panel ID="PanelDepositcash" CssClass="PanelMain" runat="server"  Style="display: none" >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <%--    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Deposit cash</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>--%>
                <div class="modal-body">
                   
                            <div class="input-group mb-3">
                            <input type="text" runat="server" disabled="disabled" id="txtBankBalanceDeposit" class="form-control" placeholder="Bank Balance"
                                aria-label="Bank Balance" aria-describedby="basic-addon2">
                          
                        </div>

                          <div class="input-group mb-3">
                            <input type="text" runat="server" id="txtCustomerNameDeposit" class="form-control" placeholder="Customer Name"
                                aria-label="Customer Name" aria-describedby="basic-addon2">
                          
                        </div>
                        <div class="input-group mb-3">
                           
      
   <select runat="server" name="ddlAccountType" id="ddlAccountTypeDeposit" class="form-control" placeholder="Select Account Type" aria-label="Select Account Type">
  <option value="Select Account Type">Select Account Type</option>
  <option value="Personal">Personal</option>
  <option value="Business">Business</option>

</select>
                          
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Rs</span>
                            </div>
                            <input type="text" runat="server" id="txtAmountDeposit" class="form-control" placeholder="Enter Amount"
                                aria-label="Amount">
                            <div class="input-group-append">
                                <span class="input-group-text">.00</span>
                            </div>
                        </div>

                </div>
                <div class="modal-footer">
                    <button type="button" id="CloseDeposit" runat="server" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 
                    <asp:Button ID="btnDepositCash" runat="server" Text="Deposit" CssClass="btn btn-success"  />
                </div>
            </div>
        </div>
       </asp:Panel>
  <%--  </div>--%>


              <ajaxToolkit:ModalPopupExtender ID="ModalPopupWithdrawcash" runat="server" TargetControlID="btnDeposit" PopupControlID="PanelWithdrawCash" DropShadow="true" CancelControlID="btncloseWithdrow"/>
              
        
         <asp:Button id="btnWithdraw" runat="server" style="display:none;" />
    <!-- Withdraw cash-->
  <%-- <div class="modal fade" id="Withdrawcash" tabindex="-1" role="dialog" aria-labelledby="exampleModalWithdrawcash"
        aria-hidden="true">--%>

             <asp:Panel ID="PanelWithdrawCash" CssClass="PanelMain" runat="server"  Style="display: none" >
      
        <div class="modal-dialog" role="document">
            <div class="modal-content">
              <%--  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalWithdrawcash">Deposit cash</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>--%>
                <div class="modal-body">
                
                            <div class="input-group mb-3">
                            <input type="text" runat="server" disabled="disabled" id="txtBankBalanceWithdraw" class="form-control" placeholder="Bank Balance"
                                aria-label="Bank Balance" aria-describedby="basic-addon2">
                            <span class="input-group-text" id="basic-addon2">@email.com</span>
                        </div>

                          <div class="input-group mb-3">
                            <input type="text" runat="server" id="txtCustomerNameWithdraw" class="form-control" placeholder="Customer Name"
                                aria-label="Customer Name" aria-describedby="basic-addon2">
                          
                        </div>
                        <div class="input-group mb-3">
                           
            
   <select runat="server" name="ddlAccountType" id="ddlAccountTypeWithdraw" class="form-control" placeholder="Select Account Type" aria-label="Select Account Type">
  <option value="Select Account Type">Select Account Type</option>
  <option value="Personal">Personal</option>
  <option value="Business">Business</option>

</select>
                          
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Rs</span>
                            </div>
                            <input type="text" runat="server" id="txtAmontWithdraw" class="form-control" placeholder="Enter Amount"
                                aria-label="Amount">
                            <div class="input-group-append">
                                <span class="input-group-text">.00</span>
                            </div>
                        </div>

             
                </div>
                <div class="modal-footer">
                    <button  type="button" runat="server" id="btncloseWithdrow"  class="btn btn-secondary" data-dismiss="modal">Close</button>
               
                     <asp:Button ID="btnWithdrawcash" runat="server" Text="Withdraw" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
             </asp:Panel>
          
<%--   </div>--%>
 
   
        
   
    <!-- table  -->
       <div class="container divtable">
        <div class="table-responsive">
         
<asp:GridView ID="GVaccount" runat="server" CssClass="table GridView table-hover table-bordered"  allowpaging="True" AutoGenerateColumns="False" OnPageIndexChanging="GVaccount_PageIndexChanging"  >
    <HeaderStyle CssClass="table-success" />
     <Columns>
      <asp:BoundField DataField="AccountID" HeaderText="Account.NO"  />
        <asp:BoundField DataField="FirstName" HeaderText="CustomerName" />
        <asp:BoundField DataField="AccountType" HeaderText="Account Type"/>
        <asp:BoundField DataField="Balance" HeaderText="Balance" />

    </Columns>

    <PagerStyle CssClass="gridview" HorizontalAlign="Center"/>

</asp:GridView>
       

        </div>


          
 
    </div>
         <div style ="overflow: auto; height:500px">

         <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5  style="color:black" class="modal-title" id="exampleModalWithdrawcash">Manage card</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                
                            <div class="input-group mb-3">
                       &nbsp;<br>
                                <br>
                                  <br />
                                <table  style="color:lightslategrey; text-align:left" class="modal-body">
                                    <tr>
                                        <td colspan="2">
                       <img src="images/visa.png" alt="Card details" width="150" height="100"></td>
                                    </tr>
                                    <tr>
                                        <td>  Card Type :
                             
                                   
                                        </td>
                                        <td>Debit</td>
                                    </tr>
                                    <tr>
                                        <td>Card Ending :
                                  
                                        </td>
                                        <td> 5632</td>
                                    </tr>
                                    <tr>
                                        <td>Name On Card :
                                 
                                        </td>
                                        <td>  <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name"></asp:Label>
                                            
                                       
                               </td>
                                    </tr>
                                    <tr>
                                        <td>Freeze your card :</td>
                                        <td>
                          <asp:CheckBox ID="chkboxfreezecard" runat="server"  />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Report your card lost or stolen :</td>
                                        <td class="auto-style1">
                           <asp:CheckBox ID="chkboxlostcard" runat="server"  />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Order a replacement card</td>
                                        <td>
                              <asp:CheckBox ID="chkboxrepcard" runat="server"  />
                                        </td>
                                    </tr>
                                   
                                </table>
                                <br>
                       
                        </div>

                    
             
                </div>
                <div class="modal-footer">
                   
               
                     <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
            
     
          <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 style="color:black" class="modal-title" >Manage Recurring Payments</h5>
                    
                </div>
                <div class="modal-body">
                
                            <div class="input-group mb-3">
                            <input type="text" runat="server"  id="txtComp" class="form-control" placeholder="Company/Individual Name"
                                aria-label="Bank Balance" aria-describedby="basic-addon2">
                          
                        </div>

                          <div class="input-group mb-3">
                            <input type="text" runat="server" id="Text5" class="form-control" placeholder="To Account/IBAN"
                                aria-label="To Account/IBAN" aria-describedby="basic-addon2">
                          
                        </div>
                        <div class="input-group mb-3">
                           
            
   <select runat="server" name="ddlAccountType" id="Select2" class="form-control" placeholder="Select Account Type" aria-label="Select Account Type">
  <option value="Select Account Type">Select From Account</option>
  <option value="Personal">Personal</option>
  <option value="Business">Business</option>

</select>
                          
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Rs</span>
                            </div>
                            <input type="text" runat="server" id="Text6" class="form-control" placeholder="Enter Amount"
                                aria-label="Amount">
                            <div class="input-group-append">
                                <span class="input-group-text">.00</span>
                            </div>
                        </div>

                      <div class="input-group mb-3">
                            <input type="text" runat="server" id="Text1" class="form-control" placeholder="Transfere Purpose"
                                aria-label="Transfere Purpose" aria-describedby="basic-addon2">
                          
                        </div>

                     <div class="input-group mb-3">
                           
                          <asp:Label ID="lbl" runat="server" Text="Do you want to make this transfer recurring" ForeColor="gray"></asp:Label>
                          &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox1" runat="server" />
                        </div>

             
                </div>
                <div class="modal-footer">
                    <button  type="button" runat="server" id="Button3"  class="btn btn-secondary" data-dismiss="modal">Close</button>
               
                     <asp:Button ID="Button4" runat="server" Text="Continue" CssClass="btn btn-success" />
                </div>
            </div>
        </div>

             </div>

    </section>





</asp:Content>
