#include <stdio.h>
#define BOXLEN 5

int main(){


float box[BOXLEN] = {0};

char box_index = 0;

for (char i = 0; i <20;i++){
	box[i%BOXLEN] = i;
	
float accum = 0;
	for(char j=0;j<BOXLEN;j++){
	  accum += box[j]; 
      printf("box[%i]=%f\r\n",j,box[j]);
	}
	printf("mean(box)=%f\r\n\r\n",accum/5.0);

    

}

return 0;
}
