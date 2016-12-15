<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="event_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

        <link href="../css/table.css" rel="stylesheet" />
 <h3>Events</h3>
           <table border="1">
                        <thead><tr><th>Type</th>
                            <th>Total Events</th>
                            <th>Percentage(%)</th>
                        
                            </tr></thead>
               <tbody>
    <asp:Repeater ID="rptCategory" runat="server">
         
            
                <ItemTemplate>
                    
                    <tr>
                  <td> 
                  
                            <%# Eval("key") %>
      
                        </td>
                        <td>
                            <%# Eval("count") %>

                        </td>
                
                    </tr>
                  
                </ItemTemplate>
          
    </asp:Repeater>
                   </tbody>
                   </table>
    <script>
        var total = 0;
        var count = document.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
        var tmp = count[0].getElementsByTagName("td")[0].innerHTML;
        for (i = 0; i < count.length; i++) {
           total+=count[i].getElementsByTagName("td")[1].innerHTML*1;
            
        }

        for (i = 0; i < count.length; i++) {
            var rowCount= count[i].getElementsByTagName("td")[1].innerHTML * 1;
            
            var t = document.createTextNode(( rowCount/ total*100).toFixed(2));
            var tdElement = document.createElement("td");
            tdElement.appendChild(t);
            count[i].appendChild(tdElement);
        }


    </script>
</asp:Content>

