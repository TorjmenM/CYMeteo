BEGIN {
	split(grp_cols,grpcols,",")
	do_print = 0;
	stderr="cat 1>&2"
	#printf("from awk> grp_cols : %s", grp_cols)  | stderr;	
}
{
	if ((a != $1) && (grp_line!= "")) {
		print grp_line;
		a="";
	} 
	grp_line=""			
	for (i = 1; i <= NF; i++) {
		found=0;
		for (j in grpcols) {
			# print "from awk : processing col ",grpcols[j] | stderr
			if (grpcols[j] == i) 
			{ 
				found=1;
				#if ( a== "") { a=$1; arr[a,i]=0; count[a,i]=0; max[a,i]=$i; min[a,i]=$i;}
				a=$1
				arr[a,i]+=$i; 
				count[a,i]++; 
				if ( $i > max[a,i] ) max[a,i]=$i; 
				if ( (min[a,i]=="") || ($i < min[a,i] )) min[a,i]=$i; 
				c=sprintf("%.2f;%.2f;%.2f", max[a,i], min[a,i], arr[a,i]/count[a,i]);
				grp_line=sprintf("%s%s;",grp_line, c);
				# print i, ":", a, count[a,i], arr[a,i] , max[a,i], min[a,i] | stderr
				break;
			} else
				found=0;
		}
		if (found==0) 
			grp_line=sprintf("%s%s;",grp_line, $i);
	}
	
	#printf "a[%s] count[%s] arr[%s] min[%s] max[%s] \n",a,count[a],arr[a],min[a], max[a]  | stderr;
}
		
END { 
	if (grp_line!= "")
		print grp_line;
}



