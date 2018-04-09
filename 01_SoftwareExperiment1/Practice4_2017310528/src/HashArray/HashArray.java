package HashArray;
import java.util.HashMap;
import java.util.ArrayList;

public class HashArray <K, V> {
	private HashMap <K, ArrayList<V>> hlist = new HashMap<K, ArrayList<V>>();
	public ArrayList<V> getArray(K k){
		return hlist.get(k);
	}
	public int getCount(K k) {
		if(!hlist.containsKey(k)) {
			return 0;
		}
		else {
			return hlist.get(k).size();
		}
	}
	
	public boolean addition(K k,V v) {
		 if(hlist.containsKey(k)) {
			 if(hlist.get(k).contains(v))
				 return false;
			 else {
				 hlist.get(k).add(v);
				 return true;
			 }
		 }
		 else {
			 ArrayList<V> temp = new ArrayList<V>();
			 temp.add(v);
			 hlist.put(k, temp);
			 return true;
		 }
	}
	public boolean search(K k, V v) {
		if(!hlist.containsKey(k)) {
			return false;
		}
		else {
			if(hlist.get(k).contains(v)) {
				return true;
			}
			else {
				return false;
			}
		}
	}
	public boolean delete(K k, V v) {
		if(search(k, v)) {
			hlist.get(k).remove(v);
			if(getCount(k)==0) {
				hlist.remove(k);
			}
			return true;
		}
		else {
			return false;
		}
	}
}
