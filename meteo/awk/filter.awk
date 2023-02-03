# BEGIN : excuted once in the beginningda
# BEGIN : excuted once in the beginning
# END : excuted once at the end
# -f filename : awk source
# -F separator 
# -v variable=???
# 'NF > 0' number of field >0
# 
# Extracts the needed columns and match lines with the filters (geo, coord, dates)

function makeTwirleS(twirle, sep, s,twLength,twSlength,i,left,l,r,right,arrN ,arr)
{
    s=twirle;
    twLength=length(twirle);
    twSlength=length(twirle) * ((length(twirle) <= 3) ? 20 : 2);

    for(right=twLength+1; right<=twSlength; right++)
       s=s "-";

    # left -> right
    for(i=1; i+twLength<=twSlength; i++) {
      l=r="";
      for(left=1; left<=i; left++)
         l=(l=="")? "-" : l "-";
      for(right=i+twLength+1; right<=twSlength; right++)
         r=(r=="")? "-" : r "-";
      s=s sep l twirle r;
    }

    # reverse the direction - right -> left
    arrN=split(s, arr, sep)
    for(i=arrN-1; i>1; i--)
       s=s sep arr[i];

    return s
}

BEGIN {
		# passed variables from the bash file meteo.sh (for each scope)
		# -v keys="$new_keys" -v values="$new_values"
		# -v day_col="$cut_day_col" -v tim_col="$cut_tim_col" -v lon_col="$cut_lon_col" -v lat_col="$cut_lat_col" -v spd_col="$cut_spd_col" -v ang_col="$cut_ang_col"
		# -v lon_filter="$lon_filter" -v lat_filter="$lat_filter" -v lat_min="$lat_min" -v lat_max="$lat_max" -v lon_min="$lon_min" -v lon_max="$lon_max" 
		# -v dat_filter="$dat_filter" -v dat_min="$dat_min" -v dat_max="$dat_max"
		CONVFMT="%.2f";
		OFMT="%.2f";
		PI=atan2(0, -1);
		
		# Progress bar
		PROGRESSdiv=1987
		if (!twirle) twirle="[]"
		# deal with the TWIRLE
			twirleS=makeTwirleS(twirle, SUBSEP);
			ntwirleA=split(twirleS, twirleA, SUBSEP);
		stderr="cat 1>&2";
		
		# generating output columns and count for keys
		split(keys,keycols,",");
		for (item in keycols) nbkeyscols+=1	;	
	
		# generating output columns and count for values
		split(values,valuecols,",") ;
		for (item in valuecols) nbvaluescols+=1;
		
		gsub("-","",dat_min);
		gsub("-","",dat_max);
}

progress && !( FNR % PROGRESSdiv ) {
    printf("\rawk: progress -> [%d] lines [%s]", FNR, twirleA[(++_twirle % ntwirleA+1)])  | stderr;
}

# LOOP
{
		# prepare data from current row by parsing coordinates and coverting to the needed date format and check variables for filtering
		if (lon_filter) longitude=$lon_col #+0.0;
		if (lat_filter) latitude=$lat_col#+0.0;
		if (dat_filter) {_date=$day_col; gsub("-","",_date);}		# date filter only work for the date excluding the hour
		
		# set conditions for coordinates filter
		Cond_gcoord=((!lon_filter) || ((longitude >= lon_min) && (longitude <= lon_max)));
		Cond_acoord=((!lat_filter) || ((latitude >= lat_min) && (latitude <= lat_max)));
	
		# set conditions for dates filter
		Cond_dates= ((!dat_filter) || ((_date >= dat_min) && (_date <= dat_max)));
			
		# output generation : all conditions should be met
		if ((NR > 1) && Cond_dates && Cond_acoord && Cond_gcoord) {
			# print key columns merged without separator in their order as described in ScopeDef
			# check if one value is null or empty then ignore the row
			empty_value=0;
			for (i = 1; i <= nbvaluescols; i++) {
				if ($valuecols[i]=="") {
					empty_value=1;
					break;
				}
			}
			if (!(empty_value)) {
				# no semi_comma as keys are concatenated to form a unique key
				for (i = 1; i <= nbkeyscols; i++) {
					value=keycols[i];
					output=$value;
					if (value == tim_col) output=sprintf("%2.2s", output);	# only get hour from the time column
					else if (value == day_col)	gsub("-","",output);		# remove "-" from de date 
					printf("%s",output);
				}
				printf ";" # now print semi_comma
				for (i = 1; i <= nbvaluescols; i++) {
					value=valuecols[i];
					output=$value;
					if (value == tim_col) value=sprintf("%2.2s", $value);		# no ; as keys are concatenated to form a unique key
					else if (value == day_col)	gsub("-","",value);
					else if (value == ang_col) {
						angle=$value;
						norm=$spd_col;
						$value= norm*cos(angle/360*PI);
						$spd_col=norm*sin(angle/360*PI);
						output=sprintf("%s;%s",$value,$spd_col);
						i++;
					} 
					printf("%s",output)
					if (i<nbvaluescols ) printf(";");
				}
				printf "\n";
			}
		}
}

END { 
		#print "end of scan"
		printf ("\r")  | stderr;
		
}
