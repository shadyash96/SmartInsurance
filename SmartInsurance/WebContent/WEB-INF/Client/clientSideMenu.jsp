<%String active=request.getParameter("active");%>
<div class="member-card-content">
    					<img class="hex" src="images/hexagon.png" alt="" />
              <ul>
    						<li <%=(active.equals("UserProfile")?"class=\"active\"":"")%>><a style="cursor:pointer;" onclick="redirect('clientProfile','Client')"><i class="fa fa-user icon"></i>User Profile</a></li>
    						<li <%=(active.equals("insuranceRequest")?"class=\"active\"":"")%>><a style="cursor:pointer;" onclick="redirect('insuranceRequests','Client')"><i class="fa fa-car icon"></i>Insurance Requests</a></li>
    						<li <%=(active.equals("insuredItems")?"class=\"active\"":"")%>><a style="cursor:pointer;" onclick="redirect('insuredItems','Client')"><i class="fa fa-car icon"></i>Insured Items</a></li>
    						<li <%=(active.equals("Payments")?"class=\"active\"":"")%>><a style="cursor:pointer;" onclick="redirect('Payments','Client')"><i class="fa fa-money icon"></i>Payments</a></li>
    						<li><a style="cursor:pointer;" onclick="redirect('MakeClaim','Client')"><i class="fa fa-plus icon"></i>Claim Request</a></li>
    						<li><a href="Logout"><i class="fa fa-reply icon"></i>Logout</a></li>
    					</ul>
    				</div>