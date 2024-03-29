
# Fibn.s - compute the nth Fibonacci number
#	
# C-code that this assembly code came from
#
# int fibn(void)
# {
#  int n = 8;		/* Compute nth Fibonacci number */
#  int f1 = 1, f2 = -1	/* last two Fibonacci numbers   */
#  
#  while (n != 0) {	/* count down to n = 0          */
#    f1 = f1 + f2;
#    f2 = f1 - f2;
#     n = n - 1;
#   }
#   return f1;
#  }
#
#
# Register usage: $3=n, $4=f1, $5=f2
# return value written to address 255
fibn:	addi $3, $0, 8		# initialize n = 8
	addi $4, $0, 1		# initialize f1 = 1
	addi $5, $0, -1		# initialize f2 = -1
loop:	beq $3, $0, end		# Done with loop if n = 0
	add $4, $4, $5		# f1 = f1 + f2
	sub $5, $4, $5		# f2 = f1 - f2
	addi $3, $3, -1		# n = n - 1
	j loop			# repeat until done
end:	sb $4, 255($0)		# store result in address 255



#      addi  $1, $0, 1     # initialize loop counter i = 1
#      addi  $6, $0, 15    # iterate as long as i < 15

#for:  slt   $2, $1, $6    # $2 = 1 if i < 15
#      beq   $2, $0, done  # if $2 wasn't set above, we're finished with loop

#fibn:	add   $3, $0, $1		# initialize n = i
#	    addi  $4, $0, 1		  # initialize f1 = 1
#	    addi  $5, $0, -1		# initialize f2 = -1
#loop:	beq   $3, $0, end		# Done with loop if n = 0
#	    add   $4, $4, $5		# f1 = f1 + f2
#	    sub   $5, $4, $5		# f2 = f1 - f2
#	    addi  $3, $3, -1		# n = n - 1
#      addi  $1, $1, 1     # increment i
#	    j     loop			    # repeat until done
#end:  sb    $4, 127($1)		# store result in address 127 + i

#done: