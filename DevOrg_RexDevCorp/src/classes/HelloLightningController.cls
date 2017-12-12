public class HelloLightningController{

	@AuraEnabled
	public static Account getAccount(String accId){
		Account account = [SELECT Id, Name FROM Account WHERE Id =: accId LIMIT 1];
		return account;
	}
}