<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="Banking_System.Transactions" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <style>
       .warning {
	color: #9F6000;
	background-color: #FEEFB3;
	background-image: url('https://i.imgur.com/Z8q7ww7.png');





}
   

   </style>


<section id="main" class="coloured-section">
    
  
    
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
                 
                    <asp:Button ID="btnDepositCash" runat="server" Text="Deposit" CssClass="btn btn-success" OnClick="btnDepositCash_Click" />
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
               
                     <asp:Button ID="btnWithdrawcash" runat="server" Text="Withdraw" CssClass="btn btn-success" OnClick="btnWithdrawcash_Click" />
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

            <asp:TemplateField HeaderText="Deposit" SortExpression="Deposit" >
   
    <ItemTemplate>
        <asp:LinkButton ID="lnkDeposit" OnCommand="lnkDeposit_Command" runat="server"   Text="Deposit" CssClass="btn btn-info"  CommandArgument='<%# Eval("AccountID") %>' CommandName='<%# Eval("CustomerID") %>' />



    </ItemTemplate>
</asp:TemplateField>

         
            <asp:TemplateField HeaderText="Withdraw" SortExpression="Withdraw">
   
    <ItemTemplate>
        <asp:LinkButton ID="lnkWithdraw"  OnCommand="lnkWithdraw_Command" runat="server"  Text="Withdraw" CssClass="btn btn-info"  CommandArgument='<%# Eval("AccountID") %>' CommandName='<%# Eval("CustomerID") %>'    />



    </ItemTemplate>
</asp:TemplateField>

    </Columns>
    
    <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle"  CssClass="gridview"/>
          
</asp:GridView>

            <div runat="server" id="divWarning" class="warning" visible="false">
        <asp:Label ID="lblWarning" runat="server" ></asp:Label>
	</div>
        </div>


          
 
    </div>



       <div class="modal-dialog" role="document" style="max-width:95%">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="color:black" id="exampleModalLabel">Transfer Funds</h5>
                  
                </div>
                <div class="modal-body">
                   
                         <div class="input-group mb-3">

                                
                             <asp:DropDownList ID="ddlFrom" runat="server" placeholder="Select Account No" style="width:250px" CssClass="form-control" DataTextField="AccountID" DataValueField="AccountID" AppendDataBoundItems="True">
                                 <asp:ListItem Value="0">Select From</asp:ListItem>
                             </asp:DropDownList>

   
  

                              <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"></span>
                            </div>
                           
                                
            
                             <asp:DropDownList ID="ddlTo" runat="server" placeholder="Select Account No" style="width:250px" CssClass="form-control" DataTextField="AccountID" DataValueField="AccountID" AppendDataBoundItems="True">
                                 <asp:ListItem Value="0">Select To</asp:ListItem>
                             </asp:DropDownList>
                         <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"></span>
                            </div>

                                 <input type="text" runat="server" id="txtAmountFund" class="form-control" placeholder="Amount"
                                aria-label="Amount">
                     

                         <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"></span>
                            </div>

                                     <asp:Button ID="btnTransfere" runat="server" Text="Transfere" class="btn btn-success" data-dismiss="modal" OnClick="btnTransfere_Click" />

                          </div>


                        <div class="success" id="Divsuccess" runat="server" visible="false">
                            <asp:Label ID="lblSuccess" runat="server" ></asp:Label>
                        </div>
                    <div class="error" id="DivError" visible="false" runat="server">
                          <asp:Label ID="lblError" runat="server" ></asp:Label>
                    </div>

                        </div>
                          
                            
                            

                                 
          
                
            
            </div>
                
                 
                 <div class="modal-footer">
                
                         
                </div>
               
            </div>



















             <div class="modal-dialog" role="document" style="max-width:95%">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="color:black" id="exampleModalLabel">Transaction History</h5>
                  
                </div>
                <div class="modal-body">
                   
                         <div class="input-group mb-3">

                                
                           
                             <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" placeholder="Start Date"></asp:TextBox>

                             <ajaxToolkit:CalendarExtender ID="CalStartDate" runat="server" TargetControlID="txtStartDate" Format="dd/MMM/yyyy hh:mm" />

                              <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"></span>
                            </div>
                             <asp:TextBox ID="txtEndDate" runat="server"  CssClass="form-control" placeholder="End Date"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalEndDate" runat="server" TargetControlID="txtEndDate" Format="dd/MMM/yyyy hh:mm"/>

                         <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"></span>
                            </div>

                                 <input type="text" runat="server" id="txtSearchAmount" class="form-control" placeholder="Amount"
                                aria-label="Amount">
                                         
   <select runat="server" name="Transtype" id="ddlTransactiontype" class="form-control" placeholder="Transactiontype" style="width:250px">
   <option value="0">Select type</option>
  <option value="Deposit">Deposit</option>
  <option value="Withdraw">Withdraw</option>

</select>


                         <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"></span>
                            </div>

                                     <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-success" data-dismiss="modal" OnClick="btnSearch_Click" />

                          </div>


                        
                        </div>
                          
                            
                            

                                 
          
                
            
            </div>
                
                 
                 <div class="modal-footer">
                
                          <div class="container divtable">
     


<asp:GridView ID="GVTransaction" runat="server" CssClass="table GridView table-hover table-bordered"  allowpaging="True" AutoGenerateColumns="False" OnPageIndexChanging="GVTransaction_PageIndexChanging"  >
    <HeaderStyle CssClass="table-success" />
     <Columns>
      <asp:BoundField DataField="AccountID" HeaderText="Account.NO"  />
        <asp:BoundField DataField="TransactionDate" HeaderText="Date"/>
        <asp:BoundField DataField="TransactionType" HeaderText="Transaction" />
          <asp:BoundField DataField="Amount" HeaderText="Amount" />

    </Columns>

    <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="gridview" />

</asp:GridView>




    </div>
                </div>
               
            </div>


<%--    <div class="info" visible="false"></div>
	<div class="success" visible="false"></div>
	
	<div class="error" visible="false"></div>
	<div class="validation" visible="false"></div>
              --%>
     

    </section>




</asp:Content>
