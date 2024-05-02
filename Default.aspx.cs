using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Banking_System.Objects;
using System.Data;
using System.Web.Security;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
namespace Banking_System
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();

            }

        }


    }
}