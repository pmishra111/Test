public class Facebook {
private ApexPages.StandardController controller;
	public Facebook(ApexPages.StandardController controller) {
	this.controller = controller;
	}
    
    public PageReference save()
    {
  		controller.save(); // This takes care of the details for you.
  		PageReference congratsPage = Page.fb_new;
  		congratsPage.setRedirect(true);
  		return congratsPage;
	}  
}