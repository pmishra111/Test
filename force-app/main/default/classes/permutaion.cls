public class permutaion{
	public static void perm(List<String> lst,integer l,integer r){
		if(l==r)
		{
			system.debug(lst);
            //return;
		}
		else{
			for(integer i=1;i<=r;i++){
			lst = permutaion.permutation1(lst,l,i);
			perm(lst,l+1,r);
			lst = permutaion.permutation1(lst,l,i);
			}
			
		}
	}
	public static List<String> permutation1(List<String> str,integer l,Integer r){
		String s = str.get(l);
		str.set(l,str.get(r));
		str.set(r,s);
		return str;
	}
}