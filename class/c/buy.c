void buy( )
{
	char start[10];
	char end[10]; 
	int date;
	char num[10]; 
	int i,j,k;
	int null=0;
	int ta,tb;
    double p;
	int find;
	int c; 
	printf("**********************************************************\n");
	printf("                ****�й���·����****\n");
	printf("\n");
    printf("                      ��Ʊҵ��\n");
    printf("\n");
    printf("          *��ܰ��ʾ������Ϥ���ο����Ȳ�ѯ*\n");
    printf("\n");
    printf("                  ----1.ǰ����ѯ\n"); 
	printf("                  ----2.��ʼ��Ʊ\n");
    printf("                  ----3.����\n"); 
    printf("\n");
	printf("**********************************************************\n");
	printf("                    ----#ѡ��"); 
	scanf("%d",&c);
	printf("\n");
	if(c==1) findtrain();
	else if(c==3) menu();
	else if(c==2)
	{
		  printf("**********************************************************\n");
	      printf("                ****�й���·����****\n");
	      printf("\n");
		  printf("                  ----��ʼվ��"); 
	      scanf("%s",start);
          printf("\n");
          printf("                  ----�յ�վ��"); 
          scanf("%s",end);
          printf("\n");
	      printf("                  -----���ڣ�"); 
	      scanf("%d",&date);
	      printf("\n");
	      printf("�ɹ��򳵴Σ�");  
	      for(i=0;i<tr.size();i++)
	      {
	         find=0;
	    	 for(j=0;j<tr[i].st.size();j++)
	    	 {
			   if(strcmp(tr[i].st[j].name,start)==0) 
			   {
			     find++;
			     ta=j;
			   }

			   if(strcmp(tr[i].st[j].name,end)==0) 
			   {
			      find++;
			      tb=j;
	    	   }
	         }
	    	   if(tb>ta)
	    	   {
	    	   	    p=tr[i].st[tb].price-tr[i].st[ta].price;
	    	        if(find==2)
	    	        {
	    	 	         if(date>=nowtime&&date<=nowtime+2)
	    	 	         {
	    	 	            printf("\n%s���г�: ��ʼվ��%s, %02d:%02d ����,�յ�վ:%s, %02d:%02d ����,\n��Ʊ��%d, Ʊ�ۣ�%.2lf\n",tr[i].trainno,start,tr[i].st[ta].go/100,tr[i].st[ta].go%100,end,tr[i].st[tb].arr/100,tr[i].st[ta].arr%100,tr[i].d[date-nowtime].left,p); 
	    	 	            null=1;
	    	 	         } 
	    	 	         
	    	 	         
	    	 	   }
	           }
	     }
	     struct buy temp;
	     struct wait temp2; 
	     int t;
	     int mark;
	     if(null==0)
	     {
	     		printf("    �������������ĳ��Σ���\n");
	     		printf("\n");
	     }
	     else
	     {
	     	    printf("            ----ѡ���򳵴Σ�");
	     	    scanf("%s",&num);
	     	    printf("\n");
	     	    for(i=0;i<tr.size();i++)
	            {
	            		if(strcmp(tr[i].trainno,num)==0)
	            		mark=i;
	            }
	     	    printf("            ----ѡ����������");
	     	    scanf("%d",&t);
	     	    printf("\n");
	     	    if(t>tr[mark].d[date-nowtime].left)
	     	    {
	     	    	  int choice;
	     	          printf("**********************************************************\n");
	                  printf("                 ****�й���·����****\n");
	                  printf("\n");
		              printf("                  ��Ʊ���㣬�Ƿ��Ŷӣ�"); 
                      printf("\n");
                      printf("                    ----1.�Ŷ�\n"); 
                      printf("                    ----2.����\n"); 
                      printf("\n");
                      printf("**********************************************************\n");
	                  printf("                    ----#ѡ��"); 
	                  scanf("%d",&choice);
	                  printf("\n");
	                  if(choice==2);
	                  else if(choice==1)
	                  {
	                  	 printf("**********************************************************\n");
	                     printf("                ****�й���·����****\n");
                         printf("\n");
                         printf("                 ----����������");
                         scanf("%s",temp2.name);
                         printf("\n");
                         temp2.sum=t;
                         tr[mark].d[date-nowtime].waiting.push_back(temp2);
					    printf("**********************************************************\n");
	                     printf("                ****�й���·����****\n");
                         printf("\n");
                         printf("            �Ŷӳɹ�������ʱ�����Ŷ���Ϣ��\n");
                         printf("\n");
                         printf("**********************************************************\n");
                         printf("\n");
	                  }
	                  
	      	    }
	     	    else
	     	    {
	     	    	for(i=0;i<t;i++)
	     	    	{
	     	             printf("**********************************************************\n");
	                     printf("                ****�й���·����****\n");
                         printf("\n");
                         printf("                 ----����������");
                         scanf("%s",temp.name);
                         printf("\n");
                         printf("                ----�������֤��");
                         scanf("%s",temp.num);
                         printf("\n");
                         strcpy(temp.start,start);
                         strcpy(temp.arr,end);
                        
                           tr[mark].d[date-nowtime].people.push_back(temp);
                           tr[mark].d[date-nowtime].left--;
                     }
                         
                         printf("**********************************************************\n");
	                     printf("                ****�й���·����****\n");
                         printf("\n");
                         printf("           ��Ʊ�ɹ����й���·ף��һ·˳�磡\n");
                         printf("\n");
                         printf("**********************************************************\n");
                         printf("\n");
	     	    }
	     }
	     buy(); 
    }
    else
    {
    	 	printf("**********************************************************\n");
	        printf("                ****�й���·����****\n");
	        printf("\n");
	        printf("              **ָ���������������**\n");
	        printf("\n");
	        buy();
    }
}
