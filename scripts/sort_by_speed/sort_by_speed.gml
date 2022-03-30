function sort_by_speed(chars, left, right) {

	if (ds_list_size(chars) == 0) exit;   

	var midChar = ds_list_find_value(chars, round((left + right) / 2));
			// the char in the middle of the list
	var pivotSPD = midChar.SPD; 
			// speed of midchar. used as pivot for quicksort
		
	var i = left; 
	var j = right; 

	// partition list
	while (i <= j) {
	
		var iChar = ds_list_find_value(chars, i);
		var jChar = ds_list_find_value(chars, j);
	
		while (iChar.SPD > pivotSPD) {
			i++;
			iChar = ds_list_find_value(chars, i);
		}
	
		while (jChar.SPD < pivotSPD) {
			j--;
			jChar = ds_list_find_value(chars, j);
		}
	
		if (i <= j) {
			ds_list_replace(chars, i, jChar);
			ds_list_replace(chars, j, iChar);
			i++;
			j--;
		}	
	
	}

	// recursion (perform sort_by_speed on each of the two partitions)
	if (left < j) {
		sort_by_speed(chars, left, j);
	}

	if (right > i) {
		sort_by_speed(chars, i, right);
	}



}
