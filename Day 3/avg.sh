echo -n "Enter economics grade: "
read eco
echo -n "Enter OOP grade: "
read oop
echo -n "Enter uC grade: "
read uc
echo -n "Enter Disc. Maths grade: "
read dm
echo -n "Enter DAA grade: "
read daa

cr_eco=$(( 3*eco ))
cr_oop=$(( 4*oop )) 
cr_uc=$(( 4*uc ))
cr_dm=$(( 3*dm ))
cr_daa=$(( 4*daa ))

full=180

total=$(( $cr_daa+$cr_dm+$cr_uc+$cr_oop+$cr_eco ))
 
echo -n "Total SGPA: "
echo "10*$total/$full" | bc -l