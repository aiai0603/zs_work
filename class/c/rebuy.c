void push(int i,int j)
{
	
	int k,s;
	int choice;
	for(k=0;k<tr[i].d[j].waiting.size();k++)
	{
		if(tr[i].d[j].left>=tr[i].d[j].waiting[k].sum)
		{
			printf("**********************************************************\n");
	        printf("                ****�й���·����****\n");
	        printf("\n");
	        printf("                **�Ŷ�ԤԼ��������**\n");
	        printf("      %s���������Ĺ�Ʊ�����Ѿ����㣬�Ƿ�Ʊ\n",tr[i].d[j].waiting[k].name);
	        printf("\n");
	        printf("                    ----1.��Ʊ\n");
	        printf("                    ----2.����\n");
	        printf("\n");
	        printf("**********************************************************\n");
	        printf("                    ----#ѡ��"); 
	        scanf("%d",&choice);
	        printf("\n"); 
	    if(choice==1)
	    {
	    	char start[10];
	    	char end[10];
	        int ta,tb;
	        
		  printf("**********************************************************\n");
	      printf("                ****�й���·����****\n");
	      printf("\n");
		  printf("                  ----��ʼվ��"); 
	      scanf("%s",start);
          printf("\n");
          printf("                  ----�յ�վ��"); 
          scanf("%s",end);
          printf("\n");
          for(s=0;s<tr[i].st.size();s++)
	      {
			   if(strcmp(tr[i].st[s].name,start)==0) 
			   {
			     ta=s;
			   }

			   if(strcmp(tr[i].st[s].name,end)==0) 
			   {
			      tb=s;
	    	   }
	      }
	      double p=tr[i].st[tb].price-tr[i].st[ta].price;
	      struct buy temp;
	      printf("\n%s���г�: ��ʼվ��%s, %02d:%02d ����,�յ�վ:%s, %02d:%02d ����,\n��Ʊ��%d, Ʊ�ۣ�%.2lf\n",tr[i].trainno,start,tr[i].st[ta].go/100,tr[i].st[ta].go%100,end,tr[i].st[tb].arr/100,tr[i].st[ta].arr%100,tr[i].d[j-nowtime].left,p); 
	   
	     	    	for(s=0;s<tr[i].d[j].waiting[k].sum;s++)
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
                        
                           tr[i].d[j].people.push_back(temp);
                           tr[i].d[j].left--;
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
	        else if(choice==2);
	        else
	        {
	        		printf("**********************************************************\n");
	                printf("                ****�й���·����****\n");
	                printf("\n");
	                printf("              **ָ���������������**\n");
	                printf("\n");
	                push(i,j);
	        }
	        
	        
		}
		
}

void rebuy()
{
	 char num[20];
	 char no[10];
	 int date,i,j,k;
	 int find=0;
	 int choice; 
	 printf("**********************************************************\n");
	 printf("                 ****�й���·����****\n");
     printf("\n");
	 printf("                       ��Ʊ����\n"); 
	 printf("\n");
	 printf("                   ----1.������Ʊ\n"); 
	 printf("                   ----2.����\n"); 
	 printf("\n");
	 printf("**********************************************************\n");
	 printf("                    ----#ѡ��"); 
	 scanf("%d",&choice);
	 printf("\n");
	 if(choice==2) menu();
     else if(choice==1)
     {
     printf("**********************************************************\n");
	 printf("                 ****�й���·����****\n");
     printf("\n");
	 printf("                       ��Ʊ����\n"); 
	 printf("\n");
	 printf("                 ----�������֤:");
	 scanf("%s",num);
	 printf("\n");
	 printf("                 ----������Ʊ����:");
	 scanf("%s",no);
	 printf("\n");
	 printf("                 ----������Ʊ����:");
	 scanf("%d",&date);
	 printf("\n");
	 for(i=0;i<tr.size();i++)
	 {
	     if(strcmp(tr[i].trainno,no)==0)
	     {
	         for(j=0;j<tr[i].d.size();j++)
	    	 {
			     if(tr[i].d[j].date==date)
			     {
			       for(k=0;k<tr[i].d[j].people.size();k++)
			       {
			       	   if(strcmp(tr[i].d[j].people[k].num,num)==0)
			       	   {
			       	   	  find=1;
			       	   	  printf("**********************************************************\n");
	                      printf("                 ****�й���·����****\n");
                          printf("\n");
                          printf("     %s�ͻ���������%s,�ﵽ��%s,ȷ����Ʊ��\n",tr[i].d[j].people[k].name,tr[i].d[j].people[k].start,tr[i].d[j].people[k].arr); 
                          printf("\n"); 
	                      printf("                    ----1.ȷ��\n"); 
	                      printf("                    ----2.����\n"); 
	                      printf("\n");
	                      printf("**********************************************************\n");
	                      printf("                    ----#ѡ��"); 
	                      scanf("%d",&choice);
	                      printf("\n");
	                      if(choice==1)
	                      {
			       	   	    tr[i].d[j].people.erase(tr[i].d[j].people.begin()+k);
			       	   	    tr[i].d[j].left++;
			       	   	    printf("**********************************************************\n");
	                        printf("                ****�й���·����****\n");
                            printf("\n");
                            printf("               ��Ʊ�ɹ�����ӭ�´ι��٣�\n");
                            printf("\n");
                            printf("**********************************************************\n");
                            printf("\n");
                            
			       	   	  }
			       	   	  else if(choice==2);
			       	   	
			       	   	  else
			       	   	  {
			       	   	  		printf("**********************************************************\n");
	                            printf("                ****�й���·����****\n");
	                            printf("\n");
	                            printf("              **ָ���������������**\n");
	                            printf("\n");
			       	   	  }
			       	   }
			       }	
			     	
			     }
	         }
	 
	     }
	 }
	    if(find==0)
	    {
	 	printf("**********************************************************\n");
	    printf("                ****�й���·����****\n");
	    printf("\n");
	    printf("              **���޴�Ʊ������������**\n");
	    printf("\n");
	  
	    }
	    else
	    {
	    	  int choose,k,s;
	    	  for(k=0;k<tr[i].d[j].waiting.size();k++)
	          {
		           if(tr[i].d[j].left>=tr[i].d[j].waiting[k].sum)
		           {
			           printf("**********************************************************\n");
	                   printf("                ****�й���·����****\n");
	                   printf("\n");
	                   printf("                **�Ŷ�ԤԼ��������**\n");
	                   printf("      %s���������Ĺ�Ʊ�����Ѿ����㣬�Ƿ�Ʊ\n",tr[i].d[j].waiting[k].name);
	                   printf("\n");
	                   printf("                    ----1.��Ʊ\n");
	                   printf("                    ----2.����\n");
	                   printf("\n");
	                   printf("**********************************************************\n");
	                   printf("                    ----#ѡ��"); 
	                   scanf("%d",&choice);
	                   printf("\n"); 
	              }
	              if(choose==2);
	              else if(choose==1)
	              {
	              	   	    	char start[10];
	    	                    char end[10];
	                            int ta,tb;
	        
		                        printf("**********************************************************\n");
	                            printf("                ****�й���·����****\n");
	                            printf("\n");
		                        printf("                  ----��ʼվ��"); 
	                            scanf("%s",start);
                                printf("\n");
                                printf("                  ----�յ�վ��"); 
                                scanf("%s",end);
                                printf("\n");
                                
                                
	              }
	          }
       } 
     }
     else
     {
     		printf("**********************************************************\n");
	        printf("                ****�й���·����****\n");
	        printf("\n");
	        printf("              **ָ���������������**\n");
	        printf("\n");
     }
	 
	 rebuy();
	 
	                      
}

